library(tidyr)
library(dplyr)
library(reshape2)

# reading data
xtrain <- read.table("X_train.txt", stringsAsFactors = FALSE, header=FALSE)
ytrain <- read.table("y_train.txt", header = FALSE, stringsAsFactors = FALSE)
subjtrain <- read.table("subject_train.txt", header = FALSE, stringsAsFactors = FALSE)

xtest <- read.table("X_test.txt", header = FALSE, stringsAsFactors = FALSE)
ytest <- read.table("y_test.txt", header = FALSE, stringsAsFactors = FALSE)
subjtest <- read.table("subject_test.txt", header = FALSE, stringsAsFactors = FALSE)

features <- read.table("features.txt", stringsAsFactors = FALSE)
actnames <- read.table("activity_labels.txt", header = FALSE, stringsAsFactors = FALSE)

# 1. Merges the training and the test sets to create one data set.
xtrain$subject <- subjtrain$V1
xtrain$activity <- ytrain$V1

xtest$subject <- subjtest$V1
xtest$activity <- ytest$V1

xdata <- rbind(xtest, xtrain)

colnames(xdata) <- c(features[,2], "subject", "activity")

#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
xdata <- xdata[,grepl("mean\\(|std\\(|activity|subject", features[,2])]

#3. Uses descriptive activity names to name the activities in the data set
xdata <- merge(xdata, actnames, by.x="activity", by.y = "V1")
xdata$activity <- NULL
colnames(xdata)[length(colnames(xdata))] <- "activity"

#4. Appropriately labels the data set with descriptive variable names.
cn <- colnames(xdata)
cn <- gsub("\\(|\\)|\\-", "", cn)
cn <- gsub("^t", "Time", cn)
cn <- gsub("^f", "Frequency", cn)
colnames(xdata) <- cn

#5. From the data set in step 4, creates a second, 
#independent tidy data set with the average of each
#variable for each activity and each subject.

xdata_gr <- group_by(xdata, activity, subject)
xdata_gr <- summarise_each(xdata_gr, funs(mean))

