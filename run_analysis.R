# run_analysis.R
# Getting and Cleaning Data Project

# Load required library
library(dplyr)

# Step 1: Download and unzip dataset if not already available
filename <- "dataset.zip"
dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists(filename)) {
  download.file(dataset_url, filename, mode = "wb")
}
if (!file.exists("UCI HAR Dataset")) {
  unzip(filename)
}

# Step 2: Read data files
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Step 3: Merge training and test sets
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

colnames(x) <- features[, 2]
colnames(y) <- "activity"
colnames(subject) <- "subject"

data <- cbind(subject, y, x)

# Step 4: Extract mean and standard deviation measurements
selectedCols <- grep("mean\\(\\)|std\\(\\)", features[, 2])
data <- data[, c(1, 2, selectedCols + 2)]

# Step 5: Use descriptive activity names
data$activity <- factor(data$activity,
                        levels = activity_labels[, 1],
                        labels = activity_labels[, 2])

# Step 6: Label dataset with descriptive variable names
names(data) <- gsub("\\()", "", names(data))
names(data) <- gsub("^t", "time", names(data))
names(data) <- gsub("^f", "frequency", names(data))
names(data) <- gsub("Acc", "Accelerometer", names(data))
names(data) <- gsub("Gyro", "Gyroscope", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("-", "_", names(data))

# Step 7: Create tidy dataset with averages
tidyData <- data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)

# Step 8: Save tidy dataset
write.table(tidyData, "tidyData.txt", row.name = FALSE)

# Script finished
