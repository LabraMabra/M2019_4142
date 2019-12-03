in_f<-function(col){
  if(is.numeric(sss[,i])) {
    r_list<-mean(sss[,i])
  }
  else {
    r_list<summary(sss[,i])
  }
}

my_new_f<-function(data_frame,row,col){
  sub_data <- data_frame[row,col]
  for (i in colnames(sub_data)){
  return(lapply(sub_data,in_f))
  }
}

