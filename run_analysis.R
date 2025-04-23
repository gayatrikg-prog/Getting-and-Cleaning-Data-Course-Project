# run_analysis.R

# Load required libraries
library(dplyr)

# Download and unzip the dataset if not already present
if(!file.exists("./UCI HAR Dataset")) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile = "./dataset.zip", method = "curl")
  unzip("dataset.zip")
}

# 1. Merge the training and test sets to create one data set

# Read training data
train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train_activities <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_features <- read.table("./UCI HAR Dataset/train/X_train.txt")

# Read test data
test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test_activities <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_features <- read.table("./UCI HAR Dataset/test/X_test.txt")

# Combine the data
subjects <- rbind(train_subjects, test_subjects)
activities <- rbind(train_activities, test_activities)
features <- rbind(train_features, test_features)

# Get feature names
feature_names <- read.table("./UCI HAR Dataset/features.txt")
names(features) <- feature_names$V2
names(subjects) <- "subject"
names(activities) <- "activity"

# Combine all columns
merged_data <- cbind(subjects, activities, features)

# 2. Extract only measurements on mean and standard deviation

# Find columns with mean() or std() in the name
mean_std_columns <- grep("mean\\(\\)|std\\(\\)", names(merged_data), value = TRUE)
selected_data <- merged_data[, c("subject", "activity", mean_std_columns)]

# 3. Use descriptive activity names

# Read activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
selected_data$activity <- factor(selected_data$activity, 
                                 levels = activity_labels$V1, 
                                 labels = activity_labels$V2)

# 4. Appropriately label the data set with descriptive variable names

# Make variable names more descriptive
names(selected_data) <- gsub("^t", "time", names(selected_data))
names(selected_data) <- gsub("^f", "frequency", names(selected_data))
names(selected_data) <- gsub("Acc", "Accelerometer", names(selected_data))
names(selected_data) <- gsub("Gyro", "Gyroscope", names(selected_data))
names(selected_data) <- gsub("Mag", "Magnitude", names(selected_data))
names(selected_data) <- gsub("BodyBody", "Body", names(selected_data))
names(selected_data) <- gsub("-mean\\(\\)", "Mean", names(selected_data))
names(selected_data) <- gsub("-std\\(\\)", "StdDev", names(selected_data))
names(selected_data) <- gsub("-", "", names(selected_data))

# 5. Create a second, independent tidy data set with averages

tidy_data <- selected_data %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean, .names = "average_{.col}"), .groups = "drop")

# Write the tidy data to a file
write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)