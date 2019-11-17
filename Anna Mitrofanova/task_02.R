iris <- read.csv("C:/Users/annaa/Downloads/iris.data", header=FALSE)

count <- function(data, row_s, col_s) {
  subset <- data[row_s, col_s]
  result <- list(subset)
  
  for(i in 1:length(subset)) {
    if(is.numeric(subset[,i])){
      result[[i]] <- sum(subset[,i])
    } else {
      freq <- table(subset[,i])
      result[[i]] <- freq
    }
  }
 print(result) 
}

result <- count(iris, 1:150, 1:5) 
