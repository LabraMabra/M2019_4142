library(gapminder)

#ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) 
#получилась одна диаграмма lifeExp и gdpPercap

# + facet_wrap(vars(year))
#добавлено распределение по годам

# + geom_point(aes(size = pop, color = continent)) 
#добавлено распределение по размеру и по цвету

# + scale_x_log10() 
#исправлена шкала X для качественного распределения 

#итоговая формула для графика: 
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(aes(size = pop, color = continent)) + scale_x_log10() + 
  facet_wrap(vars(year))

#исправленные заголовки:
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(aes(size = pop, color = continent)) + scale_x_log10() + 
  facet_wrap(vars(year)) + 
  labs(x = "GDP per capita", y = "Life expectancy", 
       title = "The dependency of Life expectancy from GDP", 
       subtitle = "The data is shown depending on different ages, continents and amount of population in particular country", 
       size = "Population", color = "Continents")

#другой вариант графика:
ggplot(gapminder, aes(x = gdpPercap, y = pop)) + 
  geom_point(aes(color = as.factor(year))) + scale_y_log10() + 
  scale_x_log10() + facet_wrap(vars(continent)) + 
  labs(x = "GDP per capita", y = "Population", title = "The dependency of Population from GDP", 
       subtitle = "The data is shown depending on different years and continents of particular country", 
       color = "Year")






