#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(tidyverse)

df <- mtcars
df$cyl <-  as.factor(df$cyl)
df$vs <- as.factor(df$vs)
df$am <- as.factor(df$am)
df$gear <- as.factor(df$gear)
df$carb <- as.factor(df$carb)
data <- df

select <-  c("mpg","disp","hp","drat","wt","qsec");
names(select) = c("Miles/(US) gallon","Displacement","Gross horsepower",
                  "Rear axle ratio","Weight (1000 lbs)","1/4 mile time")
color <- c('cyl','vs','am','gear','carb')
names(color) = c("Number of cylinders","Engine (0 = V-shaped, 1 = straight)",
                 "Transmission","Number of forward gears","Number of carburetors")
# Define UI for application that draws a histogram
ui <- fluidPage(
    sidebarLayout(
        
        sidebarPanel(
            
            textInput(inputId = "title",
                      label = "Plot title:",
                      placeholder = "Enter the title"),
            
            selectInput(inputId = "x",
                        label = "X-axis",
                        choices = select,
                        selected = "mpg"),
            
            selectInput(inputId = "y",
                        label = "Y-axis",
                        choices = select,
                        selected = "disp",),
            
            selectInput(inputId = "color",
                        label = "Color by",
                        choices = color,
                        selected = "cyl"),
            
            sliderInput(inputId = "slider",
                        label = "Alpha",
                        min = 0, max = 1,
                        value = 0.5),
            
            numericInput(inputId = "size",
                         label = "Dot size:",
                         min = 1, max = 10,
                         value = 5),
            
            checkboxInput(inputId = "show_d",
                          label = "Show data?",
                          value = F),
            
            checkboxInput(inputId = "show_s",
                          label = "Show summary?",
                          value = F),
            
            submitButton("Apply",
                         icon = icon("check"))
            
        ),
        
        # Main
        mainPanel(
            plotOutput("scatter"),
            
            fluidRow(
                column(width = 5,
                       tableOutput(outputId = "data_selected")
                ),
                column(width = 5,
                       tableOutput(outputId = "summary")
                ),
            )
        )
    )
)

# Server
server <- function(input, output) {
    
    output$scatter <- renderPlot({
        req(input$size)
        
        ggplot(data, aes_string(x = input$x, y = input$y, color = input$color)) +
            geom_point(alpha = input$slider, size = input$size) +
            ggtitle(tools::toTitleCase(isolate(input$title)))
    })
    
    new_data <- reactive({
        data %>% select_(input$x, input$y, input$color)
    })
    
    output$data_selected <- renderTable({
        if (input$show_d) {
            new_data() 
        }
    })
    
    output$summary <- renderTable({
        if (input$show_s) {
            new_data() %>%
                group_by_(input$color) %>% 
                summarise_all(funs(mean, sd))
        }
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
