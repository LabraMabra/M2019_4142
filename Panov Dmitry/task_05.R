#Connect packages and datasets
library(tidyverse)
library(datasets)
iris_df <- data.frame(iris)
titanic_df <- data.frame(Titanic)

research_df <- function(data, row_select, col_select) {
  #Select data
  new_data <- data %>%
    select(col_select) %>% 
    slice(row_select)
  
  #Count the numerical values
  num_val <- new_data %>% 
    summarise_if(is.numeric, sum)
  
  #Count the non-numerical values
  non_num_val <- new_data %>% 
    group_by_if(negate(is.numeric)) %>%
    summarise(n())
  
  #Return the list of results
  return(list(new_data, num_val, non_num_val))
}

#Function example
research_df(titanic_df, 10:25, 3:5)
research_df(iris_df, 1:70, 4:5)