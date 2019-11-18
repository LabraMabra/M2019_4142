final_function <- function(data, rowsel, colsel, act) {
    newdata <- data[rowsel, colsel] 
    check <- unlist(lapply(newdata, is.numeric))
    
    num_data <- newdata [, check]
    num_data <- data.matrix(data.frame(num_data))
    nonnum_data <- newdata [, !check]
    nonnum_data <- data.frame(nonnum_data)
    
    calc_num_data <- apply(num_data, 2, act)
    calc_nonnum_data <- lapply(nonnum_data, table)
  
    return(list(newdata, calc_num_data, calc_nonnum_data))
}
print(final_function(iris, 60:75, c(2, 5, 5), mean))