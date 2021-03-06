# Getting And Cleaning Data - codebook

## Background
Course assignment of the coursera course [Getting and Cleaning Data](www.coursera.org/course/getdata 'Getting and Cleaning Data'). 

## Data
The data set 'Human Activity Recognition Using Smartphones Data Set' originates from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 'UCI Machine Learning Repository') and can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 'here')

The data was generated by a group of 30 volunteers, aged 19-48, performaing 6 different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). Each person performed six activities  wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

## Objective
Clean and aggregate the data for analysis.

## Execution
The script **run_analysis.R** contains 5 sections/ analysis steps to achieve the objective. Section 1 reads and merges the training and the test sets to create one data set for each (**x**, **y**, **subject**). Section 2 extracts only the measurements on the mean and standard deviation for each measurement resulting in the data frame **xMeansurementExtract**. Section 3 reads the activity labels (**activityLabels**) to descriptively rename the activities in the data set. Section 4 uses **activityLabels** to rename **y**. Section 5 executes final aggregations and re-names columns appropriately to eventually obtain the final tidy data set **cleanDataAggregation** for the export.
