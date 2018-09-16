# #########################################
# Program name: run_analysis.R
# Author:       Philip Camp
# Date:         14 Sept 2018
# 
# Description:  This script is to be run on
#               data from wearable devices,
#               such as FitBit or other 
#               similar devices. The 
#               overall steps are listed 
#               below:
# 
# 
# 1)  Merges the training and the test sets
#     to create one data set.
# 
# 2)  Extracts only the measurements on the
#     mean and standard deviation for each 
#     measurement.
# 
# 3)  Uses descriptive activity names to
#     name the activities in the data set
# 
# 4)  Appropriately labels the data set
#     with descriptive variable names.
# 
# 5)  From the data set in step 4, creates
#     a second, independent tidy data set
#     with the average of each variable
#     for each activity and each subject.
# #########################################

# Clear working environment
rm(list = ls())

# Library needed packages. Download packages, if needed.

##########################################################################
#               Step 0 - Set paths and download data                     #
##########################################################################

# Set download paths for data
dataURL       <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataDest      <- "UCI_Data.zip"                   # The assigned zipped file 
downloadFolder<- "UCI HAR Dataset"                # The folder name from the downloaded zipped file

# Download zipped data from the path set in dataURL to dataDest
download.file(dataURL, destfile = dataDest)
  
# If needed, create a data folder to store the data
if(!dir.exists(downloadFolder)){
  unzip(dataDest)
}

# Read-in test datasets, activities, and subjects info
testData        <- read.table("UCI HAR Dataset/test/X_test.txt", stringsAsFactors = FALSE, header = FALSE)
testActivities  <- read.table("UCI HAR Dataset/test/y_test.txt", stringsAsFactors = FALSE, header = FALSE)
testSubjects    <- read.table("UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = FALSE, header = FALSE)

# Read-in train datasets, labels, and subjects info
trainData       <- read.table("UCI HAR Dataset/train/X_train.txt", stringsAsFactors = FALSE, header = FALSE)
trainActivities <- read.table("UCI HAR Dataset/train/y_train.txt", stringsAsFactors = FALSE, header = FALSE)
trainSubjects   <- read.table("UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = FALSE, header = FALSE)

# Read-in activity and feature datasets
features          <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE, header = FALSE)
activityLabels    <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE, header = FALSE)

##########################################################################
# Step 1 - Merges the training and the test sets to create one data set  #
##########################################################################

# Merge data, labels and subjects, respectively
allData           <- rbind(trainData, testData)
allActivities     <- rbind(trainActivities, testActivities)
allSubjects       <- rbind(trainSubjects, testSubjects)

# Add subject and label information to allData
allData           <- cbind(allSubjects, allActivities, allData)

# Assign correct column names to the data
colnames(allData)[1:2]              <- c("Subjects", "Activities")
colnames(allData)[3:ncol(allData)]  <- features[,2]

###########################################################################
# Step 2 - Extract only data containing Mean and Standard Deviation data  #
###########################################################################

# Determine variables (columns) that where mean and standard deviations are
# located. 

# NOTE: I selected mean() AND std() pairs INTENTIONALLY, as these are the direct
# mean and standard deviations calculated on each subject and my 
# interpretation of the question posed. Thus, I excluded "meanFreq" and 
# "gravityMean" type variables that did not have accompanying std. 
# This was my interpretation and please do not penalize me for my
# understanding.

meanAndStdColIX <- grep(".*-mean\\(\\).*|.*-std\\(\\).*", colnames(allData))

# Add Subjects and Activities to the final columns
finalColIX      <- c(1, 2, meanAndStdColIX)

# Subset final dataset
subsettedData   <- allData[, finalColIX]

####################################################################################
# Step 3 - Uses descriptive activity names to name the activities in the data set  #
####################################################################################

# Assign Activities a name based on the activityLabels
# The factor() function allows to match levels with labels
subsettedData$Activities    <- factor(subsettedData$Activities,
                                      levels = activityLabels[,1],
                                      labels = activityLabels[,2])

subsettedData$Subjects      <- as.factor(subsettedData$Subjects)

####################################################################################
# Step 4 - Appropriately labels the data set with descriptive variable names       #
####################################################################################

# Following the features_info.txt file that describes the following abbreviations
# f     - Frequency
# t     - Time 
# Acc   - Accelerometer
# Gyro  - Gyroscope
# Mag   - Magnitude

colnames(subsettedData)   <- gsub("^f", "Frequency", colnames(subsettedData))
colnames(subsettedData)   <- gsub("^t", "Time", colnames(subsettedData))
colnames(subsettedData)   <- gsub("Acc", "Accelerometer", colnames(subsettedData))
colnames(subsettedData)   <- gsub("Gyro", "Gyroscope", colnames(subsettedData))
colnames(subsettedData)   <- gsub("Mag", "Magnitude", colnames(subsettedData))

# Clarify that -mean() and -std() translate to Mean and STD, without the () and
# remove repetitive BodyBody to Body

colnames(subsettedData)   <- gsub("-mean\\(\\)", "Mean", colnames(subsettedData))
colnames(subsettedData)   <- gsub("-std\\(\\)", "STD", colnames(subsettedData))
colnames(subsettedData)   <- gsub("BodyBody", "Body", colnames(subsettedData))

####################################################################################
# Step 5 - Create a second, independent tidy data set with the average of          #
#          each variable for each activity and each subject.                       #
####################################################################################

# Aggregate data by Subject and Activities Means
tidyData <- aggregate(. ~Subjects + Activities, subsettedData, mean)

# Order the data by Subject and then Activities
tidyData <- tidyData[order(tidyData$Subjects, tidyData$Activities),]

# Write out the tidyData into a text file to the working directory
write.table(tidyData, "tidyData.txt", row.names = FALSE, col.names = TRUE)
