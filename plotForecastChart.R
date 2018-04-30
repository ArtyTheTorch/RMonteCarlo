plotForecastChart <- function(oV, aV, pV, sD){

optimisticVelocity <- oV
actualVelocity <- aV
pessimisticVelocity <- pV
startDate <- sD

points1 <- seq(100,0 - actualVelocity,by = -actualVelocity)
points2 <- seq(100,0 - pessimisticVelocity,by = -pessimisticVelocity)
points3 <- seq(100,0 - optimisticVelocity,by = -optimisticVelocity)

length(points1) <- max(length(points1),length(points2),length(points3))
length(points2) <- max(length(points1),length(points2),length(points3))
length(points3) <- max(length(points1),length(points2),length(points3))

allPoints <- c(points1,points2,points3)

dates <- seq.Date(as.Date(sD),by = "+14 day", length.out = max(length(points1),length(points2),length(points3)))
allDates <- c(dates,dates,dates)

forecastData <- data.frame(allDates,allPoints)

#this is the example that gives a shaded region along the edges of the lines
# output$forecastPlot <- renderPlot(ggplot(data = forecastData) +
#    geom_smooth(mapping = aes(x = allDates, y = allPoints)))

#This example shows three layers stacked for a potential burndown
  p <- plotly::plot_ly(forecastData, x = ~dates, y = ~points2,
          showlegend = FALSE,
          name = 'Optimistic Guess',
          type = 'scatter',
          mode = 'lines') %>% #fill = 'tonexty'
    plotly::add_trace(y = ~points1,
              name = 'Actual Velocity',
              mode = 'lines',
              fill = 'tonexty',
              fillcolor = 'rgba(0,100,80,0.2)',
              line = list(color = 'rgba(255,0,0,1)')) %>% #, fill = 'tonexty'
    plotly::add_trace(y = ~points3,
              name = 'Pessimistic Guess',
              mode = 'lines',
              fill = 'tonexty') %>% #, fill = 'tozeroy'
    plotly::layout(title = 'Burndown Chart',
           xaxis = list(title = "Date",
                        showgrid = FALSE),
           yaxis = list(title = "Points",
                        showgrid = FALSE,
                        rangemode = "nonnegative")
    )
  p
}