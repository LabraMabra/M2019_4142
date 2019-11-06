data <- iris
fun <- function(data, row_s, col_s) {
  somedata <- list()
  for (i in 1:length(col_s)) {
    subdata <- data[row_s, col_s[i]]
    if (is.numeric(subdata)) {
      s <- sum(subdata);
      somedata <- s;
    } else {
      freq <- table(subdata);
      somedata <- freq;
    }
    print(somedata)
  }
}
fun(data, 48:53, 5)
fun(data, 23:38, 4)
fun(data, 51:70, 1)
fun(data, 10, "Petal.Width")
fun(data, 147:200, "Petal.Width")
fun(data, 10:20, 3:4)
fun(data, 10:20, 3:5)
