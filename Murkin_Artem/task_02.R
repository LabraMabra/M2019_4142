datacutter <- function(df, rows, cols) {
  dftrans <- df[rows, cols]
  result <- list()
  result[[1]] = dftrans
  for (colm in c(1:length(dftrans))) {
    if (is.numeric(dftrans[, colm])) {
      result[[colm + 1]] = mean(dftrans[,colm])
    }
    else {result[[colm + 1]] = table(dftrans[, colm])
    }
  }
  return(result)
}

# A couple of examples
carscut <- datacutter(mtcars, c(2:11), c("cyl", "disp", "hp"))

iriscut <- datacutter(iris, c(6:116), c(1:3, 5))
