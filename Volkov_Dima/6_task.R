library(ggplot2)
library(gapminder)
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp,size = pop, color = continent)) + geom_point() + facet_wrap(vars(year))
