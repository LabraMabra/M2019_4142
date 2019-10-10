final_function <- function(data, rowsel, colsel) {
    newdata <- data[rowsel, colsel] 
    results <- list()
    for (i in colnames(newdata)) {
        if (is.numeric(newdata[,i])) {
            m <- mean(newdata[, i]) 
            results[[i]] <- m
        } else {
            f <- table(newdata[,i])
            results[[i]] <- f
        }
    }
    return(list(newdata, results))
}
print(final_function(iris, 60:75, c(TRUE, TRUE, FALSE, FALSE, TRUE)))
