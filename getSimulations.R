getSimulations <- function(a,b,c,sampleSize){
  # a: Lower bounds
  # b: Upper bounds
  # c: Peak such that a <= c <= b
  
  points <- as.numeric(runif(sampleSize))
  fc <- (c - a) / (b - a)
  
  for (i in 1:sampleSize){
    if (points[i] < fc){
      points[i] <- a + sqrt(points[i] * (b - a) * (c - a))
    }
    else{
      points[i] <- b - sqrt((1 - points[i]) * (b - a) * (b - c))
    }
  }
  
  points
}