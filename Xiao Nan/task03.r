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
  for (i in colnames(sub_data)){
    return(sapply(sub_data,in_f))
  }
}
