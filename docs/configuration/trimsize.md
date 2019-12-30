<!-- trimsize -->
### Trimsize

The PDF option includes multiple trim sizes, depending on your target form factor. The Word document has a fixed trim size (Letter). The ePUB and HTML lack trim sizes. Metric measures rounded to 2 digits in the table. All measures are in metric in the LaTeX macros. (US Customary Measures are defined by their Metric equivalent.) When calculating trim size, we compared [commonly used sizes](./trim-sizes.md) and those offered by [KDP](https://kdp.amazon.com/en_US/help/topic/G201834180#trim).

|   Trimsize       |   Paper Size    |
|        ---       |       :---:     |
| **Letter**       | 8-1/2" x 11"    |
| **LargeTrade**   |     8" x 10"    |
| **Textbook**     |     7" x 10"    |
| **Trade**        |     6" x 9"     |
| **Digest**       | 5-1/2" x 8-1/2" |
| **SmallTrade**   | 5-1/4" x 8"     |
| **Novella**      |     5" x 8"     |
| **AFourSize**    |   21cm x 30cm   |
| **UKAFormat**    |   11cm x 18cm   |
| **UKBFormat**    |   13cm x 20cm   |

* Top and Inner margins are 2cm (~3/4").
* Outer and bottom margins are 17mm (~5/8").
* When attribute `bleed: true` is set, then the paper size and margins are increased by 3mm wide and 6mm high. (I don't think we can bleed an image, though.)
* Set attribute `crop: true` to see what a given size looks like scaled properly on a letter-sized printout.

**Warning:** Failure to use one of the listed trim sizes will cause the compilation to fail. Defaults to `trimsize: Trade`.
<!-- /trimsize -->
