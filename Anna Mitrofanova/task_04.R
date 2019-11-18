library(tidyr)
weather <- readRDS("weather.rds")

weather$X <- NULL
names(weather)[4:34] <- '1':'31'
weather_split <- gather(weather, key = day, value = val, '1' : '31')
weather_merged <- unite(weather_split, col = y_m_d, year, month, day)
weather_unordered <- spread(weather_merged, key = measure, value = val)
weather_result <- weather_unordered[order(as.Date(weather_result$y_m_d, format="%Y_%m_%d")),]

weather_result
