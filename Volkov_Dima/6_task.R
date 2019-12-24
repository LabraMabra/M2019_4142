library(ggplot2)
library(gapminder)
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp,size = pop, color = continent)) + geom_point() + facet_wrap(vars(year))+ labs(title = "New plot",x = 'GDP per capita', y ='Life expectancy at birth')
