library(gapminder)
library(ggplot2)
library(tidyr)
library(dplyr)

gapData <- gapminder
ggplot(gapData, aes(x = log(gdpPercap), y = lifeExp, color = continent, size = pop)) +
  geom_point() +
  facet_wrap(~ year) 

ggplot(gapData[c(13:24,73:84),], aes(x = year, y = pop, color = country)) +
  geom_line() +
  ggtitle("Austria vs. Albania")
