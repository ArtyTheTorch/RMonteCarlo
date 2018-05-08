
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(plotly)

source("plotForecastChart.r")
source("plotRandomVelocityChart.r")
source("getSimulations.r")
source("getPercentLikelihoodChart.r")

shinyServer(function(input, output) {
  observe({
    #"Burn-Down Chart"
    #output$forecastPlot <- renderPlotly(plotForecastChart(input$velOptiGuess,input$velActualVelocity,input$velPessiGuess))

    
    
    velocityData <<- getSimulations(input$velPessiGuess,input$velOptiGuess,input$velActualVelocity,1000)
    scopeData <<- getSimulations(input$scopePessiGuess,input$scopeOptiGuess,input$scopeActual,1000)
    
    #VELOCITY
    output$plotRandomVelocity <- renderPlotly(plotTriRandomVariables(velocityData))
  
    #SCOPE
    output$plotRandomScope <- renderPlotly(plotTriRandomVariables(scopeData))
    
    output$plotResults <- renderPlotly(getPercentLikelihoodChart(velocityData,scopeData,input$startDate,input$daysPerIteration))
  })
})
