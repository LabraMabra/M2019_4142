library(dplyr)
library(tidyr)

result_function <- function(df, col, row) {
  custom_df <- df %>%
    dplyr::select(col) %>%
    dplyr::slice(row) 
  calc_num <- custom_df %>%
    summarise_if(is.numeric, mean)
  calc_nonnum <- custom_df %>%
    select_if(Negate(is.numeric)) %>%
    gather() %>%
    count(key, value)
  return(list(custom_df, calc_num, calc_nonnum))
}

result <- result_function(iris,c(1,2,5), 1:5)
print(result)
