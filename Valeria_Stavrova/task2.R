funfun <- function(data, rowset,colset){
  subdata <- data[rowset, colset]
  mylist <-list(subdata)
  for(i in 1:length(subdata)) {
    if(is.numeric(subdata[,i])==TRUE){
      meannumber<-mean(subdata[,i])
      mylist <- append(mylist, meannumber)
    } else {
      freq <-table(subdata[,i])
      mylist <- append(mylist, freq)
    }}
  
  print(mylist)}

#examples
funfun(iris, 1:10, c(1,2,3,5))
funfun(iris, colset=c('Petal.Length', 'Petal.Width', 'Species'))
funfun(iris, 10:20, c(TRUE,TRUE,FALSE,FALSE,TRUE))

