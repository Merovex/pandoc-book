#!/usr/bin/env ruby

require 'fileutils'
require 'yaml'
require 'base64'

pattern = %r{<!-- (.*?) -->(.*?)<!-- \/\1 -->}m
template_file = ".README-template.md"
content = File.read(template_file).gsub(/\A---.*?---/m,'').strip
output_file   = "./README.md"

begin
  sections = YAML.load_file(template_file)
rescue
  puts "... Template File lacks Frontmatter. Fix this."
  exit 1
end

puts "Running Readme compile on (#{Dir.pwd})"
FileUtils.cp("/.README-template.md", template_file) unless File.exists?(template_file)

Dir["./**/*.md"].each do |mdfile|
  next if mdfile.include?('trash')
  next if mdfile.include?(output_file)
  next if mdfile.include?(template_file)
  # Grab major content sections
  if File.read(mdfile).match(pattern)
    puts "Found #{$1} (#{File.basename(mdfile)})"
    s = "<!-- #{$1} -->\n#{$2.strip}\n[Read more](#{mdfile})\n<!-- /#{$1} -->"
    content.gsub!("<!-- #{$1} -->", s)
    next
  end

  # Build list sections
  begin
    y = YAML.load_file(mdfile)
    next if sections[y['type']].nil?
    sections[y['type']]["list"] = [] if sections[y['type']]["list"].nil?
    sections[y['type']]["list"] << {
      :name     => y['name'] ,
      :role     => y['role'],
      :order    => y['order'],
      :season   => y['season'],
      :summary  => y['summary'],
      :filename => mdfile,
    } if y.is_a? Hash
  rescue
  end
end

begin
  sections.keys.each do |key|
    puts "Creating '#{key}' section"
    section = sections[key]['header'] || ""
    order   = sections[key]['sortby'] || :name
    sections[key]["list"].sort_by { |k| k[order] }.each do |i|
      section << sections[key]['template'] % i
    end
    content.gsub!("<!-- #{key}-section -->", section)
  end
rescue
  puts "... Template File does not have sections. You might want to fix that."
end


puts "Creating Table of Contents"
toc = "## Contents\n\n"
content.scan(/^##\s?(.*)\n/iu).flatten.each do |header|
  next if header == 'Contents'
  indent = ""
  header.gsub!(/#\s?+/) { indent += "  "; "" }
  anchor = header.downcase.gsub(/\W+/,'-').chomp('-')
  toc << "%s* [%s](#%s)\n" % [indent,header,anchor]
end
content.gsub!("<!-- toc -->", toc)
content.gsub!("<!-- time -->", Time.now.strftime("%F %R %Z"))

if (ENV["REPO_NAME"])
  branch = ""
  branch = "?ref=#{ENV['BRANCH']}" if (ENV['BRANCH'])
  begin
    url = "https://api.github.com/repos/#{ENV["REPO_NAME"]}/contents/README.md#{branch}"
    sha = YAML.load(`curl -s -X GET #{url}`)['sha']
    res = `curl -s -X PUT #{url} \
    -H "Authorization: token #{ENV["GITHUB_TOKEN"]}" \
    -d @- << EOF
    {
      "message": "[skip ci] Compile README automatically",
      "committer": {
        "name": "Pandoc Book Bot",
        "email": "ben@merovex.com"
      },
      "content": "#{Base64.encode64(content)}",
      "sha": "#{sha}"
    }`
    puts "Success"
    exit 0
  rescue => error
    puts "Error (#{error}): #{error.message}"
    exit 1
  end
else
  File.open(output_file,'w').write(content)
end
# puts Base64.decode64(content)
