dataframe <- iris

calc_and_table <- function (df, operator){
  print (df)
  result_list <- list()
  for (i in 1:length(df)){
    if (is.numeric(df[,i])){
      value <- apply(matrix(df[,i]), 2, operator)
      result_list <- append(result_list,value)
    } else 
      if (is.factor(df[,i])) {
        freq_table <- table(df[,i])
        result_list <- append(result_list,freq_table)
      }
  }
  result_list
}
  

split_and_execute <- function(df,row_selector,column_selector, split_arg, operator){
  subset_df <- df[row_selector,column_selector]
  df_list <- split(subset_df, split_arg, drop=TRUE)
  final_result=lapply(df_list, calc_and_table, operator)
  print(final_result)
}

split_and_execute(dataframe, 1:110,2:5, split_arg=iris$Species, mean)
