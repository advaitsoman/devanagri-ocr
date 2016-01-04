library(e1071)
xyz1<- read.csv(file="C:\\Users\\Admin\\Documents\\jod_train.csv",head=TRUE,sep=",")
xyz2<- read.csv(file="C:\\Users\\Admin\\Documents\\jod_test.csv",head=TRUE,sep=",")
model <- svm(P1~., data = xyz1)
print(model)
summary(model)
testset <- xyz2
trainset <- xyz1
model <- svm(P1~., data = trainset)
prediction <- predict(model, testset[,-1])
tab <- table(pred = prediction, true = testset[,1])
classAgreement(tab)
print(tab) 
write.table(tab, file="C:\\Users\\Admin\\Documents\\op_jod.csv", row.names=FALSE, col.names=FALSE,sep=",")
