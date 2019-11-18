data <- iris
fun1 <- function (col_s) {
   somedata <- NULL;
   if (is.numeric(col_s)) {
         somedata <- sum(col_s);
      } else {
         somedata <- table(col_s);
      }
}
fun <- function(data, row_s, col_s) {
   subdata <- data[row_s, col_s];
   lapply(subdata, fun1);
   
}

fun (data, 48:53, 3:5)
fun (data, 1:20, 1:2)
