df <- mtcars 
dt <- iris

 for_loop <- function(x){
   L <- list(x)
   if (is.numeric(x)){
     msds <-mean(matrix(x))
     L <- append(L,msds)
   } else if (is.factor(x)) {
     freq <-table(x)
     L <- append(L,freq)
   }
   return(L)
 }

  c <- function(data,r_s,c_s){
   b <- data[r_s,c_s]
   lapply(b,for_loop)
 }

c(dt,1:110,1:5)
c(df,1:10,1:10)
