#!/usr/bin/env ruby

require 'yaml'

pattern = %r{<!-- (.*?) -->(.*?)<!-- \/\1 -->}m
template_file = ".README-template.md"
content = File.read(template_file)
output_file   = "README.md"

sections = {
  "location" => {
    :list     => [],
    :sortby   => :name,
    :template => "* **[%{name}](%{filename}).** %{summary}\n",
    :header   => ""
  },
  "major-character" => {
    :list     => [],
    :sortby   => :name,
    :template => "* **[%{name}](%{filename})** (%{season})\n%{summary}\n",
    :header   => ""
  },
  "season" => {
    :list     => [],
    :sortby   => :order,
    :template => "| **[%{order}](%{filename})** | %{summary} |\n",
    :header   => "| # | Synopsis |\n| :-: | - |\n"
  },
  "trope" => {
    :list     => [],
    :sortby   => :name,
    :template => "* **[%{name}](%{filename}).** %{summary}\n",
    :header   => ""
  },
}

Dir["./**/*.md"].each do |mdfile|
  next if mdfile.include?('trash')
  next if mdfile.include?(output_file)
  next if mdfile.include?(template_file)
  # Grab major content sections
  if File.read(mdfile).match(pattern)

    s = "<!-- #{$1} -->\n#{$2.strip}\n[Read more](#{mdfile})\n<!-- /#{$1} -->"
    content.gsub!("<!-- #{$1} -->", s)
    next
  end

  # Build list sections
  begin
    y = YAML.load_file(mdfile)
    next if sections[y['type']].nil?
    sections[y['type']][:list] << {
      :name     => y['name'] ,
      :role     => y['role'],
      :order    => y['order'],
      :season   => y['season'],
      :summary  => y['summary'],
      :filename => mdfile,
    } if y.is_a? Hash
  rescue Exception
  end
end

sections.keys.each do |key|
  section = sections[key][:header] || ""
  order   = sections[key][:sortby] || :name
  sections[key][:list].sort_by { |k| k[order] }.each do |i|
    section << sections[key][:template] % i
  end
  content.gsub!("<!-- #{key}-section -->", section)
end
toc = ""
content.scan(/^##\s?(.*)\n/iu).flatten.each do |header|
  next if header == 'Contents'
  indent = ""
  header.gsub!(/#\s?+/) { indent += "  "; "" }
  anchor = header.downcase.gsub(/\W+/,'-').chomp('-')
  toc << "%s* [%s](#%s)\n" % [indent,header,anchor]
end
content.gsub!("<!-- toc -->", toc)
File.open(output_file,'w').write(content)
