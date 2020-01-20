library(shiny)
library(ggplot2)
library(dplyr)

data <- mtcars

data$cyl <- as.factor(data$cyl)
data$vs <- as.factor(data$vs)
data$am <- as.factor(data$am)
data$gear <- as.factor(data$gear)
data$carb <- as.factor(data$carb)


#Define UI for application
ui <- fluidPage(
  
  #Sidebar Layout:
  sidebarLayout(
    
    #Sidebar: for inputs here
    sidebarPanel(
      
      #Text
      textInput(inputId = "title",
                label = "Plot title:",
                placeholder = "Enter the title"),
      
      #Select data for x-axis
      selectInput(inputId = "x",
                  label = "X-axis",
                  choices = c("Miles/(US) gallon"="mpg",
                              "Displacement (cu.in.)"="disp",
                              "Gross horsepower"="hp",
                              "Rear axle ratio"="drat",
                              "Weight (1000 lbs)"="wt",
                              "1/4 mile time"="qsec"),
                  selected = "mpg"),
      
      #Select data for y-axis
      selectInput(inputId = "y",
                  label = "Y-axis",
                  choices = c("Miles/(US) gallon"="mpg",
                              "Displacement (cu.in.)"="disp",
                              "Gross horsepower"="hp",
                              "Rear axle ratio"="drat",
                              "Weight (1000 lbs)"="wt",
                              "1/4 mile time"="qsec"),
                  selected = "disp"),
      
      #Select date for color by
      selectInput(inputId = "color",
                  label = "Color by",
                  choices = c("Number of cylinders"="cyl",
                              "Engine (0 = V-shaped, 1 = straight)"="vs",
                              "Transmission (0 = automatic, 1 = manual)"="am",
                              "Number of forward gears"="gear",
                              "Number of carburetors"="carb"),
                  selected = "cyl"),
      
      #Select slider fo alpha parameter
      sliderInput(inputId = "alpha",
                  label = "alpha",
                  min = 0,
                  max = 1,
                  step = 0.1,
                  value = 0.5),
      
      numericInput(inputId = "size",
                   label = "Dot size:",
                   value = 3,
                   min = 1,
                   max = 9),
      
      #Checkbox1
      checkboxInput(inputId = "show_d",
                    label = "Show data?",
                    value = FALSE),
      
      #Checkbox2
      checkboxInput(inputId = "show_s",
                    label = "Show Summary?",
                    value = FALSE),
      
      submitButton("Apply",
                   icon = icon("check"))
      
    ),
    
    #Main panel: for outputs here
    mainPanel(
      
      #Plot output
      plotOutput(outputId = "scatter"),
      
      #Fluid row
      fluidRow(
        #Table output
        column(width = 4,
               tableOutput(outputId = "data_selected")
        ),
        column(width = 5,
               tableOutput(outputId = "summary"))
      )
    )
  )
)


#Define server logic required to draw a histogram
server <- function(input,output) {
  
  output$scatter <- renderPlot({
    req(input$size)
    
    ggplot(data,aes_string(x = input$x, 
                           y = input$y,
                           color = input$color)) +
      geom_point(alpha = input$alpha,
                 size = input$size) +
      ggtitle(tools::toTitleCase(isolate(input$title)))
  })
  
  new_data <- reactive({
    data %>% select_(input$x,input$y,input$color)
  })
  
  output$data_selected <- renderTable({
    if(input$show_d){
      new_data()
    }
  })
  
  output$summary <- renderTable({
    if(input$show_s){
      new_data() %>%
        group_by_(input$color) %>%
        summarise_all(funs(mean,sd))
    }
  })
}

#Run the application
shinyApp(ui = ui, server =server)
