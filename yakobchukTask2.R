mydata = (iris)

my_calc5 <- function(dataframe, row_sel, col_sel)
    for(i in 10:100){
 if(sum(is.na(mydata))>10){stop("more than 10 missing")
 }
  else{
    res <- sum(is.na(mydata))/nrow(mydata)/ncol(mydata)
    return(res)
    
  }
}
my_calc4(mydata)  
  
