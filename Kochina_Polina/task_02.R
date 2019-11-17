task_2_function <- function(data, r_s, c_s) {
   subset <- data[r_s, c_s]
   result <- list(subset)
   
   for(i in 1:length(subset)) {
      if(is.numeric(subset[,i])){
         summa <- sum(subset[,i])
         result[[i+1]] <- summa
      } else {
         freq <- table(subset[,i])
         result[[i+1]] <- freq
      }
   }
   result
}

res_2 <- task_2_function(iris, 1:150, 1:5) #example
res_2
