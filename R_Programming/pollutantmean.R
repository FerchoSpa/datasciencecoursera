pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  totalSum <- 0.0
  nMeasurements <- 0
  for (i in id) {
    filename = paste0(directory, "/", sprintf("%03d", i), ".csv")
    data <- read.csv(filename)
    dataOfInteres <- data[pollutant]
    notNaIndeces <- !is.na(dataOfInteres)
    dataNoNA <- dataOfInteres[notNaIndeces]
    nMeasurements <- nMeasurements + length(dataNoNA)
    totalSum <- totalSum + sum(dataNoNA)
  }
  totalSum/nMeasurements
}