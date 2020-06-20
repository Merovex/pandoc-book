#!/usr/bin/env ruby
require 'fileutils'
require 'date'

@starting          = Time.now
@github_repository = ARGV.shift
@templates_dir     = "/usr/local/share/templates/"
@tmp_dir           = "/tmp/"
@version           = `git describe --abbrev=0 --tags` || 'none'
@version.strip!
@version = 'none' if @version.empty?

def epub_image(target)
  fname = "covers/#{File.basename(target)}-epub.png"
  raise "Epub Cover Missing (#{fname})" unless File.exist?(fname)
  return fname
end
def getBuildFilename(src, ext)
  dst = [
    File.basename((@github_repository.nil?) ? Dir.pwd : @github_repository),
    File.basename(src),
    @starting.strftime("%F")
  ].join('-') + ".#{ext}"
  File.join(["build",File.basename(src), dst])
end
def flags(target, action=nil)
  css_file = if File.exist?(".verkilo/style.css")
    ".verkilo/style.css"
  else
    "#{@templates_dir}style.css"
  end

  f = %Q(
    --lua-filter #{@templates_dir}latex.lua \
    --metadata=version:#{@version} \
    --metadata-file=.verkilo/defaults.yml \
    --fail-if-warnings
  ) + case action
    when 'docx'
      %Q(
        --reference-doc=#{@templates_dir}reference.docx
      )
    when 'epub'
      %Q(
        --css=#{css_file} \
        --epub-cover-image=#{epub_image(target)} \
        --template=#{@templates_dir}epub.html \
        --webtex
      )
    when 'html'
      %Q(
        --css=#{css_file} \
        --self-contained \
        --standalone --to=html5 \
        --template=#{@templates_dir}epub.html \
        --html-q-tags
        --webtex
      )
    when 'tex', 'pdf'
      %Q(
        -B #{@tmp_dir}#{File.basename(target)}-frontmatter.tex \
        --pdf-engine=xelatex \
        --template=#{@templates_dir}template.tex \
        -V documentclass=memoir \
        -V has-frontmatter=true \
        -V indent=true \
        --webtex
      )
    when 'docbook'
      %Q(-t docbook)
    when 'yaml'
      %Q(
        -t markdown \
        --template=#{@templates_dir}yaml.md
      )
    when 'frontmatter'
      %Q(
        --pdf-engine=xelatex
        --template=#{@templates_dir}#{action}.tex
      )
    else
      ""
  end
  f.strip.gsub(/\s+/, " ")
end

def pandoc(src, dst, *flags)
  puts "Build #{dst}"
  cmd = "pandoc -o #{dst} #{flags.join(" ").gsub(/\s+/," ").strip} #{src}"
  # puts cmd
  puts `#{cmd}`
end


Dir["**/.book"].each do |target|
  target = File.dirname(target)
  FileUtils.mkdir_p("build/#{File.basename(target)}")

  # Combine into one file for consistency & debugging
  src = getBuildFilename(target, "src.md")
  t = Dir["./#{target}/**/*.md"].sort.map do |f|
    "###### #{f}\n\n#{File.open(f,'r').read}\n\n"
  end.join()
  f = File.open(src,'w')
  f.write(t)
  f.close()

  # Capture Bibliography and Citation format if present
  bib = Dir["./#{target}/**/*.bib"].first || nil
  csl = Dir["./#{target}/**/*.csl"].first || nil
  bib = (bib.nil?) ? "" : " --bibliography #{bib}"
  csl = (csl.nil?) ? "" : " --csl #{csl}"

  # Prebuild the frontmatter for PDF
  %w(frontmatter).each {|type|
    pandoc(src, "#{@tmp_dir}#{File.basename(target)}-#{type}.tex", flags(target, type))
  }
  %w(tex pdf).each do |action|
    puts "Slow compile..."
      pandoc(src, getBuildFilename(target, action), flags(target, action), bib, csl)
    end if @github_repository.nil?
  exit if @github_repository.nil?

  %w(yaml tex pdf docx html epub docbook).each do |action|
    fork do
      pandoc(src, getBuildFilename(target, action), flags(target, action), bib, csl)
    end
  end unless @github_repository.nil?
end
Process.waitall

elapsed = Time.now - @starting
puts "Elapsed time %3.1f" % elapsed
