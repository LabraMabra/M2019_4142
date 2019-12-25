library(shiny)
library(ggplot2)
library(dplyr)

df <- mtcars
df$cyl <- factor(df$cyl)
df$vs <- factor(df$vs)
df$am <- factor(df$am)
df$gear <- factor(df$gear)
df$carb <- factor(df$carb)


vector1 <- c("mpg", "disp", "hp", "drat", "wt", "qsec")
names(vector1) = c("Miles/(US) gallon","Displacement","Gross horsepower",
                   "Rear axle ratio","Weight (1000 lbs)","1/4 mile time")
vector2 <- c("cyl", "vs", "am", "gear", "carb")
names(vector2) = c("Number of cylinders","Engine (0 = V-shaped, 1 = straight)",
                     "Transmission","Number of forward gears","Number of carburetors")

# Define UI
ui <- fluidPage(
    sidebarLayout(
    
        sidebarPanel(
        
        textInput(inputId = "title",
            label = "Plot title",
            placeholder = "Enter the title"),
  
        selectInput(inputId = "x",
              label = "X-axis",
              choices = vector1,
              selected = "mpg"),
  
         selectInput(inputId = "y",
              label = "Y-axis",
              choices = vector1,
              selected = "disp"),
  
        selectInput(inputId = "color",
              label = "Color",
              choices = vector2,
              selected = "cyl"),
  
        sliderInput(inputId = "slider",
              label = "Alpha",
              min = 0, max = 1,
              value = 0.5),
  
        numericInput(inputId = "size",
               label = "Dotsize",
               min = 1, max = 9,
               value = 3),
  
        checkboxInput(inputId = "show_d",
                label = "Show data?",
                value = FALSE),
        
        checkboxInput(inputId = "show_s",
                label = "Show summary?",
                value = FALSE),
        
        submitButton("Submit",
                     icon = icon("check"))
        
      ),
      
      
      mainPanel(
        plotOutput(outputId = "scatter"),
        
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

#Define server
server <- function(input, output) {
  
  output$scatter <- renderPlot({
    req(input$size)
    
    ggplot(df, aes_string(x = input$x, y = input$y, color = input$color)) +
      geom_point(alpha = input$slider, size = input$size) +
      ggtitle(tools::toTitleCase(isolate(input$title)))
  })
  
  new_data <- reactive({
    df %>% select_(input$x, input$y, input$color)
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

#Run the application
shinyApp(ui = ui, server = server)
