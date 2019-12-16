library(dplyr)

funfunf2 <- function(data,rowset,colset){
  calc <- function(colset) {
    if (is.numeric(colset)) {
      result <- mean(colset)
    } else {
      result <- table(colset)
    }  }
     lapply((data[rowset, colset]), calc) %>% append(list(subset=data[rowset, colset]), 0)
}

#another variant
funfun3 <- function(data,rowset,colset){
  lapply((data[rowset, colset]), 
         function(x)ifelse(is.numeric(x), mean(x),list(table(x)))) %>% 
  append(list(subset=data[rowset, colset]), 0)
}
