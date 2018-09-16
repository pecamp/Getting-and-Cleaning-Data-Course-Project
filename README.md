---
title: "README.md"
output: github_document
---

## Contents of the Repository

This repo represents the course project for the Getting and Cleaning Data online course in the Coursera Data Science Specialization.

The repo contains four items:
1. run_analysis.R
2. tidyData.txt
3. README.md
4. CodeBook.md

## Description
`run_analysis.R` is a 5-step script that collects wearable computing data from [UCI's Human Activity Recognition of Smartphone Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and returns a tidy dataset of the subject and activity averages labeled `tidyData.txt` to your working directory. `run_analysis.R` processes are as follows:

1. Downloads, unzips, and merges the training and the test sets to create one data set from the [source data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Extracts only data containing Mean and Standard Deviation pairs (i.e. variables with a mean with an associated measure of spread, a standard deviation; NOTE: means not labeled as mean() or with an associated standard deviation were not extracted, intentionally)
3. Assigns descriptive activity names to name the activities in the data set, by using the `activity_labels.txt` file from the source data
4. Appropriately labels the data set with descriptive variable names
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject labeled `tidyData.txt`, which is a space-delimited text file.

`CodeBook.md` describes the variables, the data, and any transformations performed in `run_analysis.R`

