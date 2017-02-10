{smcl}
{* *! version 0.1 31Oct2016}{...}
{cmd:help matrix_add_row}
{hline}

{title:Title}

{p2colset 5 25 25 2}{...}
{p2col :{manlink D matrix_add_row}}Add blank (missing values) row/column to matrix{p_end}
{p2colreset}{...}

{marker syntax}{...}
{title:Syntax}

{phang}
Add blank row to matrix

{p 8 29 2}
{cmd:add_mat_row}
{it:mname}

{phang}
Add blank column to matrix

{p 8 29 2}
{cmd:add_mat_col}
{it:mname}

{marker ex}{title:Examples}

{pmore}{inp:. matrix test = (2, 0.3, 0.4, 5) \ (1, 0.02, 0.01, 1)}{p_end}
{pmore}{inp:. matrix list test}{p_end}
{pmore}{inp:. matrix_add_row test}{p_end}
{pmore}{inp:. matrix_add_col test}{p_end}
{pmore}{inp:. matrix list test}{p_end}

{title:Website}

{pstd}{cmd:matrix_to_excel} is maintained at {browse "https://github.com/mcaceresb/stata-matrix-tools":github.com/mcaceresb/stata-matrix-tools}{p_end}

{title:Authors}

{pstd}Mauricio Caceres{p_end}
{pstd}{browse "mailto:mauricio.caceres.bravo@gmail.com":mauricio.caceres.bravo@gmail.com }{p_end}
{pstd}{browse "https://mcaceresb.github.io":mcaceresb.github.io}{p_end}
