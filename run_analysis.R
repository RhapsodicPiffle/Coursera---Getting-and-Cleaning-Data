library(reshape2)

## Download and import the data
filename <- "getdata_dataset.zip"

if (!file.exists(filename)){
  URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(URL, filename, method="curl")
}

if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities[,2] <- as.character(activities[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Extracts only the measurements on the mean and standard deviation for each measurement.
data <- grep(".*mean.*|.*std.*", features[,2]) # Find only the features with mean or std in the names
data.names <- features[data,2]
data.names = gsub('-mean', 'Mean', data.names) # Change '-mean' to 'Mean'
data.names = gsub('-std', 'Std', data.names) # Change '-std' to 'Std'
data.names <- gsub('[-()]', '', data.names) # Remove the symbols [-()]

# Merges the training and the test sets to create one data set.
train <- read.table("UCI HAR Dataset/train/X_train.txt")[data]
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train) # Combine subjects, activities, and training data
test <- read.table("UCI HAR Dataset/test/X_test.txt")[data]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, test) # Combine subjects, activities, and testing data
allData <- rbind(train, test) # merge the training and testing data

# Appropriately labels the data set with descriptive variable names. 
colnames(allData) <- c("subject", "activity", data.names)

# Use descriptive activity names to name the activities in the data set
allData$activity <- factor(allData$activity, levels = activities[,1], labels = activities[,2])

# From the data set in step 4, creates a second, independent tidy data set with 
#  the average of each variable for each activity and each subject.
allData$subject <- as.factor(allData$subject)
allData.melted <- melt(allData, id = c("subject", "activity")) # unpivot data to make it easier to calculate the mean
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean) # calculate the mean and pivot data by subject by activity

write.table(allData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)