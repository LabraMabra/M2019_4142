calculate_value <- function(column_data, f) {
  new_value <- NULL
  data_class <- class(column_data)
  if (data_class == 'numeric') {
    new_value <- f(column_data)
  } 
  else if (data_class == 'character' || data_class == 'logical' || data_class == 'factor') 
  {
    new_value <- length(column_data)
  } 
  new_value
}

main <- function(dataframe, row_selector, column_selector, f = sum) {
  new_dataframe <- dataframe[row_selector, column_selector]
  dataframes_list <- split(new_dataframe, 1)
  new_values <- lapply(dataframes_list, function(x) lapply(x, function(y) calculate_value(y, f)))
  list(new_values, new_dataframe)
}

print_result  <- function(list_result) {
  print(list_result[[1]])
  print(paste0('columns: ', ncol(list_result[[2]]), ' rows: ',  nrow(list_result[[2]]) ) )
}

example_dataframe <- iris
print('Indexes:')
result <- main(example_dataframe, c(1,3,5,7,9,11))
print_result(result)

print('Logical vector:')
result <- main(example_dataframe, column_selector=c(FALSE, TRUE, TRUE, TRUE, TRUE))
print_result(result)

print('Names:')
result <- main(example_dataframe, column_selector=c('V1', 'V3'))
print_result(result)
