plotTriRandomVariables <- function(points){
  r <- plot_ly(x = points, type = "histogram") %>%
       layout(title = 'Histogram of the random simulations generated',
                      xaxis = list(title = "Velocity",
                                   showgrid = FALSE),
                      yaxis = list(title = "Frequency",
                                   showgrid = FALSE)
               )
  r
}