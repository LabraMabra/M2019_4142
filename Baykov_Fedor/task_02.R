somedata <- list()
data <- iris
fun <- function(data, row_s, col_s) {
  for (i in 1:length(col_s)) {
  if (is.numeric(data[row_s, col_s[i]]) == "TRUE") {
    s <- sum(data[row_s, col_s[i]]);
    somedata <- c(somedata, s);
  } else {
    freq <- table(data[row_s, col_s[i]]);
    somedata <- c(somedata, freq);
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
