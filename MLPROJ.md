---
output: html_document
---
# Machine Learning Project  

Loading Data and Packages  

```r
library(caret)                                             
```

```
## Loading required package: lattice
## Loading required package: ggplot2
```

```r
library(randomForest)
```

```
## randomForest 4.6-10
## Type rfNews() to see new features/changes/bug fixes.
```

```r
library(caTools)  
library(rpart)
library(rpart.plot)  
data = read.csv("pml-training.csv")
```

```
## Warning in file(file, "rt"): cannot open file 'pml-training.csv': No such
## file or directory
```

```
## Error in file(file, "rt"): cannot open the connection
```

```r
test = read.csv("pml-testing.csv")
```

```
## Warning in file(file, "rt"): cannot open file 'pml-testing.csv': No such
## file or directory
```

```
## Error in file(file, "rt"): cannot open the connection
```
Splitting training data into training and testing sets  

```r
inTrain = createDataPartition(y=data$classe,p=0.7,list=FALSE)
```

```
## Error in data$classe: object of type 'closure' is not subsettable
```

```r
training = data[inTrain,]
```

```
## Error in eval(expr, envir, enclos): object 'inTrain' not found
```

```r
testing = data[-inTrain,]
```

```
## Error in eval(expr, envir, enclos): object 'inTrain' not found
```

#split = sample.split(data$classe, SplitRatio = 0.6)
#training = subset(data, split == TRUE)
#testing = subset(data, split == FALSE)  

Removing useless variabes with no variance  

```r
useless <- nearZeroVar(training)
```

```
## Error in is.vector(x): object 'training' not found
```

```r
training <- training[, -useless]
```

```
## Error in eval(expr, envir, enclos): object 'training' not found
```


Training a Tree Model  

```r
Tree = rpart(classe ~., data=training, method="class", control=rpart.control(minbucket=100))
```

```
## Error in is.data.frame(data): object 'training' not found
```

```r
prp(Tree)
```

```
## Error in inherits(x, "rpart"): object 'Tree' not found
```

Predicting the validation data and evaluating performance  

```r
PredictCART = predict(Tree, newdata=testing, type="class")
```

```
## Error in predict(Tree, newdata = testing, type = "class"): object 'Tree' not found
```

```r
table(testing$classe, PredictCART)
```

```
## Error in table(testing$classe, PredictCART): object 'testing' not found
```

```r
print(confusionMatrix(PredictCART, testing$classe))
```

```
## Error in confusionMatrix(PredictCART, testing$classe): object 'PredictCART' not found
```

Model has 87% accuracy on new data set with Kappa of 83%
