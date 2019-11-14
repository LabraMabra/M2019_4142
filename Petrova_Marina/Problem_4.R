library(tidyr)
weather <- readRDS("weather.rds")

weather$X <- NULL
names(weather)[4:34] <- '1':'31'
weather_split_to_val <- gather(weather, key = day, value = val, '1' : '31')
weather_date_merged <- unite(weather_split_to_val, col = y_m_d, year, month, day)
weather_result <- spread(weather_date_merged, key = measure, value = val)
weather_result_ordered <- weather_result[order(weather_result$y_m_d),]


