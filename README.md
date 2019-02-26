Description
-----------

Various simple but useful matrix utilities

- `matrix_add_col`: Add column of missing values to existing matrix.
- `matrix_add_row`: Add row of missing values to existing matrix.
- `matrix_to_excel`: Export Stata matrix to excel (leverages export excel).
- `matrix_to_txt`: Stata utility to export a matrix into a text file. This

Requirements
------------

I only have access to Stata 13.1, so I impose that to be the
minimum. The commands are really simple, however, so I would not be
surprised if they worked with earlier versions.

Installation
------------

```stata
net install matrix_tools, from(https://raw.githubusercontent.com/mcaceresb/stata-matrix-tools/master/)
```

Examples
---------

```stata
matrix test = (2, 0.3, 0.4, 5) \ (1, 0.02, 0.01, 1)
matrix list test
matrix_add_row test
matrix_add_col test
matrix list test

* Note you have to specify the cell ABOVE where you want the matrix to
* be because this will print a blank row above the matrix. I typically
* insert a row above where I want the matrix and hide it in excel.

matrix_to_excel using `"/path/to/workbook.xlsx"', cell(B2) mat(test) sheet("sheet")
matrix_to_excel using `"/path/to/workbook.xlsx"', cell(B2) mat(test) sheet("sheet") ///
     starcolumns(2 3) starvalues(0.1 0.05 0.01) starsymbols(* ** ***) mformat(%9.2fc)
```

Notes
-----

I often use the `matrix_to_txt` so I keep a copy here. However, this
utility was written by Michael Blasnik, Ben Jann, and Matthew Gentzkow.
