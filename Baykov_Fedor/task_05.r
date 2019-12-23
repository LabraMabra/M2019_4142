fun <- function(data, row, col) {
  
  df <- data %>% slice(row) %>% select(col);
  
  numeric <- df %>% summarise_if(is.numeric, sum);
  
  non_numeric <- df %>% group_by_if(Negate(is.numeric)) %>% summarise(n());
  
  return(list(numeric, non_numeric));
}

fun(iris, 1:70, 4:5);
fun(iris, 37:63, 5);
