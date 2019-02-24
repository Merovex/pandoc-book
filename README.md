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

## Configuration

At a minimum, you will want to review / edit the following attributes in the `metadata.yml` file:
* `title` - The title of the book
* `subtitle` - The subtitle of the book
* `author` - The author(s) of the book (can be a string or array)
* `website` - The author's website
* `other-titles` - An array of other titles the author wants the reader to be aware of
* `rights` - The work's copyright statement
* `disclaimer` - The author's disclaimer
* `reservation` - The author's reservation of rights
* `isbn` - An array of ISBNs associated with the underlying work
* `identifier` - The ISBN associated with the EPUB
* `credits` - An array of those who supported the books' publication (artists, authors)

The `images/` directory is where you should place images used to support the published work. You will also want to replace the following images with your own:
* `cover.png` Provides the cover for the epub.
* `logo.png` Provides the imprint logo (both the name and logo are registered trademarks).

The `text/` directory is where Pandoc Novel looks for the Markdown content.

## Features

The Pandoc Novel converts Markdown to the following formats:

* DOCX - Output into Microsoft Word, formatted for working with an editor.
* EPUB - Suitable for release on non-Amazon ebook platforms
* HTML - Suitable for preview in a browser.
* MOBI - Suitable for release on Amazon's ebook platform.
* PDF - Using LaTeX in the default form factor for Amazon publishing (6"x9")

Pandoc Novel leverages the git tag for versioning of the file.


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
