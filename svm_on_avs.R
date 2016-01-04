library(e1071)
xyz1<- read.csv(file="all_let_ukar.csv",head=TRUE,sep=",")
xyz2<- read.csv(file="test.csv",head=TRUE,sep=",")
model <- svm(P1~., data = xyz1)
print(model)
summary(model)
#index <- 1:nrow(xyz1)
#testindex <- sample(index, trunc(length(index)/719))
testset <- xyz2
print(testset)
trainset <- xyz1
print(trainset)
model <- svm(P1~., data = trainset)
prediction <- predict(model, testset[,-1])
if(prediction==1)
  print("abc\n")
tab <- table(pred = prediction, true = testset[,1])
classAgreement(tab)
print(tab) 


