<!-- trimsize -->
### Trimsize

The PDF option includes multiple trim sizes, depending on your target form factor. The Word document has a fixed trim size (Letter). The ePUB and HTML lack trim sizes. Metric measures rounded to 2 digits in the table. All measures are in metric in the LaTeX macros. (US Customary Measures are defined by their Metric equivalent.) When calculating trim size, we compared [commonly used sizes](./trim-sizes.md) and those offered by [KDP](https://kdp.amazon.com/en_US/help/topic/G201834180#trim).

<!--
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
| **UKBFormat**    |   13cm x 20cm   | -->

|   Trimsize       |   Paper Size    ||
|       ---       |       :---:     |       :---:      |
| Novella (US)    | 5" x 8"         | 12.7 x 20.32 cm  |
| B-Format (UK)    | 5.06" x 7.81"   | 12.85 x 19.84 cm |
| SmallTrade (US) | 5.25" x 8"      | 13.34 x 20.32 cm |
| Digest (US)     | 5.5" x 8.5"     | 13.97 x 21.59 cm |
| Trade (US)      | 6" x 9"         | 15.24 x 22.86 cm |
| Royal (UK)      | 6.14" x 9.21"   | 15.6 x 23.39 cm  |
| Textbook (US)   | 7" x 10"        | 17.78 x 25.4 cm  |
| Crown (UK)      | 7.44" x 9.69"   | 18.9 x 24.61 cm  |
| LargeTrade (US) | 8" x 10"        | 20.32 x 25.4 cm  |
| Square (US)     | 8.5" x 8.5"     | 21.59 x 21.59 cm |
| Letter (US)     | 8.5" x 11"      | 21.59 x 27.94 cm |
| A4 (UK)         | 8.27" x 11.69"  | 21 x 29.7 cm     |

<!-- |    | 6.69" x 9.61"         | 16.99 x 24.41 cm | -->
<!-- |    | 7.5" x 9.25"          | 19.05 x 23.5 cm | -->
<!-- |    | 8.25" x 6"          | 20.96 x 15.24 cm | -->
<!-- |    | 8.25" x 8.25"         | 20.96 x 20.96 cm | -->

* Top and Inner margins are 2cm (~3/4").
* Outer and bottom margins are 17mm (~5/8").
* When attribute `bleed: true` is set, then the paper size and margins are increased by 3mm wide and 6mm high. (I don't think we can bleed an image, though.)
* Set attribute `crop: true` to see what a given size looks like scaled properly on a letter-sized printout.

**Warning:** Failure to use one of the listed trim sizes will cause the compilation to fail. Defaults to `trimsize: Trade`.
<!-- /trimsize -->
