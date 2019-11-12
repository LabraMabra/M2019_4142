dashafunc <- function(dataframe,rowsel,colsel) {
  subsetted <- dataframe[rowsel,colsel]
  results <- list()
  for (i in 1:length(subsetted)) {
    if(is.numeric(subsetted[i])==TRUE) {
    resABS <- sum(subsetted[i])
    results[[i]]<-resABS
  }
  else {
    other.res <- table(subsetted[i])
    results[[i]]<-other.res
  }
  return(list(subsetted,results))
  }
}
dashafunc(iris,1:4,1)

