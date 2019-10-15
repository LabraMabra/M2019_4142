hw_func <- function(data_frame, row_sel, column_sel) {
  subsetted <- data_frame[row_sel, column_sel]
  results <- list()
  for (i in 1:length(subsetted)){
    if(is.numeric(subsetted[,i]) == TRUE){
      res <- sum(subsetted[,i])
      results[[i]] <- res
      }
    else {
      extra_res <- table(subsetted[,i])
      results[[i]] <- extra_res
    }
  }
  
  return(list(subsetted, results))
  
}
hw_func(iris, 1:20, c(1:5))
hw_func(airquality, 10:50, c(TRUE, TRUE, FALSE, TRUE, FALSE, FALSE))
hw_func(morley, row_sel = c(1, 2, 3, 4, 5), column_sel = c('Expt', 'Speed'))

        