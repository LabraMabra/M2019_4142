library(shiny)
library(ggplot2)
library(tidyverse)

# Add data and change the type of columns
data <- mtcars
data$cyl <- as.factor(data$cyl)
data$vs <- as.factor(data$vs)
data$am <- as.factor(data$am)
data$gear <- as.factor(data$gear)
data$carb <- as.factor(data$carb)

# Change the name of the columns
select <- c("mpg", "disp", "hp", "drat", "wt", "qsec")
names(select) <-  c("Miles/(US) gallon", 
                  "Displacement (cu.in.)",
                  "Gross horsepower",
                  "Rear axle ratio",
                  "Weight (1000 lbs)",
                  "1/4 mile time")

colorby <- c("cyl", "vs", "am", "gear", "carb")
names(colorby) <-  c("Number of cylinders",
                     "Engine",
                     "Transmission",
                     "Number of forward gears",
                     "Number ofcarburetors")


ui <- fluidPage(

    # Sidebar 
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
                        choices = colorby,
                        selected = "cyl"),
            
            sliderInput(inputId = "slider",
                        label = "Alpha",
                        min = 0, max = 1,
                        value = 0.7),
            
            numericInput(inputId = "size",
                        label = "Dot size:",
                        min = 1, max = 9,
                        value = 3),
            
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
