library(randomForest)
library(tidyverse) 
library(caret)

##randomForest
rf1 <- randomForest(
  Species ~ .,
  data = iris,
  ntree = 2000,
  mtry = 2,
  importance = TRUE
)

data.frame(Gini = sort(importance(rf1, type = 2)[,], decreasing = T))

varImpPlot(rf1)


##caret
rf2 <- train(
  Species ~ .,
  data = iris,
  method = "rf",
  ntrees = 2000,
  ##same as randomForest
  importance = TRUE,
  ##same as randomForest
  metric = "Kappa",
  tuneGrid = data.frame(mtry = 2),
  trControl = trainControl(method = "none")
) ##Stop the default bootstrap=25

varImp(rf2, type = 2, scale = FALSE)

plot(varImp(rf2, type = 2, scale = FALSE))
