# Getting and Cleaning Data - Assignment ----------------------------------


# 1 - Merges the training and the test sets to create one data set.


  x_train <- read.table("data/train/X_train.txt")
  x_test <- read.table("data/test/X_test.txt")
  x <- rbind(x_train, x_test)
  
  y_train <- read.table("data/train/y_train.txt")
  y_test <- read.table("data/test/y_test.txt")
  y <- rbind(y_train, y_test)
  
  subject_train <- read.table("data/train/subject_train.txt")
  subject_test <- read.table("data/test/subject_test.txt")
  subject <- rbind(subject_train, subject_test)
  
  # clean up
  rm(x_train)
  rm(x_test)
  rm(y_train)
  rm(y_test)
  rm(subject_train)
  rm(subject_test)

  
# 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
  

  features <- read.table("data/features.txt")
  featureSubSet <- grep('mean\\(\\)|std\\(\\)', features$V2)
  xMeansurementExtract <- x[, featureSubSet]
  names(xMeansurementExtract) <- features[features$V1 %in% featureSubSet, 2]
  xMeansurementExtract 

  # clean up
  rm(featureSubSet)
  rm(features)


# 3 - Uses descriptive activity names to name the activities in the data set
  
  
  activityLabels <- read.table('data/activity_labels.txt', header=FALSE, col.names=c('id', 'name'))


# 4 - Appropriately labels the data set with descriptive variable names. 


  y[, 1] = activityLabels[y[, 1], 2] 


# 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    

  cleanData <- cbind(subject, y, xMeansurementExtract)
  names(cleanData)[1] <- c("subject")
  names(cleanData)[2] <- c("activity")

  measurements <- cleanData[, 3:dim(cleanData)[2]]
  cleanDataAggregation <- aggregate(measurements, list(cleanData$subject, cleanData$activity), mean)
  names(cleanDataAggregation)[1] <- c("subject")
  names(cleanDataAggregation)[2] <- c("activity")

  write.table(cleanDataAggregation, "cleanDataAggregation.txt", row.name=FALSE)
