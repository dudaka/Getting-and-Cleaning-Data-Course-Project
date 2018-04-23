library(dplyr)

# Load data files
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)$V2
features <- as.factor(make.unique(as.character(features)))

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

x_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_test <- as.factor(read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)$V1)

x_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
subject_train <- as.factor(read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)$V1)

# 4. Appropriately labels the data set with descriptive variable names.
names(x_test) <- features
names(x_train) <- features

# 3. Uses descriptive activity names to name the activities in the data set
activity_test <- merge(y_test, activity_labels, by.x = "V1", by.y = "V1", sort = FALSE)$V2
x_test$activity <- activity_test

activity_train <- merge(y_train, activity_labels, by.x = "V1", by.y = "V1", sort = FALSE)$V2
x_train$activity <- activity_train

# Add subjects to data
x_test$subject <- subject_test
x_train$subject <- subject_train

# 1. Merges the training and the test sets to create one data set.

df_test <- x_test
df_train <- x_train
df <- rbind(df_test, df_train)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
df_measurement <- df[, grepl("mean()", names(df)) | grepl("std()", names(df))]

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and subject
df_tidy <- group_by(df, activity, subject) %>% summarise_if(is.numeric, mean)

# Write df_tidy to file
write.csv(df_tidy, file = "df_tidy.csv", row.names = FALSE)
