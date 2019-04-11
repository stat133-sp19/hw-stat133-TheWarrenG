#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("How to Invest"),
   
   fluidRow(
     column(4,
            sliderInput("Initial",
                   label = h5("Initial Amount"),
                   min = 0, 
                   max = 100000,
                   step = 500,
                   value = 1000)
            ),
     
     column(4,
            sliderInput("Return",
                        label = h5("Return Rate (in %)"),
                        min = 0, 
                        max = 20,
                        step = 0.1,
                        value = 5)
            ),
     
     column(4,
            sliderInput("Years",
                        label = h5("Years"),
                        min = 0, 
                        max = 50,
                        step = 1,
                        value = 20)
     ),
     
     column(4,
            sliderInput("Annual Contribution",
                        label = h5("Annual Contribution"),
                        min = 0, 
                        max = 50000,
                        step = 500,
                        value = 2000)
     ),
     
     column(4,
            sliderInput("Growth",
                        label = h5("Growth Rate (in %)"),
                        min = 0, 
                        max = 20,
                        step = 0.1,
                        value = 2)
     ), 
     
     column(4,
            selectInput("Facet",
                        label = h5("Facet?"),
                        choices = list("Yes" = 1,
                                       "No" = 2),
                        selected = 2)
     )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

