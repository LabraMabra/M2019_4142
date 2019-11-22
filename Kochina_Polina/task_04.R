library(tidyr)
weather <- readRDS("weather.rds")

weather <- select(weather, -X)
names(weather)[4:34] <- '1':'31'

weather <- weather %>% 
  gather(day, val, '1':'31') %>% 
  unite(y_m_d, year, month, day) %>% 
  spread(measure, val) %>% 
  arrange(y_m_d) %>% 
  rename(
    Cloud.CoverOktas = CloudCover,
    Max.HumidityPercent = Max.Humidity, 
    Mean.HumidityPercent = Mean.Humidity, 
    Mean.Dew.PointF = MeanDew.PointF,
    Min.Dew.PointF = Min.DewpointF,
    Min.HumidityPercent = Min.Humidity,
    Wind.DirDegrees = WindDirDegrees,
  ) 
na.omit(weather)

