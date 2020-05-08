#!/usr/bin/env ruby
require 'fileutils'
require 'date'

@github_repository = ARGV.shift

def epub_image(images_dir, action)
  fname = "#{images_dir}epub-cover.png"
  raise "Epub Cover Missing (#{fname})" if (action == 'epub' and !File.exist?(fname))
  return fname
end
def getBuildFilename(target, action)
  basename = @github_repository || File.basename(Dir.pwd)
  book_basename   = File.basename(target)
  basename        = "#{basename}-#{book_basename}-#{Date.today.strftime("%F") }"
  output_filename = "build/#{basename}.#{action}"
end
def makeProductionFile(action, target, source_files,bib_file=nil,csl_file=nil)
  images_dir      = "./#{target}/images/"
  templates_dir   = "/usr/local/share/templates/"
  version         = `git describe --abbrev=0 --tags` || 'none'
  version.strip!

  build_flags       = { }
  build_flags[:all] = <<-HEREDOC
    --lua-filter #{templates_dir}latex.lua \
    --metadata=version:#{version} \
    --metadata-file=.verkilo/metadata.yml
  HEREDOC
  build_flags[:epub] = <<-HEREDOC
    --css=#{templates_dir}style.css \
    --epub-cover-image=#{epub_image(images_dir, action)} \
    --template=#{templates_dir}epub.html \
    --webtex
  HEREDOC
  build_flags[:html] = <<-HEREDOC
    --css=#{templates_dir}style.css \
    --self-contained \
    --standalone --to=html5 \
    --webtex
  HEREDOC
  build_flags[:tex] = <<-HEREDOC
    --pdf-engine=xelatex \
    --template=#{templates_dir}pdf.tex \
    -V documentclass=book \
    --webtex
  HEREDOC
  build_flags[:pdf] = <<-HEREDOC
    --pdf-engine=xelatex \
    --template=#{templates_dir}pdf.tex \
    -V documentclass=book \
    --webtex
  HEREDOC
  build_flags[:md] = <<-HEREDOC
  HEREDOC
  build_flags[:docx] = <<-HEREDOC
    --reference-doc=#{templates_dir}reference.docx
  HEREDOC

  bibliography = (!bib_file.nil?) ? " --bibliography #{bib_file} " : ""
  bibliography += (!csl_file.nil?) ? " --csl #{csl_file} " : ""

  output_filename = getBuildFilename(target, action)
  puts "... creating #{output_filename}"
  args            = build_flags[:all] + build_flags[action.to_sym] + bibliography + "-o #{output_filename}"
  cmd             = "pandoc #{args.gsub(/\s+/, " ")} #{source_files}"

  FileUtils.mkdir_p("build/")
  puts `#{cmd}`
  return output_filename
end

Dir["**/.book"].each do |target|
  target = File.dirname(target)
  source_files = Dir["./#{target}/**/*.md"].sort
  text = source_files.map do |f|
    File.open(f,'r').read
  end.join("\n")
  raw = getBuildFilename(target, "raw.md")
  File.open(raw,'w').write(text)
  bib_file = Dir["./#{target}/**/*.bib"].first || nil
  csl_file = Dir["./#{target}/**/*.csl"].first || nil
  ['md','tex','html','epub','docx','pdf'].each do |action|
    makeProductionFile(action, target, source_files.join(" ") ,bib_file,csl_file)
  end
end
