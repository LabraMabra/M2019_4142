library(gapminder)
library(ggplot2)
library(dplyr)

#example
data <- gapminder
ggplot(data, aes(x = gdpPercap,
                 y = lifeExp,
                 color = continent,
                 size = pop)) +
  geom_point() +
  facet_wrap(~ year) +
  scale_x_log10()+
  xlab("GDP per Capita") + ylab("Life Expectancy") +
  ggtitle("Relevance between lifeExp and gpdPercap")

#Plot1
data1 <- data %>% filter(country == "China" | country == "Japan" )
ggplot(data1, aes(x=year, 
                  y=lifeExp,
                  color=country
                  ))+
  geom_line()+
  ggtitle("Comparison of lifeExp between China and Japan")

#plot2
data2 <- data %>% filter(continent == "Europe")
ggplot(data2, aes(x=gdpPercap,
                  y=lifeExp,
                  color=factor(year)))+
  facet_wrap(~ country)+
  geom_point()+
  ggtitle("Changes in life expectancy in European countries")


