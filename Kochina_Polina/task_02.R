my_func <- function(data, r_s, c_s){
  subset <- data[r_s, c_s]
  plus <- list(subset)
  
  for (i in 1:length(subset)) {
    if (is.numeric(subset[,i])){
      summa <- sum(subset[,i])
      plus[[i+1]] <- summa
    } else {
      slova <- table(subset[,i])
      plus[[i+1]] <- slova
      
    }
  } 
  print (plus)
}

my_func(iris, c(1:150), c(1:5)) #example
