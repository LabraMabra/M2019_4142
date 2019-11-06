weather1 <- gather(weather, key = day, value = val, X1 : X31)
weather2 <- unite(weather1, col = y_m_d, year, month, day)
weather3 <- spread(weather2, key = measure, value = val)
