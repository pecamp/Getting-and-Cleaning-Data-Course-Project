---
title: "CodeBook"
output: github_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Description

[Original Source Data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
**UCI Human Activity Recognition Using Smartphones Data**

As described in the original source data `README.txt`, the orignal data is formatted as follows:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

The original dataset includes the following files:
=========================================

- `README.txt`

- `features_info.txt`: Shows information about the variables used on the feature vector.

- `features.txt`: List of all features.

- `activity_labels.txt`: Links the class labels with their activity name.

- `train/X_train.txt`: Training set.

- `train/y_train.txt`: Training labels.

- `test/X_test.txt`: Test set.

- `test/y_test.txt`: Test labels.

=========================================
## Processing Steps
`run_analysis.R` performs the following five steps on the original data and returns `tidyData.txt` to your working directoy:
=========================================

1. Downloads, unzips, and merges the training and the test sets to create one data set from the [source data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Extracts only data containing Mean and Standard Deviation pairs (i.e. variables with a mean with an associated measure of spread, a standard deviation; NOTE: means not labeled as mean() or with an associated standard deviation were not extracted, intentionally)
3. Assigns descriptive activity names to name the activities in the data set, by using the `activity_labels.txt` file from the source data
4. Appropriately labels the data set with descriptive variable names
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject labeled `tidyData.txt`, which is a space-delimited text file.

## Final Data

The column names are:
`Subjects`
`Activities`
`TimeBodyAccelerometerMean-X`
`TimeBodyAccelerometerMean-Y`
`TimeBodyAccelerometerMean-Z`
`TimeBodyAccelerometerSTD-X`
`TimeBodyAccelerometerSTD-Y`
`TimeBodyAccelerometerSTD-Z`
`TimeGravityAccelerometerMean-X`
`TimeGravityAccelerometerMean-Y`
`TimeGravityAccelerometerMean-Z`
`TimeGravityAccelerometerSTD-X`
`TimeGravityAccelerometerSTD-Y`
`TimeGravityAccelerometerSTD-Z`
`TimeBodyAccelerometerJerkMean-X`
`TimeBodyAccelerometerJerkMean-Y`
`TimeBodyAccelerometerJerkMean-Z`
`TimeBodyAccelerometerJerkSTD-X`
`TimeBodyAccelerometerJerkSTD-Y`
`TimeBodyAccelerometerJerkSTD-Z`
`TimeBodyGyroscopeMean-X`
`TimeBodyGyroscopeMean-Y`
`TimeBodyGyroscopeMean-Z`
`TimeBodyGyroscopeSTD-X`
`TimeBodyGyroscopeSTD-Y`
`TimeBodyGyroscopeSTD-Z`
`TimeBodyGyroscopeJerkMean-X`
`TimeBodyGyroscopeJerkMean-Y`
`TimeBodyGyroscopeJerkMean-Z`
`TimeBodyGyroscopeJerkSTD-X`
`TimeBodyGyroscopeJerkSTD-Y`
`TimeBodyGyroscopeJerkSTD-Z`
`TimeBodyAccelerometerMagnitudeMean`
`TimeBodyAccelerometerMagnitudeSTD`
`TimeGravityAccelerometerMagnitudeMean`
`TimeGravityAccelerometerMagnitudeSTD`
`TimeBodyAccelerometerJerkMagnitudeMean`
`TimeBodyAccelerometerJerkMagnitudeSTD`
`TimeBodyGyroscopeMagnitudeMean`
`TimeBodyGyroscopeMagnitudeSTD`
`TimeBodyGyroscopeJerkMagnitudeMean`
`TimeBodyGyroscopeJerkMagnitudeSTD`
`FrequencyBodyAccelerometerMean-X`
`FrequencyBodyAccelerometerMean-Y`
`FrequencyBodyAccelerometerMean-Z`
`FrequencyBodyAccelerometerSTD-X`
`FrequencyBodyAccelerometerSTD-Y`
`FrequencyBodyAccelerometerSTD-Z`
`FrequencyBodyAccelerometerJerkMean-X`
`FrequencyBodyAccelerometerJerkMean-Y`
`FrequencyBodyAccelerometerJerkMean-Z`
`FrequencyBodyAccelerometerJerkSTD-X`
`FrequencyBodyAccelerometerJerkSTD-Y`
`FrequencyBodyAccelerometerJerkSTD-Z`
`FrequencyBodyGyroscopeMean-X`
`FrequencyBodyGyroscopeMean-Y`
`FrequencyBodyGyroscopeMean-Z`
`FrequencyBodyGyroscopeSTD-X`
`FrequencyBodyGyroscopeSTD-Y`
`FrequencyBodyGyroscopeSTD-Z`
`FrequencyBodyAccelerometerMagnitudeMean`
`FrequencyBodyAccelerometerMagnitudeSTD`
`FrequencyBodyAccelerometerJerkMagnitudeMean`
`FrequencyBodyAccelerometerJerkMagnitudeSTD`
`FrequencyBodyGyroscopeMagnitudeMean`
`FrequencyBodyGyroscopeMagnitudeSTD`
`FrequencyBodyGyroscopeJerkMagnitudeMean`
`FrequencyBodyGyroscopeJerkMagnitudeSTD`

The means and standard deviations are centered and thus are between -1 and 1. 
