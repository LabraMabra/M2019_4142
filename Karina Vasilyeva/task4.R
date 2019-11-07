

weather1<-as_tibble(weather)

it1 <- weather1 %>%
  pivot_longer(
    cols = 5:35,
    names_to = "Day",
    values_to = "Value",
    values_drop_na = TRUE
    )
it2 <- it1 %>%
  pivot_wider(
    names_from = measure, values_from = Value, 
    )
View(it2)
colnames(it2)

it30 <-  it2 %>% 
arrange(year, month)

it31 <- unite(it30, date, Day, month, year)

it4 <- group_by(it31, date ) %>%
  summarise(Max.TemperatureF = max(Max.TemperatureF , na.rm = T),
            Min.TemperatureF = max( Min.TemperatureF , na.rm = T),
            MeanDew.PointF = max(MeanDew.PointF , na.rm = T),
            Min.DewpointF = max(Min.DewpointF , na.rm = T) , 
            Max.Humidity = max(Max.Humidity , na.rm = T),
            Mean.Humidity = max(Mean.Humidity , na.rm = T),
            Min.Humidity = max(Min.Humidity , na.rm = T),
            Max.Sea.Level.PressureIn = max(Max.Sea.Level.PressureIn , na.rm = T), 
            Min.Sea.Level.PressureIn = max(Min.Sea.Level.PressureIn , na.rm = T),
            Max.VisibilityMiles = max(Max.VisibilityMiles , na.rm = T),
            Mean.VisibilityMiles = max(Mean.VisibilityMiles , na.rm = T),
            Min.VisibilityMiles = max(Min.VisibilityMiles , na.rm = T),
            Max.Wind.SpeedMPH = max(Max.Wind.SpeedMPH , na.rm = T),
            Mean.Wind.SpeedMPH = max(Mean.Wind.SpeedMPH , na.rm = T),
            Max.Gust.SpeedMPH = max(Max.Gust.SpeedMPH , na.rm = T),
            PrecipitationIn = max(PrecipitationIn , na.rm = T),
            CloudCover = max(CloudCover , na.rm = T),
            Events = max(Events , na.rm = T),
            WindDirDegrees = max(WindDirDegrees , na.rm = T))



