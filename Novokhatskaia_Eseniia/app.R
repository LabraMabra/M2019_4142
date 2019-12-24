library(shiny)
library(ggplot2)
library(dplyr)

data <- mtcars
data [,2] <- as.factor(data[,2])
data [,8] <- as.factor(data[,8])
data [,9] <- as.factor(data[,9])
data [,10] <- as.factor(data[,10])
data [,11] <- as.factor(data[,11])

ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      textInput(inputId = 'title',
                label = 'Plot title:',
                placeholder = 'Enter the title'),
      selectInput(inputId = "x",
                  label = "X-axis",
                  choices = c("Miles per gallon" = "mpg", "Displacement" = "disp", "Gross horsepower" = "hp", "Rear axle ratio" = "drat", "Weight" = "wt", "1/4 mile time" = "qsec"),
                  selected = 'mpg'),
      selectInput(inputId = "y",
                  label = "Y-axis",
                  choices = c("Miles per gallon" = "mpg", "Displacement" = "disp", "Gross horsepower" = "hp", "Rear axle ratio" = "drat", "Weight" = "wt", "1/4 mile time" = "qsec"),
                  selected = 'disp'),
      selectInput(inputId = "color",
                  label = "Color by",
                  choices = c("Number of cylinders" = "cyl", "Engine" = "vs", "Transmission" = "am", "Number of forward gears" = "gear", "Number of carburetors" = "carb"),
                  selected = 'cyl'
                 ),
      sliderInput(inputId = 'alpha',
                  label = "Alpha",
                  min = 0, max = 1,
                  value = 0.5),
      numericInput(inputId = 'size',
                   label = 'Dot size:',
                   value = 3,
                   min = 1, max = 9),
      checkboxInput(inputId = 'show_d',
                    label = 'Show data?',
                    value = FALSE),
      checkboxInput(inputId = 'show_s',
                    label = 'Show summary?',
                    value = FALSE),
      submitButton(text = "Apply")
    ),
    mainPanel(
      plotOutput(outputId = "scatter"),
      fluidRow(
        column(width = 6,
               tableOutput(outputId = 'data_selected')
        ), 
        column(width = 6, 
               tableOutput(outputId = 'summary')
        )
    )
  )
))

server <- function(input, output) {
  output$scatter <- renderPlot({
    req(input$size)
    ggplot(data, aes_string(x = input$x, y = input$y, color = input$color)) + 
      geom_point(alpha = input$alpha, size = input$size) +
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
    if(input$show_s) {
      new_data() %>%
        group_by_(input$color) %>%
        summarise_all(funs(mean, sd))
    }
  })
}

shinyApp(ui = ui, server = server)

