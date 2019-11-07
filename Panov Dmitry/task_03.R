library(datasets)
titanic_df <- data.frame(Titanic)
iris_df <- data.frame(iris)

calc <- function(df){
  result <- 0
  if (class(df) == 'numeric') {
    result <- sum(matrix(df))
  } else if (class(df) != 'numeric') {
    result <- table(df)
  }
  result
}

research_df <- function(data, row_select, col_select) {
  
  new_df <- data[row_select, col_select]
  print("Selected data:")
  print(new_df)
  
  new_df_spl <- split(new_df, 1)
  
  total_result <- lapply(new_df_spl, function(x) lapply(x, function(y) calc(y)))
  print("List of calculation results:")
  print(list(total_result))
}