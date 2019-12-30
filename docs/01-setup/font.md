<!-- fonts -->
### Fonts

Verkilo configures three default fonts, but you may reconfigure them provided they are available when using the LaTeX font packages listed here. See [Pandoc fonts for LaTeX](https://pandoc.org/MANUAL.html#fonts) for more information.

Fonts are configured in either the `metadata.yml` or the in-document Frontmatter.

The LaTeX packages used for font assignments are:

```
\usepackage{fontspec}
\usepackage{xunicode}
\usepackage{xltxtra}
```

| Family | Default | Attribute |
| :-: |  :-: | :- |
| Serif       | Libre Baskerville | seriffont: Libre Baskerville |
| Sans-Serif  | Libre Franklin    | sansfont: Libre Franklin |
| Monospace   | Inconsolata       | monofont: Inconsolata  |

**Why default Baskerville, Franklin & Inconsolata?** Both Libre Baskerville and Libre Franklin have been optimized for use on screen. Baskerville is nice and readable, so ideal for use as body text, while Franklin is better suited to headlines. Inconsolata pairs with Baskerville & Franklin as they all share similar traits (double-story g & a, etc.). See the [Libre Baskerville / Franklin / Inconsolata pairing image](./images/libre-franklin-baskerville-inconsolata.png).

Here is an example of customizing fonts based on the Source Pro series:

```
seriffont: "Source Serif Pro"
sansfont: "Source Sans Pro"
monofont: "Source Code Pro"
```
<!-- /fonts -->
