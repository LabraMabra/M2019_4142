myfunction <- function(df, row, column) {
    new_df <- df[row,column]
    result_list <- list()
    for (i in colnames(new_df)) {
        if (is.numeric(new_df[,i])) {
            calc_value_sum <- sum(new_df[, i])
            result_list[[i]] <- calc_value_sum
        } else {
            calc_value_freq <- table(new_df[,i])
            result_list[[i]] <- calc_value_freq
        }
    }
    return(list(new_df, result_list))
}

#EXAMPLES
result <- myfunction(iris, c(1,2)) 
result <- myfunction(iris, column=c(1,3,5))
