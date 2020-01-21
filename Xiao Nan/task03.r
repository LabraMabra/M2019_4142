in_f<-function(col){
  if (is.numeric(col) == TRUE) {
    return(mean(col))
  }
  else if (is.character(col) == TRUE ||
           is.vector(col) == TRUE ||
           is.factor(col) == TRUE) {
    return(table(col))
  }
}

my_new_f<-function(data_frame,row,col){
  sub_data <- data_frame[row,col]
  return(list(sub_data, sapply(sub_data,in_f)))
}

my_new_f(iris, 26:125,c(1,2,5)) 
my_new_f(iris, c(1,25,50,75,100,125,150), c(1:5))
