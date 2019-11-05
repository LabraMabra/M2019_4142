mainfunction02 <- function (df, c_s){
  
    if (is.numeric(df[,c_s])==TRUE){
      meanvalue<- mean(subsetted[,c_s])
      result <- meanvalue
    }
    else {
      freqtable <- table(df[,c_s]) 
      result <- freqtable}
  return(result)
}

calculationfunction02<-function(df,r_s, c_s, mainfunction)
  {
  subsetted <- df[r_s, c_s] 
  df_list <- split(subsetted, 1)
  resulting <- lapply(df_list, mainfunction01)
  return(list(subsetted, resulting))  
  
}

> calculationfunction02(mtcars, 3:10, 2:5)

