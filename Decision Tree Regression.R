#Fitting Decision Tree Regression to the dataset
#no need for feature scaling since based on conditions of independent variables
#install.packages('rpart')
library(rpart)
regressor = rpart(formula = Salary ~ .,
                data = dataset,
                control = rpart.control(minsplit = 1))

#Predicting a new result 
y_pred = predict(regressor, data.frame(Level = 6.5))

#Visualising the 1D Decision Tree Regression Model results (for higher resolution)
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') + 
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid)),
            colour = 'blue')) +
  ggtitle('Truth or Bluff (Decision Tree Regression)') +
  xlab('level') +
  ylab('Salary')

#result based on splits
#add parameters that would set the conditions of splits