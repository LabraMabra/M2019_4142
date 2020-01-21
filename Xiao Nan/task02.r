my_f <- function(data_frame, row,col) {
  sub_data <- data_frame[row,col，drop=F]
  result_list <- list()
  for (i in colnames(sub_data)) {
    if (is.numeric(sub_data[,i])) {
      mean_sub <- mean(sub_data[, i])
      result_list[[i]] <- mean_sub
    } else {
      freq_table <- summary(sub_data[,i])
      result_list[[i]] <- freq_table
    }
  }
  return(list(sub_data, result_list))
}

#for example
my_f(iris, 26:125,c(1,2,5)) 
my_f(iris, c(1,25,50,75,100,125,150), c(1:5))
