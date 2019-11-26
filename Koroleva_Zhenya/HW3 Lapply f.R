ffordata1<- function(data, rowsel, colsel) 
{lapply(subdata<- data[ rowsel, colsel],
           function(subdata)
           {ifelse (is.numeric(subdata), 
                    sum(matrix(subdata)),
                    list(ftable(subdata)))})
}
