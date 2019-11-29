library(dplyr)
library(purrr)

datacutter <- function(df, rows, cols) {
  calcfunc <- function(cols) {
    if (is.numeric(cols)) {
      result <- mean(as.matrix(cols))
    } else {
      result <- table(cols)
    }
  }
  cutdf <- df %>% 
    dplyr::select(cols) %>% 
    dplyr::slice(rows) %>% 
    purrr::map(calcfunc) %>% 
    append(list(dftrans = df[rows, cols]), 0)
  return(cutdf)
}


carscut <- datacutter(mtcars, c(2:11), c("cyl", "disp", "hp"))
carscut

iriscut <- datacutter(iris, c(6:116), c(1:3, 5))
iriscut
