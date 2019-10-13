print_summary_result <- function(list_with_result) {
  print(list_with_result[[1]])
  print(paste0('Resulting dataframe has ', ncol(list_with_result[[2]]), ' columns and ',  nrow(list_with_result[[2]]), ' rows.'))
  
}

calculate_standart_value <- function(df_column_data, column_name) {
  calculated_value <- NULL
  class_of_data <- class(df_column_data)
  if (class_of_data == 'numeric') {
    print(paste0('Calculating mean value for ', column_name))
    calculated_value <- mean(df_column_data)
  } else if (class_of_data == 'character' || class_of_data == 'logical' || class_of_data == 'factor') {
    print(paste0('Calculating freq table for ', column_name))
    calculated_value <- table(df_column_data)
  } 
  calculated_value
}

explore_df <- function(dataframe, row_selector, column_selector) {
  new_dataframe <- dataframe[row_selector, column_selector]
  calculated_values <- list()
  for(column in names(new_dataframe)) {
    calculated_values[[column]] <- calculate_standart_value(new_dataframe[[column]], column)
  }
  list(calculated_values, new_dataframe)
}



example_dataframe <- iris
print('***  Without selectors  ***')
result <- explore_df(example_dataframe)
print_summary_result(result)

print('***  With row selector: indexes  ***')
result <- explore_df(example_dataframe, c(1,3))
print_summary_result(result)

print('***  With row selector: conditions (logical vector)  ***')
result <- explore_df(example_dataframe, example_dataframe$Petal.Length > 2)
print_summary_result(result)

print('***  With column selector: indexes  ***')
result <- explore_df(example_dataframe, column_selector=c(1,3,5))
print_summary_result(result)

print('***  With column selector: names  ***')
result <- explore_df(example_dataframe, column_selector=c('Petal.Width', 'Sepal.Length'))
print_summary_result(result)

print('***  With column selector: logical vector  ***')
result <- explore_df(example_dataframe, column_selector=c(FALSE, FALSE, TRUE, TRUE, TRUE))
print_summary_result(result)

print('***  With column and row selectors  ***')
result <- explore_df(example_dataframe, example_dataframe$Petal.Length > 2, column_selector=c('Petal.Width', 'Sepal.Length'))
print_summary_result(result)



