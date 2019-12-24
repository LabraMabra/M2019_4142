library(gapminder)
library(ggplot2)
library(dplyr)

#presentation
ggplot(gapminder, aes(y=lifeExp,
                      x=gdpPercap,
                      color=continent,
                      size=pop)) +
  geom_point()+
  facet_wrap(~ year)+
  scale_x_log10()

#plot #1
ggplot(subset(gapminder, continent != "Oceania"),
       aes(x = year, y = lifeExp, group = country, color = country)) +
  geom_line(lwd = 1, show_guide = FALSE) +
  ggtitle("Changes in life Expectancy by continent")+
  facet_wrap(~ continent) +
  scale_color_manual(values = country_colors) +
  theme_bw() + theme(strip.text = element_text(size = rel(1.1)))


#plot #2
gapminder %>% filter(country=="Egypt") %>%  
  ggplot(aes (x=year, y=lifeExp))+
  geom_line(color="green")+
  ggtitle("Egypt life expectancy changing")+
  theme_classic()

#plot #3
gapminder %>% 
  dplyr::filter(continent == "Asia") %>% 
  ggplot(mapping = aes(x = year, y = lifeExp, fill = year)) +
  geom_col() +
  ggtitle("Asia") +
  coord_polar()
