in_f<-function(col){
  if (is.numeric(col) == TRUE) {
    r_list<-mean(col)
  }
  else {
    r_list<summary(col)
  }
}

my_new_f<-function(data_frame,row,col){
  sub_data <- data_frame[row,col]
  for (i in colnames(sub_data)){
    return(lapply(sub_data,in_f))
  }
}
