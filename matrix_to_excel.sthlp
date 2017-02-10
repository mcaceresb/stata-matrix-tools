{smcl}
{* *! version 0.1 31Oct2016}{...}
{cmd:help matrix_to_excel}
{hline}

{title:Title}

{pstd}
{hi:matrix_to_excel} {hline 2} Export Stata matrix to excel
{p_end}

{marker syntax}{title:Syntax}

{p 8 29 2}
{cmd:matrix_to_excel}
{cmd:,}
{opt mat:rix(str)}
{opt sheet(str)}
{opt cell(str)}
[{it:{help matrix_to_excel##matrix_to_excel_options:matrix_to_excel_options}}]


{synoptset 23 tabbed}{...}
{marker matrix_to_excel_options}{...}
{synopthdr :matrix_to_excel_options}
{synoptline}
{synopt :{opt mat:rix(str)}}{p_end}
{synopt :{opt sheet(str)}}{p_end}
{synopt :{opt cell(str)}}{p_end}

{synopt :{opt mformat(str)}}{p_end}
{synopt :{opt stars:ymbols(str)}}{p_end}
{synopt :{opt starv:alues(str)}}{p_end}
{synopt :{opt starc:olumns(numlist)}}{p_end}
{synopt :{opt kwargs(str)}}{p_end}
{synoptline}

{marker desc}{title:Description}

{pstd} {cmd:matrix_to_excel} Is a very simple wrapper that leverages {opt mkmat} and {opt export excel} to export Stata matrices to excel. Since it uses Stata's export functionality, the first row printed will be the variable names. To work around this, the function prints the variable labels, which are set to blank after using {opt mkmat}. The workaround in excel is that I insert a row above where I want the matrix and then hide it. {p_end}

{marker ex}{title:Examples}

{phang}Basic use{p_end}

{pmore}{inp:. matrix_to_excel using `"/path/to/workbook.xlsx"', cell(B2) mat(test) sheet("sheet")}{p_end}
{pmore}{inp:. matrix_to_excel using `"/path/to/workbook.xlsx"', cell(B2) mat(test) sheet("sheet") ///}{p_end}
          starcolumns(2 3) starvalues(0.1 0.05 0.01) starsymbols(* ** ***) mformat(%9.2fc)

{title:Website}

{pstd}{cmd:matrix_to_excel} is maintained at {browse "https://github.com/mcaceresb/stata-matrix-tools":github.com/mcaceresb/stata-matrix-tools}{p_end}

{title:Authors}

{pstd}Mauricio Caceres{p_end}
{pstd}{browse "mailto:mauricio.caceres.bravo@gmail.com":mauricio.caceres.bravo@gmail.com }{p_end}
{pstd}{browse "https://mcaceresb.github.io":mcaceresb.github.io}{p_end}
