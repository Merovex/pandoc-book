![Logo of the project](/my-book/images/logo-sm.png)

# Pandoc Novel
> Simple toolchain for publishing books in PDF, epub, mobi, using Markdown & Pandoc

[![Last Commit](https://img.shields.io/github/last-commit/merovex/pandoc-novel.svg)](https://github.com/merovex/pandoc-novel/branches)

A brief description of your project, what it is used for and how does life get
awesome when someone starts to use it.

## Use Cases

* Author of fiction
* Author of non-fiction

## Installing / Getting started

To use this template, clone the repository locally. Copy the contents of the `my-book/` directory as the new book you want to write (changing the name as appropriate). Then create a git repository of the new book.

Commands you can execute:

```
make clean
make docx
make html
make mobi
make pdf
```

### Initial Configuration

Some projects require initial configuration (e.g. access tokens or keys, `npm i`).
This is the section where you would document those requirements.

## Features

The Pandoc Novel converts Markdown to the following formats:

* DOCX - Output into Microsoft Word, formatted for working with an editor.
* EPUB - Suitable for release on non-Amazon ebook platforms
* HTML - Suitable for preview in a browser.
* MOBI - Suitable for release on Amazon's ebook platform.
* PDF - Using LaTeX in the default form factor for Amazon publishing (6"x9")

## Configuration

### Metadata.yml

#### Title
Type: `String` Default: `A Song of Stone`

#### Subtitle
Type: `String` Default: `This is a work of fiction`

#### Author
Type: `String` Default: `Ben Wilson`

#### Website

Type: `String` Default: `https://merovex.com`

### Imprint

Type: `String` Default: `images/logo.png`

### toc

Type: `bool` Default: `false`

### other-titles:

Type: `Array of Strings`

#### Firstprint
[10,1,1970]

#### Publisher

Type: `String` Default: `Merovex Press`

#### Rights

Type: `String` Default: `Copyright © 2019 Ben Wilson`

#### Disclaimer

Type: `String` Default:

```
This is a work of fiction. Names, characters, places and incidents are either the product of the author's imagination or are used fictitiously, and any resemblance to actual persons, living or dead, business establishments, events or locales is entirely coincidental.
```

This field describes what legal disclaimer the author asserts.

### Reservation

Type: `String` Default:

```
No part of this publication may be reproduced, stored in a retrieval system, posted on the Internet, or transmitted, in any form or by any means, electronic, mechanical, photocopying, recording, or otherwise, without prior written permission from the author. The only exception is by a reviewer, who may quote short excerpts in a review.
```

This field describes what rights are reserved.


### LCCN
Type: `String` Default: `blank`

This is the [Library of Congress Control Number](http://www.loc.gov/publish/pcn/)

### ISBN

Type: `Array of Strings`

This is an array of strings added to the copyright page sharing all of the relevant ISBNs assigned to this work in its various formats.

#### Identifier

-scheme: ISBN-13
-text:   isbn13:9-78098-3952-107

This is an array of strings added to the EPUB metadata sharing the epub identifier.

#### Credits:
Type: `Array of Strings`

This is an array of credits given to cover artists, editors, etc.

#### Country

Type: `String` Default: `Printed in the United States of America`


#### Links-As-Notes

Type: `bool` Default: `true`

This setting makes URLs in text footnotes in the PDF format.

#### Fontsize

Type: `String` Default: `10pt`

This is the PDF font size. Combined other PDF page settings, it provides the acceptable industry number of words per page and readability

#### Linestretch: 1.1

Type: `String` Default: `1.1`

This is the PDF line height.. other PDF page settings, it provides the acceptable industry number of words per page and readability

#### fontfamily: "merriweather" # http://www.tug.dk/FontCatalogue

#### Geometry

Type: `String` Default: `paperwidth=6in,paperheight=9in,left=0.875in,right=0.625in,top=0.825in,bottom=0.825in,twoside`

This creates the 6"x9" form factor recommended by Amazon's POD book publishing with acceptable margins and gutter. Combined other PDF page settings, it provides the acceptable industry number of words per page and readability.


### Makefile

...

## Contributing

If you'd like to contribute, please fork the repository and use a feature
branch. Pull requests are warmly welcome. See [Contributions](/CONTRIBUTING.md) for more information.

## Links

Even though this information can be found inside the project on machine-readable
format like in a .json file, it's good to include a summary of most useful
links to humans using your project. You can include links like:

- Project homepage: https://your.github.com/awesome-project/
- Repository: https://github.com/your/awesome-project/
- Issue tracker: https://github.com/your/awesome-project/issues
- In case of sensitive bugs like security vulnerabilities, please contact
  my@email.com directly instead of using issue tracker. We value your effort
  to improve the security and privacy of this project!
- Related projects:
- Your other project: https://github.com/your/other-project/
- Someone else's project: https://github.com/someones/awesome-project/

## Acknowledgements

My earlier forays into plaintext to Novel were in LaTeX, then a [custom-modified Ruby approach](https://github.com/Merovex/verku). This toolchain is a pivot to a simpler toolchain and its inspiration owes appreciation to:

* Scott Selisker, [A Plain Text Workflow for Academic Writing with Atom](http://u.arizona.edu/~selisker/post/workflow/) & KDheepak, [Writing Technical Papers with Markdown](https://blog.kdheepak.com/writing-papers-with-markdown.html). Both encouraged me to re-build a toolchain.
* Dennis Tenen and Grant Wythoff, [Sustainable Authorship in Plain Text using Pandoc and Markdown](https://programminghistorian.org/en/lessons/sustainable-authorship-in-plain-text-using-pandoc-and-markdown), for encouraging me to focus on Pandoc for the toolchain.
* Pascal Wagler, [Eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template), for giving away that one can pull down the stock Pandoc LaTeX template and modify it.
* BP, [Pandoc Google Group](https://groups.google.com/forum/?utm_medium=email&utm_source=footer#!msg/pandoc-discuss/JVAKdezOoVg/RCY30ypTEQAJ), for helping me change the Horizontal Rule into a Plain Fancy Break.
* [Memoir class](https://ctan.org/pkg/memoir?lang=en), for having code on Plain Fancy Break that I was able to copy over.

baugust3@masonlive.gmu.edu,
daily.j.g88@gmail.com,
freddi.arce@gmail.com,
pushpa.jayapal@gmail.com,
e.eshupp@nodetus.com,
nvinta@masonlive.gmu.edu,
dausha@gmail.com,
keith.wojciech@telos.com,
siravecclasse@gmail.com,
miketatum@yahoo.com,
bruhalm@yahoo.com

## Licensing

The code in this project is licensed under a BSD-3 [license](/LICENSE.md).
