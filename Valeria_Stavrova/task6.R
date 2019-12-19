library(gapminder)
library(ggplot2)
library(dplyr)

#variant as in the presentation
ggplot(gapminder, aes(y=lifeExp,
                      x=gdpPercap,
                      color=continent,
                      size=pop)) +
      geom_point()+
      facet_wrap(.~year)+
      scale_x_log10()

#a nice one
ggplot(gapminder, aes(y=lifeExp,
                      x=gdpPercap,
                      fill=continent,
                      size=pop)) +
       geom_point(shape=21,
                  color = "black",
                  alpha=0.8)+
       facet_wrap(.~year)+
scale_x_log10()+
scale_fill_brewer(palette = "RdPu")+
ggtitle("Correlation between life expectancy and gdp per capita") +
xlab("GDP per Capita [log 10]") + ylab("Life Expectancy") +
guides(fill=guide_legend(title = "Continents"),
         size = guide_legend(title = "Population [log10]")) +
theme_bw()


#another plot #1
ggplot(gapminder, aes(x=lifeExp, y=year, group=country)) +
    geom_line(color="purple") +
    ggtitle("Changes in life Expectancy from 1952 to 2007")+
    facet_grid(.~continent)+
    xlab("Life Expectancy") + ylab("Years") +
    theme_classic()

#another plot #2
gapminder %>% filter(country=="Bulgaria") %>%  
  ggplot(aes (x=year, y=lifeExp))+
         geom_line(color="red")+
  ggtitle("How has life expectancy changed in Bulgaria over time?")+
  xlab("Years") + ylab("Life Expectancy") +
  theme_classic()

#another plot #3
gapminder %>% filter(year=="2007") %>%  
  ggplot(aes(x=continent, y=lifeExp, fill=continent)) +
  geom_boxplot()+
  ggtitle("Averange life expectancy in different continents for 2007")+
  xlab("Life Expectancy") + ylab("Years") +
  theme_classic()
  
  
  
  


         
 
 