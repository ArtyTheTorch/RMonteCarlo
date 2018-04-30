getPercentLikelihoodChart <- function(vPoints,sPoints,startDate,daysPerIteration){

  #Array of remaining iterations
  iterationsRemaining <- sPoints/vPoints
  dates <- startDate + daysPerIteration * iterationsRemaining

  graphData <- data.frame(iterationsRemaining,dates)

  likelihoodPoint <- graphData[order(dates),][length(graphData$dates)*.8,]
  likelihoodPoints <- seq(0,1-1/length(graphData$dates), by=1/length(graphData$dates))
  graphData$hoverText=paste("Value: ",graphData$likelihoodPoints, sep="")#added recently
  
  r <- plot_ly(graphData) %>%
    add_histogram(
               x = graphData$dates,
               type = "histogram",
               alpha = 0.6,
               cumulative = list(enabled=TRUE),
               text=graphData$hoverText, #added recently
               #hoverinfo = "graphData$iterationsRemaining",
               hoverinfo = "text+x",
               name = "Number of trials") %>%
    #Set the Likelyhood line to be a relative 80% of the trials completed
    add_trace(x = c(min(graphData$dates), max(graphData$dates)),
              y = c(length(graphData$dates)*.8, length(graphData$dates)*.8),
              type = 'scatter',
              mode = 'lines',
              name = "likelihood Line") %>%
    add_trace(x = likelihoodPoint$dates,
              y = length(graphData$dates)*.8,
              type = 'scatter',
              mode = 'markers',
              name = "Likely",
              alpha = 1.0,
              marker = list(size = 10,
                   color = 'green',
                   line = list(color = 'green',
                               width = 2))
              ) %>%
    layout(title = 'Burndown Chart',
           barmode = "overlay",
           xaxis = list(title = "Date",
                        showgrid = FALSE),
           yaxis = list(title = "Percent compele",
                        showgrid = FALSE,
                        rangemode = "nonnegative")
    )
  r
}
