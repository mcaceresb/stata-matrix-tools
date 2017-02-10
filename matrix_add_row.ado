*! version 0.1 6Sep2016 Mauricio Caceres, caceres@nber.org
*! Add empty row to matrix

capture program drop matrix_add_row
program matrix_add_row
    syntax namelist(max = 1)
    tempname matrow
    forvalues i = 1 / `:word count `:colnames `0''' {
        matrix `matrow' = nullmat(`matrow'), .
    }
    matrix `0' = `0' \ `matrow'
    matrix drop `matrow'
end
