#!/usr/bin/env ruby
require 'fileutils'

@github_repository = ARGV.shift

def epub_image(images_dir, action)
  fname = "#{images_dir}epub-cover.png"
  raise "Epub Cover Missing (#{fname})" if (action == 'epub' and !File.exist?(fname))
  return fname
end
def makeProductionFile(action, target, source_files)
  images_dir      = "./#{target}/images/"
  templates_dir   = "/usr/local/share/templates/"
  version         = `git describe --abbrev=0 --tags` || 'none'
  version.strip!

  build_flags       = { }
  build_flags[:all] = <<-HEREDOC
    --lua-filter #{templates_dir}latex.lua \
    --metadata=version:#{version} \
    --metadata-file=metadata.yml
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

  build_flags[:pdf] = <<-HEREDOC
    --pdf-engine=xelatex \
    --template=#{templates_dir}pdf.tex \
    -V documentclass=book \
    --webtex
  HEREDOC

  build_flags[:docx] = <<-HEREDOC
    --reference-doc=#{templates_dir}reference.docx
  HEREDOC

  basename = @github_repository || File.basename(Dir.pwd)
  book_basename   = File.basename(target)
  basename        = "#{basename}-#{book_basename}-#{Date.new.strftime("v%y.%m") }"
  output_filename = "build/#{basename}.#{action}"
  puts "... creating #{output_filename}"
  args            = build_flags[:all] + build_flags[action.to_sym] + "-o #{output_filename}"
  cmd             = "pandoc #{args.gsub(/\s+/, " ")} #{source_files}"

  FileUtils.mkdir_p("build/")
  # puts cmd
  puts `#{cmd}`
end

Dir["**/.book"].each do |target|
  target = File.dirname(target)
  source_files = Dir["./#{target}/**/*.md"].sort.join(" ")
  ['html','epub','docx','pdf'].each do |action|
    makeProductionFile(action, target, source_files)
  end
end
