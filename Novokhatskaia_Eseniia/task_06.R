#ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) 
#получилась одна диаграмма lifeExp и gdpPercap

# + facet_wrap(vars(year))
#добавлено распределение по годам

# + geom_point(aes(size = pop, color = continent)) 
#добавлено распределение по размеру и по цвету

# + scale_x_log10() 
#исправлена шкала X для качественного распределения 

#итоговая формула для графика: 
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) + geom_point(aes(size = pop, color = continent)) + scale_x_log10() + facet_wrap(vars(year))