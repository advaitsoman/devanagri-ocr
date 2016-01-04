library(e1071)
xyz1<- read.csv(file="C:\\Users\\Admin\\Documents\\all_let_ukar.csv",head=TRUE,sep=",")
xyz2<- read.csv(file="C:\\Users\\Admin\\Documents\\test.csv",head=TRUE,sep=",")
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
write.table(tab, file="C:\\Users\\Admin\\Documents\\op.csv", row.names=FALSE, col.names=FALSE,sep=",")
