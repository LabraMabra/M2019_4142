data <- iris
fun <- function(x) {
   somedata <- list()
   if (is.numeric(x)) {
      s <- sum(x);
      somedata <- s;
   } else {
      freq <- table(x);
      somedata <- freq;
   }
}
sapply (data[48:53, 5], fun)
lapply(data[23:38, 4], fun)

