
trial22 <- function (df, r_s, c_s){
  subsetted <- df[r_s, c_s] 
  result <- list()
for (i in 1:length(subsetted)){
if (is.numeric(subsetted[,i])==TRUE){
meanvalue<- mean(subsetted[,i])
result[[i]] <- meanvalue
}
else {
    freqtable <- table(subsetted[,i]) 
    result[[i]] <- freqtable}
}

return(list(subsetted, result))
}

> trial22(titanic_df, 10:19, 3:5)
[[1]]
     Age Survived Freq
10 Adult       No  154
11 Adult       No  387
12 Adult       No  670
13 Adult       No    4
14 Adult       No   13
15 Adult       No   89
16 Adult       No    3
17 Child      Yes    5
18 Child      Yes   11
19 Child      Yes   13

[[2]]
[[2]][[1]]

Child Adult 
    3     7 

[[2]][[2]]

 No Yes 
  7   3 

[[2]][[3]]
[1] 134.9

> trial22(orange_df, 1:30, -3)
[[1]]
   Tree  age
1     1  118
2     1  484
3     1  664
4     1 1004
5     1 1231
6     1 1372
7     1 1582
8     2  118
9     2  484
10    2  664
11    2 1004
12    2 1231
13    2 1372
14    2 1582
15    3  118
16    3  484
17    3  664
18    3 1004
19    3 1231
20    3 1372
21    3 1582
22    4  118
23    4  484
24    4  664
25    4 1004
26    4 1231
27    4 1372
28    4 1582
29    5  118
30    5  484

[[2]]
[[2]][[1]]

3 1 5 2 4 
7 7 2 7 7 

[[2]][[2]]
[1] 880.7333
