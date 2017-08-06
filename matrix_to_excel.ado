*! version 0.2 05Apr2017 Mauricio Caceres, caceres@nber.org
*! Quick hack to export Stata matrices to excel

cap program drop matrix_to_excel
program matrix_to_excel
    syntax using,            /// Path to excel workbook
        MATrix(str)          /// Matrix to save to excel
        sheet(str)           /// Excel sheet to save to
        cell(str)            /// A cell above the upper left cell of the table
    [                        ///
        MFormat(str)         /// Format numbers (if blank, print full number)
        STARSymbols(str)     /// Symbols to use for significance stars
        STARValues(str)      /// Values to use as star thresholds
        STARColumns(numlist) /// Columns to use as p-values
        kwargs(str)          /// Kwargs to pass to excel
    ]

    * if ("`mformat'" == "") local mformat %15.4fc
    local defvalues  0.1 0.05 0.01
    local defsymbols * ** ***
    local xlopts sheet("`sheet'") cell(`cell') sheetmodify missing(" ") first(varl)
    preserve
        clear
        svmat `matrix'

        * Loop through matrix rows
        local ncols = `:word count `:colnames `matrix'''
        qui forvalues i = 1 / `ncols' {
            if ("`mformat'" != "") {
                tempvar v`i'
                gen `v`i'' = ""
                forvalues j = 1 / `:di _N' {

                    * Per column, make sure floats display properly
                    local mfloat = `matrix'`i'[`j']

                    if (int(`mfloat') != `mfloat') local mval = trim("`:di `mformat' `mfloat''")
                    else local mval = trim("`:di %15.0gc `mfloat''")
                    replace `v`i'' = "`mval'" in `j'

                    * Add significance stars if requested
                    di "`i', `starcolumns'"
                    if ("`starcolumns'" != "") {
                        di "`j', `:di _N'"
                        if (`:list i in starcolumns' & (`j' == `:di _N')) {
                            gettoken starc starcolumns: starcolumns
                            gen stars = ""
                            if ("`starvalues'" == "") local starvalues `defvalues'
                            forvalues s = 1 / `:word count `starvalues'' {
                                local sval: word `s' of `starvalues'
                                local ssym: word `s' of `starsymbols'
                                if "`ssym'" == "" local ssym: word `s' of `defsymbols'
                                replace stars = "`ssym'" if `matrix'`starc' < `sval'
                            }
                            replace v`starc' = v`starc' + stars
                            drop stars
                            * l
                        }
                    }
                }

                * Display missing values as missing
                replace `v`i'' = "" if trim(`v`i'') == "."
                label var `v`i'' " "
            }
            else {
                label var `matrix'`i' " "
            }
        }

        * Keep only relevant columns
        if ("`mformat'" != "") drop `matrix'*
        else cap drop __*
        export excel `using', `xlopts' `kwargs'
    restore
end
