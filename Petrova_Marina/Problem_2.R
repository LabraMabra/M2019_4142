dataframe <- iris

func <- function(df,row_selector,column_selector){
  subset_df <- df[row_selector,column_selector]
  result_list <- list(subset_df)
  for (i in 1:length(subset_df)){
    if (is.numeric(subset_df[,i])){
      dev <- sd(subset_df[,i])
      result_list <- append(result_list,dev)
    } else 
      if (is.factor(subset_df[,i])) {
        freq_table <- table(subset_df[,i])
        result_list <- append(result_list,freq_table)
      }
    }
  print(result_list)
}

func(dataframe,20:80,2:5)
