---
title: "CodeBook"
author: "Michael Brown"
date: "5/10/2021"
output: html_document
---
# Getting and Cleaning Data Course Project
The purpose of this project was to complete the following tasks:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
## VARIABLES
The following variables are used in the final data set:
[1] "subject"                      "activity"                     "tBodyAccMeanX"                "tBodyAccMeanY"               
 [5] "tBodyAccMeanZ"                "tBodyAccStdX"                 "tBodyAccStdY"                 "tBodyAccStdZ"                
 [9] "tGravityAccMeanX"             "tGravityAccMeanY"             "tGravityAccMeanZ"             "tGravityAccStdX"             
[13] "tGravityAccStdY"              "tGravityAccStdZ"              "tBodyAccJerkMeanX"            "tBodyAccJerkMeanY"           
[17] "tBodyAccJerkMeanZ"            "tBodyAccJerkStdX"             "tBodyAccJerkStdY"             "tBodyAccJerkStdZ"            
[21] "tBodyGyroMeanX"               "tBodyGyroMeanY"               "tBodyGyroMeanZ"               "tBodyGyroStdX"               
[25] "tBodyGyroStdY"                "tBodyGyroStdZ"                "tBodyGyroJerkMeanX"           "tBodyGyroJerkMeanY"          
[29] "tBodyGyroJerkMeanZ"           "tBodyGyroJerkStdX"            "tBodyGyroJerkStdY"            "tBodyGyroJerkStdZ"           
[33] "tBodyAccMagMean"              "tBodyAccMagStd"               "tGravityAccMagMean"           "tGravityAccMagStd"           
[37] "tBodyAccJerkMagMean"          "tBodyAccJerkMagStd"           "tBodyGyroMagMean"             "tBodyGyroMagStd"             
[41] "tBodyGyroJerkMagMean"         "tBodyGyroJerkMagStd"          "fBodyAccMeanX"                "fBodyAccMeanY"               
[45] "fBodyAccMeanZ"                "fBodyAccStdX"                 "fBodyAccStdY"                 "fBodyAccStdZ"                
[49] "fBodyAccMeanFreqX"            "fBodyAccMeanFreqY"            "fBodyAccMeanFreqZ"            "fBodyAccJerkMeanX"           
[53] "fBodyAccJerkMeanY"            "fBodyAccJerkMeanZ"            "fBodyAccJerkStdX"             "fBodyAccJerkStdY"            
[57] "fBodyAccJerkStdZ"             "fBodyAccJerkMeanFreqX"        "fBodyAccJerkMeanFreqY"        "fBodyAccJerkMeanFreqZ"       
[61] "fBodyGyroMeanX"               "fBodyGyroMeanY"               "fBodyGyroMeanZ"               "fBodyGyroStdX"               
[65] "fBodyGyroStdY"                "fBodyGyroStdZ"                "fBodyGyroMeanFreqX"           "fBodyGyroMeanFreqY"          
[69] "fBodyGyroMeanFreqZ"           "fBodyAccMagMean"              "fBodyAccMagStd"               "fBodyAccMagMeanFreq"         
[73] "fBodyBodyAccJerkMagMean"      "fBodyBodyAccJerkMagStd"       "fBodyBodyAccJerkMagMeanFreq"  "fBodyBodyGyroMagMean"        
[77] "fBodyBodyGyroMagStd"          "fBodyBodyGyroMagMeanFreq"     "fBodyBodyGyroJerkMagMean"     "fBodyBodyGyroJerkMagStd"     
[81] "fBodyBodyGyroJerkMagMeanFreq"

The activities include the following:
* `WALKING` (value `1`): subject was walking during the test
* `WALKING_UPSTAIRS` (value `2`): subject was walking up a staircase during the test
* `WALKING_DOWNSTAIRS` (value `3`): subject was walking down a staircase during the test
* `SITTING` (value `4`): subject was sitting during the test
* `STANDING` (value `5`): subject was standing during the test
* `LAYING` (value `6`): subject was laying down during the test

## DATA
The data comes from accelerometer and gyroscopic sensor signals from wearable devices

## TRANSFORMATIONS

Filter to only mean and std variables
Reshape to long data and calculate averages
Reshape into wide data with only average data by subject by activity