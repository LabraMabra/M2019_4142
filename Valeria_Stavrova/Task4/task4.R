#EXPLORYING_DATA
class(weather)
dim(weather)
names(weather)
str(weather)
summary(weather)
head(weather)
tail(weather)
print(weather)
View(weather)

#TIDYING_DATA
library(tidyr)
library(dplyr)
newweather <-weather[,-1] %>% gather(key = day, value = val, X1 : X31)  %>% 
  pivot_wider(names_from = measure, values_from = val)  
View(newweather)

#PREPARING_FOR_ANALYSIS
#i decided to keep days,months and years in different columns, because
#it may be convenient to select certain years/months/days as in the examples below

library(data.table)
draftday<-data.table(newweather$day) 
day<- separate(draftday, V1, c("X", "day"),sep = 1)[,2]
finalweather<-cbind(day, newweather[,-3])[,c(2,3,1,4:25)]
finalweather1 <- finalweather %>% mutate_at(vars(-Events), as.numeric)
View(finalweather1)

#examples
finalweather1 %>% select(c(1:5)) %>% subset(year==2014)
finalweather1 %>% select(year, month, day, Events) %>% subset(month==12) %>% subset(day==1)

#what about MISSING_VALUES?
is.na(finalweather1)
any(is.na(finalweather1))
sum(is.na(finalweather1))

#in case if missing values aren't meaningful
finalweather2<-na.omit(finalweather1)
any(is.na(finalweather2))

#OUTLIERS_&_ERRORS_DETECTION

summary(finalweather1)
summary(finalweather2)

boxplot(finalweather1$Max.TemperatureF, horizontal = T)
boxplot(finalweather1$Max.Dew.PointF,finalweather1$MeanDew.PointF,finalweather1$Min.DewpointF)
hist(finalweather1$Min.Humidity)
boxplot(finalweather2$Mean.VisibilityMiles, horizontal = T)
hist(finalweather2$PrecipitationIn)

#SAVING_DATA_SETS

saveRDS(finalweather1, "finalweather1.rds")
saveRDS(finalweather2, "finalweather2NONA.rds")
