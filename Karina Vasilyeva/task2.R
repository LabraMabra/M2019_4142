
trial22 <- function (df, r_s, c_s){
  subsetted <- df[r_s, c_s] 
  result <- list()
for (i in 1:length(subsetted)){
if (is.numeric(subsetted[,i])==TRUE){
meanvalue<- mean(subsetted[,i])
result[[i]] <- meanvalue
}
else {
    freqtable <- table(subsetted[,i]) 
    result[[i]] <- freqtable}
}

return(list(subsetted, result))
}

