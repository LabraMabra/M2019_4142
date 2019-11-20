library("tidyr")
weather <- readRDS("/Users/apple/Desktop/weather.rds")

weather$X <- NULL
names(weather)[4:34] <- '1':'31'

weather <- weather %>%
  gather(day, data, '1': '31') %>%
  unite (date, year, month, day) %>%
  spread(key = measure, value = data) %>%
  mutate(date = as.Date(date, format = "%Y_%m_%d")) %>%
  arrange(date) %>%
  rename(
    Cloud.CoverOktas = CloudCover,
    Max.HumidityPercent = Max.Humidity, 
    Mean.HumidityPercent = Mean.Humidity, 
    Mean.Dew.PointF = MeanDew.PointF,
    Min.Dew.PointF = Min.DewpointF,
    Min.HumidityPercent = Min.Humidity,
    Wind.DirDegrees = WindDirDegrees,
  )

