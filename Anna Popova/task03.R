calc_func <- function(col_sel) {
        inputdata <- NULL
        if (is.numeric(col_sel) == TRUE) {
                as.matrix(col_sel)
                inputdata <- sum(col_sel)
        }
        else {
                inputdata <- table(col_sel)
        }
}

func <- function(dataframe, row_sel, col_sel) {
        subdata <- dataframe[row_sel, col_sel]
        lapply(subdata, calc_func)
}

#examples of input
func(OrchardSprays, 2:8, c(2,3,4))
func(OrchardSprays, row_sel = c(2,3,4,5,6), col_sel = c('rowpos', 'colpos'))
func(OrchardSprays, 5:12, c(TRUE, FALSE, FALSE))
 