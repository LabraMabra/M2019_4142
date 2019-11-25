calcfunc <- function(cols) {
  if (is.numeric(cols)) {
    result <- mean(as.matrix(cols))
  } else {
    result <- table(cols)
  }
}


datacutter <- function(df, rows, cols) {
  dftrans <- df[rows, cols]
  cutdf <- lapply(dftrans, calcfunc)
  append(cutdf, list(dftrans = dftrans), 0)
}


carscut <- datacutter(mtcars, c(2:11), c("cyl", "disp", "hp"))
carscut

iriscut <- datacutter(iris, c(6:116), c(1:3, 5))
iriscut
