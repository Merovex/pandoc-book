#!/usr/bin/env ruby
require 'fileutils'
require 'date'

@github_repository = File.basename(ARGV.shift || "none")
@templates_dir   = "/usr/local/share/templates/"

@version         = `git describe --abbrev=0 --tags` || 'none'
@version.strip!
@version = 'none' if @version.empty?

@build_flags = {}
@build_flags[:all] = <<-HEREDOC
  --lua-filter #{@templates_dir}latex.lua \
  --metadata=version:#{@version} \
  --metadata-file=.verkilo/defaults.yml
HEREDOC
def parse_metadata(source)
end
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

  @build_flags[:epub] = <<-HEREDOC
    --css=#{@templates_dir}style.css \
    --epub-cover-image=#{epub_image(images_dir, action)} \
    --template=#{@templates_dir}epub.html \
    --webtex
  HEREDOC
  @build_flags[:html] = <<-HEREDOC
    --css=#{@templates_dir}style.css \
    --self-contained \
    --standalone --to=html5 \
    --webtex
  HEREDOC
  @build_flags[:front] = <<-HEREDOC
    --pdf-engine=xelatex \
    --template=#{@templates_dir}frontmatter.tex \
    --webtex
  HEREDOC
  @build_flags[:tex] = <<-HEREDOC
    --pdf-engine=xelatex \
    --template=#{@templates_dir}pdf.tex \
    -V documentclass=memoir \
    -V has-frontmatter=true \
    -B build/frontmatter.tex \
    --webtex
  HEREDOC
  @build_flags[:pdf] = @build_flags[:tex]
  @build_flags[:md] = <<-HEREDOC
  HEREDOC
  @build_flags[:docx] = <<-HEREDOC
    --reference-doc=#{@templates_dir}reference.docx
  HEREDOC

  bibliography  = (!bib_file.nil?) ? " --bibliography #{bib_file} " : ""
  bibliography += (!csl_file.nil?) ? " --csl #{csl_file} " : ""

  output_filename = getBuildFilename(target, action)
  puts "... creating #{output_filename}"
  args            = @build_flags[:all] + @build_flags[action.to_sym] + bibliography + "-o #{output_filename}"
  cmd             = "pandoc #{args.gsub(/\s+/, " ")} #{source_files}"

  puts `#{cmd}`
  return output_filename
end
def texPrebuild(src, dst)
  flags = @build_flags[:all].gsub(/\s+/, " ")
  cmd = "pandoc --pdf-engine=xelatex #{flags} --template=#{@templates_dir}#{dst}.tex -o build/#{dst}.tex #{src}"
  puts `#{cmd}`
end
FileUtils.mkdir_p("build/")
Dir["**/.book"].each do |target|
  target = File.dirname(target)
  text = Dir["./#{target}/**/*.md"].sort.map do |f|
    File.open(f,'r').read
  end.join("\n")

  # One file to work from for consistency & debugging
  source_file = getBuildFilename(target, "compiled.md")
  f = File.open(source_file,'w')
  f.write(text)
  f.close()
  bib_file = Dir["./#{target}/**/*.bib"].first || nil
  csl_file = Dir["./#{target}/**/*.csl"].first || nil

  # Build physical book
  %w(header frontmatter).each {|d| texPrebuild(source_file, d)}
  %w(tex pdf).each do |action|
    makeProductionFile(action, target, source_file, bib_file,csl_file)
  end
  # Build ebook
  %w(docx html epub).each do |action|
    makeProductionFile(action, target, source_file, bib_file,csl_file)
  end unless @github_repository == 'none'
  exit if @github_repository == 'none'
end
