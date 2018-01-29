getwd()
setwd('G:\\UDEMY\\SDS\\Machine_Learning\\Data_Preprocessing')
#Importing the data set
dataset <- read.csv('Data.csv')
# dataset = dataset[, 2:3]


#Encoding categorical data

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
# View(training_set)
# View(test_set)

#Feature Scaling
#training_set[, 2:3] = scale(training_set[, 2:3])
#test_set[, 2:3] = scale(test_set[, 2:3])





