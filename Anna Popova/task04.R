# preparation

library(dplyr)
library(tidyr)
library(tidyverse)
library(stringr)
library(ggplot2)
library(lubridate)
weather <- readRDS("~/R/R-class/weather.rds")
View(weather)

# observing the dataset

class(weather)
dim(weather)
names(weather)
str(weather)
glimpse(weather)
summary(weather)
head(weather)
tail(weather)

# cleaning and tidying

# gathering the days
weather2 <- gather(weather, day, value, X1:X31, na.rm = TRUE)

# taking variable names from values
weather2 <- weather2[, -1]
weather3 <- spread(weather2, measure, value)

#making clear date
weather3$day <- str_replace(weather3$day, "X", "")
weather4 <- unite(weather3, Date, year, month, day, sep = "-")
weather4$Date <- ymd(weather4$Date)

#rearranging columns
weather5 <- select(weather4, Date, Events, CloudCover:WindDirDegrees)

# replacing trace amounts with 0
weather5$PrecipitationIn <- str_replace(weather5$PrecipitationIn, "T", "0")

#converting characters to numerics
weather6 <- mutate_each(weather5, funs(as.numeric), CloudCover:WindDirDegrees)

# missing values to NA

str(weather6)
sum(is.na(weather6))
summary(is.na(weather6))
ind <- which(is.na(weather6$Max.Gust.SpeedMPH))
weather6[ind, ]
summary(weather6)

#looking for mistakes and the range

hist(weather6$MeanDew.PointF)

hist(weather6$Min.TemperatureF)

hist(weather6$Mean.TemperatureF)

hist(weather6$Mean.VisibilityMiles)
summary(weather6$Mean.VisibilityMiles)
ind <- which(weather6$Mean.VisibilityMiles == -1)
weather6$Mean.VisibilityMiles[ind] <- mean(weather6$Mean.VisibilityMiles[ind])

hist(weather6$Max.Humidity)
ind <- which(weather6$Max.Humidity > 150)
ind
weather6$Max.Humidity[ind] <- 100

summary(weather6$CloudCover)
summary(weather6$Max.Dew.PointF)
hist(weather6$Max.Gust.SpeedMPH)
summary(weather6$Max.Sea.Level.PressureIn)
summary(weather6$Max.Wind.SpeedMPH)
summary(weather6$Mean.Humidity)
summary(weather6$Mean.Sea.Level.PressureIn)
summary(weather6$Mean.Wind.SpeedMPH)
hist(weather6$Max.Dew.PointF)
summary(weather6$Min.DewpointF)
summary(weather6$WindDirDegrees)
summary(weather6$PrecipitationIn)
summary(weather6$Min.VisibilityMiles)
summary(weather6$Min.TemperatureF)
summary(weather6$Min.Sea.Level.PressureIn)
summary(weather6$Min.Humidity)

weather7 <- weather6[order(weather6$Date),]
weather7 <- na.omit(weather7)
