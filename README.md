# Getting-and-Cleaning-Data-Course-Project

## How does the run_analysis.R file work ?

### Load data files as data frames/lists

- UCI HAR Dataset/features.txt : contains all variables names
- UCI HAR Dataset/activity_labels.txt : contains all activity types
- UCI HAR Dataset/test/X_test.txt : test set with the column names defined in UCI HAR Dataset/features.txt
- UCI HAR Dataset/test/y_test.txt : contains activity records for UCI HAR Dataset/test/X_test.txt
- UCI HAR Dataset/test/subject_test.txt : contains all identifiers who attended the tests on UCI HAR Dataset/test/X_test.txt
- UCI HAR Dataset/train/X_train.txt : train set with the column names defined in UCI HAR Dataset/features.txt
- UCI HAR Dataset/train/y_train.txt : contains activity records for UCI HAR Dataset/train/X_train.txt
- UCI HAR Dataset/train/subject_train.txt : contains all identifiers who attended the tests on UCI HAR Dataset/train/X_train.txt

### Appropriately labels the data set with descriptive variable names.

- Add column names (in UCI HAR Dataset/features.txt) to both data frames (UCI HAR Dataset/test/X_test.txt and UCI HAR Dataset/train/X_train.txt)

### Uses descriptive activity names to name the activities in the data set

- Add the activities (UCI HAR Dataset/test/y_test.txt and UCI HAR Dataset/train/y_train.txt) to the corresponding data framesa

- Then match with their names defined in UCI HAR Dataset/activity_labels.txt

### Add subjects to data frames

- Same above procedure, we add subjects (in UCI HAR Dataset/test/subject_test.txt and UCI HAR Dataset/train/subject_train.txt) to the corresponding data frames.

### Merges the training and the test sets to create one data set.

### Extracts only the measurements on the mean and standard deviation for each measurement.

- Make a data frame which contains only columns having "mean()" or "std()" strings

### From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and subject

- We already had a data frame combining test set and train set

- Group the data frame by activity and subject

- Then summary it by mean of each column

- We get a tidy data

### Write the tidy data to file
