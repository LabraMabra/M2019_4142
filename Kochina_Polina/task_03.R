calc_func <- function(c_s, fun=sum) {
  calc_list <- NULL
  class_of_data <- class(c_s)
  if (class_of_data == 'numeric') {
    calc_list <- fun(matrix(c_s))
  } else if (class_of_data == 'character' || class_of_data == 'logical' || class_of_data == 'factor') {
    calc_list <- table(c_s)
  } 
  calc_list
}


task_3_func <- function(data, r_s, c_s, fun=sum) {
  new_df = data[r_s, c_s]
  new_df_split <- split(new_df, 1)
  calc_list <- lapply(new_df_split, function(x) lapply(x, function(y) calc_func(y, fun)))
  list(new_df, calc_list)
}


result <- task_3_func(iris, 1:100, 1:3) #example
result
