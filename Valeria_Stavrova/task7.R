library(shiny)
library(ggplot2)
library(dplyr)

data <-mtcars

data$cyl <- as.factor(data$cyl)
data$vs <- as.factor(data$vs)
data$am <- as.factor(data$am)
data$gear <- as.factor(data$gear)
data$carb <- as.factor(data$carb)


ui <-fluidPage(
  
  sidebarLayout(
    sidebarPanel(
      textInput(inputId = "title",
                label="Plot title:",
                placeholder = "Enter the title"),
      selectInput(inputId = "x",
                  label = "X-axis",
                  choices = c("Miles/(US)gallon"="mpg", "Displacement"="disp", "Gross horsepower"="hp","Rear axle ratio"="drat",
                              "Weight (1000 lbs)"= "wt","1/4 mile time"= "qsec"),
                  selected= "mpg"),
      selectInput(inputId = "y",
                  label="Y-axis",
                  choices = c("Miles/(US)gallon"="mpg", "Displacement"="disp", "Gross horsepower"="hp","Rear axle ratio"="drat",
                              "Weight (1000 lbs)"= "wt","1/4 mile time"= "qsec"),
                  selected= "disp"),
        selectInput(inputId = "color",
                  label="Color by",
                  choices = c("Number of cylinders"="cyl","Engine type"="vs","Transmission"="am",
                              "Number of forward gears"="gear","Number of carburetors"="carb"),
                  selected= "disp"),
      sliderInput(inputId = "slider",
                  label = "Alpha:",
                  min=0, max=1,
                  value=0.7),
      numericInput(inputId = "size",
                   label="Dot size:",
                   min=1, max=9,
                   value=3),
      checkboxInput(inputId= "show_d",
                    label="Show data?",
                    value=F),
      checkboxInput(inputId= "show_s",
                    label="Show summary?",
                    value=F),
      submitButton("Apply Changes",
                   icon = icon("check"))
      
    ),
    
    mainPanel(
      plotOutput(outputId = "scatter"),
      
      fluidRow(
        column(width = 4,
               tableOutput(outputId = "data_selected")
        ),
        column(width=4,
               tableOutput(outputId = "summary"))
               )
      )
    )
  )

server <-function(input,output){
  
  output$scatter <-renderPlot({
    
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

shinyApp(ui=ui, server=server)


