library(datasets)

calc <- function(data, row, column) {
    # select subset data
    temp <- data[row, column]

    # if data is number
    if (is.data.frame(temp)) {
        return(calc_df(temp))
    } else {
        return(calc_s(temp))
    }
}

# calc data for dataframe
calc_df <- function(data) {
    len <- length(data)
    result <- vector("list", len)
    for (i in 1:len) {
        result[[i]] <- calc_s(data[,i])
    }
    return(result)
}

# calc for simple value
calc_s <- function(val) {
    if (is.numeric(val)) {
        # calc mean if number
        return(mean(val))
    } else {
        # calc frequency table
       return(table(val))
    }
}

test_df <- iris
print(calc(test_df))
print(calc(test_df, test_df$Petal.Length > 2))
print(calc(test_df, test_df$Petal.Length > 2, c('Petal.Width')))
