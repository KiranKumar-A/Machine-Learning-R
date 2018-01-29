getwd()
setwd('G:\\UDEMY\\SDS\\Machine_Learning\\Data_Preprocessing')
#Importing the data set
dataset <- read.csv('Data.csv')
dataset


#Taking care of missing data
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(X) mean(X, na.rm = TRUE)),
                     dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary),
                     ave(dataset$Salary, FUN = function(X) mean(X, na.rm = TRUE)),
                     dataset$Salary)


summary(dataset)
str(dataset)


#Encoding categorical data
dataset$Country <- factor(dataset$Country,
                          levels = c('France', 'Spain', 'Germany'),
                          labels = c(1, 2, 3))

dataset$Purchased <- factor(dataset$Purchased,
                          levels = c('No', 'Yes'),
                          labels = c(0,1))
                      



# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
?caTools
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
split

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

View(training_set)
View(test_set)

#Feature Scaling
training_set[, 2:3] = scale(training_set[, 2:3])
test_set[, 2:3] = scale(test_set[, 2:3])





