iris <- read.csv("C:/Users/annaa/Downloads/iris.data", header=FALSE)

func <- function(x){
  if(is.numeric(x)){
    sum(x)
  } else {
    freq <- table(x)
    freq
  }
}

count <- function(data, row_s, col_s) {
  subset <- data[row_s, col_s]
  result <- list(subset)
  result[[i]] <- lapply(subset, func)
  result
}

res <- count(iris, 1:150, 1:5) 
res
