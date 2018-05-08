
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
#library(shinyBS)
library(shinydashboard)
#library(flexdashboard)
#library(plyr)
#library(ggplot2)
library(plotly)
#library(lubridate)
#library(dplyr)
#library(tidyr)
#library(TTR)
#library(rmarkdown)

shinyUI(
  fluidPage(

    # Application title
    titlePanel("Team Monte Carlo Forecast"),
    
    mainPanel(
      fluidRow(tags$style(".nav-tabs{
            border-bottom: hidden;
                          }"),
        shinydashboard::box(
          tabsetPanel(type = "tabs",
            tabPanel(
              h4("Velocity"),
              column(3,
                wellPanel(
                  sliderInput("velOptiGuess", "Optimistic Guess", min = 1, max = 50, value = 7),
                  sliderInput("velActualVelocity", "Actual Velocity", min = 1, max = 50, value = 5),
                  sliderInput("velPessiGuess", "Pessimistic Guess", min = 1, max = 50, value = 3)
                )
              ),
              column(9,
                wellPanel(
                  plotlyOutput("plotRandomVelocity")
                )
              )
            ),
            tabPanel(h4("Scope"),
              column(3,
                wellPanel(
                  sliderInput("scopeOptiGuess", "Pessimistic Scope Increase Guess", min = 1, max = 200, value = 100),
                  sliderInput("scopeActual", "Optimistic Scope Increase Guess", min = 1, max = 200, value = 75),
                  sliderInput("scopePessiGuess", "Remaining Scope", min = 1, max = 200, value = 60)
                )
              ),
              column(9,
                wellPanel(
                  plotlyOutput("plotRandomScope")
                )
              )
            )
          ),
          width =12
        )
      ),
      fluidRow(
        column(3,
               wellPanel(
                 numericInput("daysPerIteration", "Number of days per iteration", value =10),
                 dateInput("startDate","Forecast Start Date", value = NULL)
              )
        ),
        column(9,
          wellPanel(
            plotlyOutput("plotResults")
          )
        )
      )
    )
  )
)