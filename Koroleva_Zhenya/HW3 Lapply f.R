#first version only with numeric values
ffordata1<-function(data, rowsel, colsel) 
  {sum(unlist(lapply(subdata<- data[ rowsel, colsel],
                     function(subdata)
    { if (is.numeric(subdata) == TRUE)
    {matrix(subdata)}}
    )))}

#second try 
ffordata1<- function(data, rowsel, colsel) 
{lapply(subdata<- data[ rowsel, colsel],
           function(subdata)
           {ifelse (is.numeric(subdata), 
                    sum(matrix(subdata)),
                    list(ftable(subdata)))})
}
