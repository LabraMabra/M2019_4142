#first version only with numeric values
ffordata1<-function(data, rowsel, colsel) {sum(unlist(lapply(subdata<- data[ rowsel, colsel],function(subdata)
  +     +     { if (is.numeric(subdata) == TRUE) {matrix(subdata)}} )))}
#second try 
ffordata1 <- function(data, rowsel, colsel) {unlist(lapply(subdata<- data[ rowsel, colsel],function(subdata)
  + { if (is.numeric(subdata) == TRUE) {print(sum(matrix(subdata)))}
    +     else if (subdata) {print(ftable(matrix(subdata)))}}
  +  ))}
# it checks only first two columns. I do not understand. Should I add more conditions?
# No success with conditions... Should I create special function for that?