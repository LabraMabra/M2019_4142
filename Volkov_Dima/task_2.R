df <- mtcars 
dt <- iris

my_func <- function(data,r_s,c_s){
  a <- data[r_s,c_s]
  L <- list(a)
  for (i in 1:length(a)){
    if (is.numeric(a[,i])){
      msds <- mean(a[r_s,i])
      L <- append(L,msds)
    } else if (is.factor(a[,i])) {
      freq <- table(a[,i])
      L <- append(L,freq)
    }}
  print(L)
  }

my_func(dt,1:110,3:5)
my_func(df,1:23,1:10)
