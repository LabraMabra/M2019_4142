my_func <- function(data, r_s, c_s){
  subset <- data[r_s, c_s]
  res <- list(subset)
  
  for (i in 1:length(subset)) {
    if (is.numeric(subset[,i])){
      summa <- sum(subset[,i])
      res[[i+1]] <- summa
    } else {
      res[[i+1]] <- table(subset[,i])
      
    }
  } 
  res
}

my_func(iris, c(1:150), c(1:5)) #example
