*! version 0.1 6Sep2016 Mauricio Caceres, caceres@nber.org
*! Add empty col to matrix

capture program drop matrix_add_col
program matrix_add_col
    syntax namelist(max = 1)
    tempname matcol
    forvalues i = 1 / `:word count `:rownames `0''' {
        matrix `matcol' = nullmat(`matcol') \ .
    }
    matrix `0' = `0', `matcol'
    matrix drop `matcol'
end
