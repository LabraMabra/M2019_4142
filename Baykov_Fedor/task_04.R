weather1 <- select (weather, -X)
names(weather1)[4:34] <- '1':'31'
weather2 <- gather(weather1, key = day, value = val, '1' : '31')
weather3 <- unite(weather2, col = y_m_d, year, month, day)
weather4 <- spread(weather3, key = measure, value = val)
weather5 <- weather4[order(weather4$y_m_d),]
weather6 <- na.omit(weather5)

