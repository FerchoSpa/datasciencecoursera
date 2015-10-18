corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  completeInfo <- complete(directory)
  csvAboveThreshold <- integer()
  
  for (i in 1:nrow(completeInfo)) {
    if (completeInfo$nobs[i]>threshold) {
      csvAboveThreshold <- append(csvAboveThreshold, i)
    }
  }

  correlationVector <- vector()
  
  # Go over all the CSV that have right level of complete cases
  for (i in 1:length(csvAboveThreshold)) {
    idx<-csvAboveThreshold[i]
    filename = paste0(directory, "/", sprintf("%03d", idx), ".csv")
    d <- read.csv(filename)
    good<-complete.cases(d)
    sulfateData <- d$sulfate[good]
    nitrateData <- d$nitrate[good]
    correlationVector <- append(correlationVector, cor(sulfateData, nitrateData))
  }
  correlationVector
}