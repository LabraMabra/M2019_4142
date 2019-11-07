#rewrite your function
funfun1 <-function(data, rowset, colset){
append(list(data[rowset, colset]),lapply((data[rowset, colset]),
function(x)ifelse(is.numeric(x), mean(x),list(table(x)))))}

#treat numeric data as matrices
numfun <-function(data,rowset,colset){
 Filter(is.numeric,data[rowset,colset, drop = FALSE]) %>% colMeans %>% print}
