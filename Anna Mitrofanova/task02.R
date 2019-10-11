calculate_value <- function(column_data, column_name) {
  new_value <- NULL
  data_class <- class(column_data)
  if (data_class == 'numeric') {
    new_value <- sum(column_data)
  } 
  else if (data_class == 'character' || data_class == 'logical' || data_class == 'factor') 
  {
    new_value <- count(column_data, 1)
  } 
  new_value
}

main <- function(dataframe, row_selector, column_selector) {
  new_dataframe <- dataframe[row_selector, column_selector]
  new_values <- list()
  for(column in names(new_dataframe)) {
    new_values[[column]] <- calculate_value(new_dataframe[[column]], column)
  }
  list(new_values, new_dataframe)
}

print_result  <- function(list_result) {
  print(list_result[[1]])
  print(paste0('columns: ', ncol(list_result[[2]]), ' rows: ',  nrow(list_result[[2]]) ) )
}

print('Indexes:')
result <- main(example_dataframe, c(1,3,5,7,9,11))
print_result(result)

print('Logical vector:')
result <- main(example_dataframe, column_selector=c(FALSE, TRUE, TRUE, TRUE, TRUE))
print_result(result)

print('Names:')
result <- main(example_dataframe, column_selector=c('V1', 'V3'))
print_result(result)
