
print_summary_result <- function(list_with_result) {
  print(list_with_result[[1]])
  print(paste0('Resulting dataframe has ', ncol(list_with_result[[2]]), ' columns and ',  nrow(list_with_result[[2]]), ' rows.'))
  
}

calculate_standart_value <- function(df_column_data, fun=mean) {
  calculated_value <- NULL
  class_of_data <- class(df_column_data)
  if (class_of_data == 'numeric') {
    calculated_value <- fun(matrix(df_column_data))
  } else if (class_of_data == 'character' || class_of_data == 'logical' || class_of_data == 'factor') {
    calculated_value <- table(df_column_data)
  } 
  calculated_value
}


explore_df <- function(dataframe, row_selector, column_selector, split_by=1, fun=mean) {
  new_dataframe = dataframe[row_selector, column_selector]
  dataframes_list <- split(new_dataframe, split_by)
  calculated_values <- lapply(dataframes_list, function(x) lapply(x, function(y) calculate_standart_value(y, fun)))
  list(calculated_values, new_dataframe)
}


result <- explore_df(example_dataframe, example_dataframe$Petal.Length > 1.4, split_by = iris$Species, fun=sum)
print_summary_result(result)



