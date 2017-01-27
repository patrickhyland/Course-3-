subtrain <- fread("subject_train.txt")
subtest <- fread("subject_test.txt")
xtest <- fread("X_test.txt")
ytest <- fread("y_test.txt")
xtrain <- fread("X_train.txt")
ytrain <- fread("y_train.txt")

features <- fread("features.txt")
#names(xtest) <- as.character(features[,2])
features <- features[,2]
names(xtest) <- as.character(features)
for(i in 1:nrow(features)){
  names(xtest)[i] = as.character(features[i])
}
for(i in 1:nrow(features)){
  names(xtrain)[i] = as.character(features[i])
}
library(dplyr)
names(features) <- "Activity"
names(subtrain) <- "SubID"
names(subtest) <- "SubID"
xtrain <- cbind(subtrain,xtrain)
xtest <- cbind(subtest,xtest)
xtrain <- cbind(ytrain,xtrain)
xtest <- cbind(ytest,xtest)
names(xtrain)[1] <- "Activity"
names(xtest)[1] <- "Activity"
data <- rbind(xtrain,xtest)
meanstd <- grep(".*mean.*|.*std.*", names(data))
onlymeanstd <- data[,c(1,2,meanstd),with=FALSE]
labels <- fread("activity_labels.txt")


onlymeanstd$Activity <- as.numeric(onlymeanstd$Activity )
merged <- merge(labels,onlymeanstd,by.x="V1",by.y="Activity", all = TRUE)
merged <- rename(merged, ActivityLabel = V2)

merged <- merged[,2:ncol(merged)]
names(merged) <- gsub("\\(\\)","",names(merged))
names(merged) <- gsub("\\-","",names(merged))
names(merged)


library(dplyr)

prob5data <- (aggregate(merged[,3:ncol(merged)],list(merged$ActivityLabel, merged$SubID),mean))
prob5data <- (rename(prob5data, Activity = Group.1, SubID = Group.2))

write.table(prob5data, file = "prob5data.txt", row.name=FALSE)
