#!/usr/bin/env ruby


fonts =<<HERE
<!-- fonts-available -->
**Fonts Available.** The fonts available for use are listed below. Submit an [issue](https://github.com/Merovex/verkilo-pandoc-book/issues) if you would like other fonts added.

#{Dir["pandoc-book-compile/fonts/*"].map { |f| "* #{File.basename(f).gsub('_', " ")}" }.join("\n")}

<!-- /fonts-available -->
HERE

File.open('docs/configuration/fonts-available.md','w').write(fonts)
