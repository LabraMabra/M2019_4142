func <- function(dataframe, row_sel, col_sel) {
  subdata <- dataframe[row_sel, col_sel]
  result <- list()
  for (i in 1:length(subdata)) {
    if (is.numeric(subdata[, i]) == TRUE) {
      sumdata <- sum(subdata[, i])
      result[[i]] <- sumdata
    }
    else {
      freqdata <- table(subdata[, i])
      result[[i]] <- freqdata
    }
  }
  return(list(subdata, result))
}

#examples of input
func(OrchardSprays, 2:8, c(2,3,4))
func(OrchardSprays, row_sel = c(2,3,4,5,6), col_sel = c('rowpos', 'colpos'))
func(OrchardSprays, 5:12, c(TRUE, FALSE, FALSE))
