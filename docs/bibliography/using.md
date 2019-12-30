## Using Bibliography

Your .bib file should contain multiple entries that look something like
this:

```
    @article{fyfe_digital_2011,
        title = {Digital Pedagogy Unplugged},
        volume = {5},
        url = {http://digitalhumanities.org/dhq/vol/5/3/000106/000106.html},
        number = {3},
        urldate = {2013-09-28},
        author = {Fyfe, Paul},
        year = {2011},
        file = {fyfe_digital_pedagogy_unplugged_2011.pdf}
    }
```

You will rarely have to edit these by hand (although you can). In most
cases, you will simply "export" the .bib file from Zotero or from a
similar reference manager. Take a moment to orient yourself here. Each
entry consists of a document type, "article" in our case, a unique
identifier (fyfe\_digital\_2011), and the relevant meta-data on title,
volume, author, and so on. The thing we care most about is the unique ID
which immediately follows the curly bracket in the first line of each
entry. The unique ID is what allows us to connect the bibliography with
the main document. Leave this file open for now and go back to your
`main.md` file.

Edit the footnote in the first line of your `main.md` file to look
something like the following examples, where `@name_title_date` can be replaced with one of
the unique IDs from your `project.bib` file.

- `A reference formatted like this will render properly as inline- or footnote- style citation [@name_title_date, 67].`[^7]
- `"For citations within quotes, put the comma outside the quotation mark" [@name_title_2011, 67].`

Once we run the markdown through Pandoc, "@fyfe\_digital\_2011" will be
expanded to a full citation in the style of your choice. You can use the
`@citation` syntax in any way you see fit: in-line with your text or in
the footnotes. To generate a bibliography simply include a section
called `# Bibliography` at the end of document.

Now, go back to your metadata header at the top of your .md document,
and specify the bibliography file to be used, like so:

```
---
title: Plain Text Workflow
author: Dennis Tenen, Grant Wythoff
date: January 20, 2014
bibliography: project.bib
---
```

This tells Pandoc to look for your bibliography in the `project.bib`
file, under the same directory as your `main.md`. Let's see if this
works. Save your file, switch to the terminal window and run:

```
$ pandoc main.docx --filter pandoc-citeproc -o main.md
```

The "pandoc-citeproc" filter will parse any citation tags found in your document. The result
should be a decently formatted MS Word file. If you have LaTeX installed, convert into .pdf
using the same syntax for prettier results. Do not worry if things are not exactly the way you
like them---remember, you are going to fine-tune the formatting all at once and at later time,
as close as possible to the time of publication. For now we are just creating drafts based on
reasonable defaults.

## Changing citation styles

The default citation style in Pandoc is Chicago Author-date. We can
specify a different style by using stylesheet, written in the "Citation
Style Language" (yet another plain-text convention, in this case for
describing citation styles) and denoted by the .csl file extension.
Luckily, the CSL project maintains a repository of common citation
styles, some even tailored for specific journals. Visit
<http://editor.citationstyles.org/about/> to find the .csl file for
Modern Language Association, download `modern-language-association.csl`,
and save to your project directory as `mla.csl`. Now we need to tell
Pandoc to use the MLA stylesheet instead of the default Chicago. We do
this by updating the YAML header:

```
---
title: Plain Text Workflow
author: Dennis Tenen, Grant Wythoff
date: January 20, 2014
bibliography: project.bib
csl: mla.csl
---
```

You then repeat the pandoc incantation to cast your markdown file into your target format (.pdf
or .docx):

```
$ pandoc main.md --filter pandoc-citeproc -o main.pdf
```

Parse the command into English as you are typing. In my head, I translate the above into
something like: "Pandoc, take the my markdown file, run it through a citation filter, and
output a Markdown file." As you get more familiar with citation stylesheets, consider adding
your custom-tailored .csl files for journals in your field to the archive as a service to the
community.
