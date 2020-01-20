library(dplyr)
library(tidyr)
#install.packages("tidyr")

my_f_5 <- function(data_frame, row,col) {
  sub_data <- data_frame %>%
    dplyr::select(col) %>%
    dplyr::slice(row) 
  sub_num <- sub_data %>%
    summarise_if(is.numeric, mean)
  sub_nonnum <- sub_data %>%
    group_by_if(Negate(is.numeric)) %>% 
    summarise(n())
  return(list(sub_data, sub_num, sub_nonnum))
}

my_f_5(iris, 26:125,c(1,2,5)) 
my_f_5(iris, c(1,25,50,75,100,125,150), c(1:5))
