library(e1071)
xyz1<- read.csv(file="chars_Plus_modi_app.csv",head=TRUE,sep=",")
model <- svm(P1~., data = xyz1)
print(model)
summary(model)
index <- 1:nrow(xyz1)
testindex <- sample(index, trunc(length(index)/3))
testset <- xyz1[testindex,]
#print(testset)
trainset <- xyz1[-testindex,]
#print(trainset)
model <- svm(P1~., data = trainset)
prediction <- predict(model, testset[,-1])
tab <- table(pred = prediction, true = testset[,1])
#i=0
#j=0
#while(tab[i][j]!=1)
#  j++;
classAgreement(tab)
#print(tab)