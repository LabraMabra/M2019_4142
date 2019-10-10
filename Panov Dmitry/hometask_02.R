library(datasets)
orange_df <- data.frame(Orange)
titanic_df <- data.frame(Titanic)

research_df <- function(data, row_select, col_select) {
  
  new_df <- data[row_select, col_select]
  print("Selected data:")
  print(new_df)
  
  if (is.data.frame(new_df)) {
    
    result <- vector("list", length(new_df))
    for (i in 1:length(new_df)) {
      
      if (is.numeric(new_df[,i]) == T) {
        result[[i]] <- sum(new_df[,i])
      }
      
      if (is.numeric(new_df[,i]) == F) {
        result[[i]] <- table(new_df[,i])
      }
      
    }
    print("List of calculation results:")
    print(result)
    
    
  } else{
    
    if (is.numeric(new_df)) {
      num_sum <- sum(new_df)
      print("List of calculation results:")
      print(list(num_sum))
    }
    
    if(is.numeric(new_df) == F) {
      non_num_tab <- table(new_df)
      print("List of calculation results:")
      print(list(non_num_tab))
    }
  }
}
