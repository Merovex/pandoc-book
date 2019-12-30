#!/usr/bin/env ruby


fonts =<<HERE
<!-- fonts-available -->
#### Fonts Available

#{Dir["pandoc-book-compile/fonts/*"].map { |f| "* #{File.basename(f).gsub('_', " ")}" }.join("\n")}

<!-- /fonts-available -->
HERE

File.open('docs/configuration/fonts-available.md','w').write(fonts)
