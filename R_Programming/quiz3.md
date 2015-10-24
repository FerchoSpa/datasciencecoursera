Load iris dataset

library(datasets)
data(iris)

For a description: ?iris

There will be an object called 'iris' in your workspace. In this dataset, what is the mean of 'Sepal.Length' for the species virginica? 

Two ways:

vg=iris$Species=="virginica"
mean(iris$Sepal.Length[vg])

sp<-split(iris, iris$Species)
lapply(sp, function(x) colMeans(x[, c("Sepal.Length", "Petal.Width")]))





