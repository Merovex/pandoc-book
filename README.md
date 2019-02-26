![Logo of the project](/my-book/images/logo-sm.png)

# Pandoc Novel
> Simple toolchain for publishing books in PDF, epub, mobi, using Markdown & Pandoc

[![Last Commit](https://img.shields.io/github/last-commit/merovex/pandoc-novel.svg)](https://github.com/merovex/pandoc-novel/branches)

A brief description of your project, what it is used for and how does life get
awesome when someone starts to use it.

## Use Cases

* Author of fiction
* Author of non-fiction

## Installing / Getting Started

To use this template, clone the repository locally. Copy the contents of the `my-book/` directory as the new book you want to write (changing the name as appropriate). Then create a git repository of the new book.

Commands you can execute:

* `make clean` - Deletes content of `build/`
* `make docx` - Converts the Markdown in `text/` to Word DOCX format (output placed in `build/` directory).
* `make html` - Converts the Markdown in `text/` to HTML format (output placed in `build/` directory).
* `make mobi` - Converts the Markdown in `text/` to MOBI format (output placed in `build/` directory).
* `make pdf` - Converts the Markdown in `text/` to PDF format (output placed in `build/` directory).

Pandoc Novel uses the [git tag](https://git-scm.com/book/en/v2/Git-Basics-Tagging) for the version added in the metadata and the filename. This is useful to keep track of different versions of the same work (i.e., different drafts; releases to editors, beta readers, etc. )

* `git tag -a v1.4 -m "my version 1.4"`

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

### Trim Sizes

The `trimsize` attribute allows you to define the trim size of your PDF. Available sizes are:

* Letter - 8.5x11in, 1in margins.
* USTrade - 6x9in, 0.6x0.8in margins.
* Digest - 5.5x8.5in, 0.6x0.8in margins.
* USSmallTrade - 5.25x8in, 0.6x0.8in margins.
* Novella - 5x8in, 0.6x0.8in margins.
* MassMarket - 4,25x7in, 0.5x0.8in margins.
* UKAFormat - 111x178mm, 0.5x0.8in margins.
* UKBFormat - 129x198in, 0.5x0.8in margins.
* AFourSize - 210x297mm, 20mm margins.

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

## Licensing

The code in this project is licensed under a BSD-3 [license](/LICENSE.md).
