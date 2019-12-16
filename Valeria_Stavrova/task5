library(dplyr)

funfunf2 <- function(data,rowset,colset){
  
  calcfunc <- function(colset) {
    if (is.numeric(colset)) {
      result <- mean(colset)
    } else {
      result <- table(colset)
    }  }
    
  lapply((data[rowset, colset]), calcfunc) %>% append(list(subset=data[rowset, colset]), 0)
}
