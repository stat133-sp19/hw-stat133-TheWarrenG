#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyr)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("How to Invest"),
   
   fluidRow(
     column(4,
            sliderInput("initial",
                   label = h5("Initial Amount"),
                   min = 0, 
                   max = 100000,
                   step = 500,
                   value = 1000)
            ),
     
     column(4,
            sliderInput("return",
                        label = h5("Return Rate (in %)"),
                        min = 0, 
                        max = 20,
                        step = 0.1,
                        value = 5)
            ),
     
     column(4,
            sliderInput("years",
                        label = h5("Years"),
                        min = 0, 
                        max = 50,
                        step = 1,
                        value = 20)
     ),
     
     column(4,
            sliderInput("annual",
                        label = h5("Annual Contribution"),
                        min = 0, 
                        max = 50000,
                        step = 500,
                        value = 2000)
     ),
     
     column(4,
            sliderInput("growth",
                        label = h5("Growth Rate (in %)"),
                        min = 0, 
                        max = 20,
                        step = 0.1,
                        value = 2)
     ), 
     
     column(4,
            selectInput("facet",
                        label = h5("Facet?"),
                        choices = list("Yes" = 1,
                                       "No" = 2),
                        selected = 2)
     ),
     
     column(12,
            h4("Timelines"),
            plotOutput("timelines")),

     column(12,
            h4("Balances"),
            tableOutput("balances"))
   )
)

#' @title Future Value
#' @description Calculates future value of investment
#' @param amount Initial investment (numeric)
#' @param rate Annual rate of return in decimal (numeric)
#' @param years Number of years of investment
future_value <- function(amount, rate, years) {
  return(amount * (1 + rate) ^ years)
}

#' @title Future Value of Annuity
#' @description Calculates future value of annuity
#' @param contrib Initial contributed amount of investment
#' @param rate Annual rate of return in decimal (numeric)
#' @param years Number of years of investment
annuity <- function(contrib, rate, years) {
  return(contrib * ((1 + rate) ^ years - 1) / rate)
}

#' @title Future Value of Growing Annuity
#' @description Calculates future value of growing annuity
#' @param contrib Initial contributed amount of investment (numeric)
#' @param growth Annual growth rate in decimal (numeric)
#' @param rate Annual rate of return in decimal (numeric)
#' @param years Number of years of investment (numeric)
growing_annuity <- function(contrib, rate, growth, years) {
  return(contrib * ((1 + rate) ^ years - (1 + growth) ^ years) / (rate - growth))
}

server <- function(input, output) {
   
  modalities <- reactive({
    data.frame(year = 0:input$years,
               no_contrib = future_value(input$initial, input$return / 100, 0:input$years),
               fixed_contrib = future_value(input$initial, input$return / 100, 0:input$years) +
                 annuity(input$annual, input$return / 100, 0:input$years),
               growing_contrib = future_value(input$initial, input$return / 100, 0:input$years) +
                 growing_annuity(input$annual, input$return / 100, input$growth / 100, 0:input$years))
  })
  
  modalities_gathered <- reactive({
    gather(modalities(), "modality", "investment", no_contrib:growing_contrib)
  })
  
  output$timelines <- renderPlot({
    if (input$facet == 1) {
      ggplot(data = modalities_gathered(), aes(x = year, y = investment,
                                               color = modality, fill = modality)) +
        geom_line(size = 1.3) +
        geom_point(size = 3) +
        geom_area() +
        labs(title = bquote("Three modes of Investment"),
             x = bquote("year"), y = bquote("value")) +
        facet_wrap( ~ modality)
    } else {
      ggplot(data = modalities_gathered(), aes(x = year, y = investment, color = modality)) +
        geom_line(size = 1.3) +
        geom_point(size = 3) +
        labs(title = bquote("Three modes of Investment"),
             x = bquote("year"), y = bquote("value"))
    }
    })
   
  output$balances <- renderTable({
    modalities()
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

