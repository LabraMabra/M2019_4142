library(dplyr)
library(tidyverse)
library(tidyr)

final_function <- function(data, rowsel, colsel, act) {
  new_data <- data %>%
    subset(select = colsel) %>%
    slice(rowsel) 
  
  calc_num_data <- new_data %>%
    summarise_if(is.numeric, act)
  
  calc_nonnum_data <- new_data %>%
    select_if(negate(is.numeric)) %>%
    gather() %>%
    count(key, value)
  
  return(list(new_data, calc_num_data, calc_nonnum_data))
}
 
print(final_function(iris, 60:75, c(2, 5, 5), mean)) 