library(dplyr)

new_func <-  function(data,r_s,c_s,func){
  new_df <- data %>% select(c_s) %>% slice(r_s)
  int <- new_df %>% summarise_if(is.numeric, func)
  fac <- new_df %>%  group_by_if(is.factor) %>% summarise(n())
  return(list(new_df,int,fac))
}

new_func(iris,1:23,3:5, mean)
new_func(mtcars,1:12,2:6,mean)
