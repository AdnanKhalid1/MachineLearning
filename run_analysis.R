setwd("D:/E/DataSc/Getting and Cleaning Data/p")
library(data.table)

train = read.table("X_train.txt")
test <-read.table("X_test.txt")

dim(train)
dim(test)

mergedData= rbind(train,test)

dim(mergedData)

write.table(mergedData,"Merged.txt",row.name=FALSE)

write.csv(mergedData,"Merged.csv")
head(mergedData)
str(train)


head(train)






















































