complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  #good<-complete.cases(d)
  #sum(as.integer(good))
  #ns<-append(ns, 4)
  #obss<-append(obss, 4)
  #df<-data.frame(foo=ns, bar=obss)
  
  ids <- integer()
  nobs <- integer()
  for (i in id) {
    filename = paste0(directory, "/", sprintf("%03d", i), ".csv")
    d <- read.csv(filename)
    good<-complete.cases(d)
    nCompleteCases <- sum(as.integer(good))
    ids <- append(ids, i)
    nobs <- append(nobs, nCompleteCases)
  }
  data.frame(id=ids, nobs=nobs)
  
}