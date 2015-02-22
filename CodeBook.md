# Study Design
- The project takes the raw data files from [UCU HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and extracts the relevant measurements.
- The entries that are included are measurements for the mean and standard deviation.  The assumption was made to include all entries that include mean() and std() at the end.
- Descriptive activity names were taken from the *activity_labels.txt* raw data file.  To "tidy" the data, the activity name was changed to camel case.
- Subjects are [1-30] as per the raw data files.
- Descriptive feature names were taken from the *features.txt* raw data file. To tidy the data, the characters '-', and '()' were stripped, the names converted to camel case.  Errors in the naming (BodyBody) were corrected. (see *features_info.txt* for more information).
- Averages (the mean) for each measurement (feature) were calculated, for each activity and subject.
- The tidy data output includes the average of each measurement, for each subject and activity.
- The project R script (run_analysis.R) performs the following to clean up the data:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.  (The assumption being, these contained mean() and std() in the feature name).
3. Uses descriptive activity names to name the activities in the dataset - camel case was used.
4. Appropriately labels the data set with descriptive variable names
- The measurement names were changed to camel case, with some characters () and - cleaned up to make the data tidy.
5. Additionally, it was decided to use the long form for output, as opposed to wide form.  [If so desired, the user may alter the dataset.tidy.longform variable in the run_analysis.R file, to change to wide format, however this CodeBook.md only describes the long form]

# CodeBook
## Variables
### Activity
A description of the activity performed.

##### Datatype
 * character

##### Values
 * Walking
 * WalkingUpstairs
 * WalkingDownstairs
 * Sitting
 * Standing
 * Laying

### Subject
A numeric value in the range from 1 to 30, representing the subject who performed the activity for each sample measurement.

##### Datatype
 * Numeric

##### Values
 * 1:30

### Measurement:
Measurements taken - only entries that included the Mean and Standard deviation were included.  Selection was based on mean() and std() in the raw data.  66 Measurements were included for analysis. In order to make the data "tidy" - the names were converted to camel case, and the characters '-', and '()' were removed.  The "t", which corresponded to "Time", and "f" which corresponded to "Freq" (frequency) were renamed to be more descriptive. Errors of "BodyBody" were also corrected in the naming.

##### Datatype
 * character

##### Values
* "TimeBodyAccMeanX" - corresponds to the raw measurement "tBodyAcc-mean()-X"
* "TimeBodyAccMeanY" - corresponds to the raw measurement "tBodyAcc-mean()-Y"
* "TimeBodyAccMeanZ" - corresponds to the raw measurement "tBodyAcc-mean()-Z"
* "TimeBodyAccStdX" - corresponds to the raw measurement "tBodyAcc-std()-X"
* "TimeBodyAccStdY" - corresponds to the raw measurement "tBodyAcc-std()-Y"
* "TimeBodyAccStdZ" - corresponds to the raw measurement "tBodyAcc-std()-Z"
* "TimeGravityAccMeanX" - corresponds to the raw measurement "tGravityAcc-mean()-X"
* "TimeGravityAccMeanY" - corresponds to the raw measurement "tGravityAcc-mean()-Y"
* "TimeGravityAccMeanZ" - corresponds to the raw measurement "tGravityAcc-mean()-Z"
* "TimeGravityAccStdX" - corresponds to the raw measurement "tGravityAcc-std()-X"
* "TimeGravityAccStdY" - corresponds to the raw measurement "tGravityAcc-std()-Y"
* "TimeGravityAccStdZ" - corresponds to the raw measurement "tGravityAcc-std()-Z"
* "TimeBodyAccJerkMeanX" - corresponds to the raw measurement "tBodyAccJerk-mean()-X"
* "TimeBodyAccJerkMeanY" - corresponds to the raw measurement "tBodyAccJerk-mean()-Y"
* "TimeBodyAccJerkMeanZ" - corresponds to the raw measurement "tBodyAccJerk-mean()-Z"
* "TimeBodyAccJerkStdX" - corresponds to the raw measurement "tBodyAccJerk-std()-X"
* "TimeBodyAccJerkStdY" - corresponds to the raw measurement "tBodyAccJerk-std()-Y"
* "TimeBodyAccJerkStdZ" - corresponds to the raw measurement "tBodyAccJerk-std()-Z"
* "TimeBodyGyroMeanX" - corresponds to the raw measurement "tBodyGyro-mean()-X"
* "TimeBodyGyroMeanY" - corresponds to the raw measurement "tBodyGyro-mean()-Y"
* "TimeBodyGyroMeanZ" - corresponds to the raw measurement "tBodyGyro-mean()-Z"
* "TimeBodyGyroStdX" - corresponds to the raw measurement "tBodyGyro-std()-X"
* "TimeBodyGyroStdY" - corresponds to the raw measurement "tBodyGyro-std()-Y"
* "TimeBodyGyroStdZ" - corresponds to the raw measurement "tBodyGyro-std()-Z"
* "TimeBodyGyroJerkMeanX" - corresponds to the raw measurement "tBodyGyroJerk-mean()-X"
* "TimeBodyGyroJerkMeanY" - corresponds to the raw measurement "tBodyGyroJerk-mean()-Y"
* "TimeBodyGyroJerkMeanZ" - corresponds to the raw measurement "tBodyGyroJerk-mean()-Z"
* "TimeBodyGyroJerkStdX" - corresponds to the raw measurement "tBodyGyroJerk-std()-X"
* "TimeBodyGyroJerkStdY" - corresponds to the raw measurement "tBodyGyroJerk-std()-Y"
* "TimeBodyGyroJerkStdZ" - corresponds to the raw measurement "tBodyGyroJerk-std()-Z"
* "TimeBodyAccMagMean" - corresponds to the raw measurement "tBodyAccMag-mean()"
* "TimeBodyAccMagStd" - corresponds to the raw measurement "tBodyAccMag-std()"
* "TimeGravityAccMagMean" - corresponds to the raw measurement "tGravityAccMag-mean()"
* "TimeGravityAccMagStd" - corresponds to the raw measurement "tGravityAccMag-std()"
* "TimeBodyAccJerkMagMean" - corresponds to the raw measurement "tBodyAccJerkMag-mean()"
* "TimeBodyAccJerkMagStd" - corresponds to the raw measurement "tBodyAccJerkMag-std()"
* "TimeBodyGyroMagMean" - corresponds to the raw measurement "tBodyGyroMag-mean()"
* "TimeBodyGyroMagStd" - corresponds to the raw measurement "tBodyGyroMag-std()"
* "TimeBodyGyroJerkMagMean" - corresponds to the raw measurement "tBodyGyroJerkMag-mean()"
* "TimeBodyGyroJerkMagStd" - corresponds to the raw measurement "tBodyGyroJerkMag-std()"
* "FreqBodyAccMeanX" - corresponds to the raw measurement "fBodyAcc-mean()-X"
* "FreqBodyAccMeanY" - corresponds to the raw measurement "fBodyAcc-mean()-Y"
* "FreqBodyAccMeanZ" - corresponds to the raw measurement "fBodyAcc-mean()-Z"
* "FreqBodyAccStdX" - corresponds to the raw measurement "fBodyAcc-std()-X"
* "FreqBodyAccStdY" - corresponds to the raw measurement "fBodyAcc-std()-Y"
* "FreqBodyAccStdZ" - corresponds to the raw measurement "fBodyAcc-std()-Z"
* "FreqBodyAccJerkMeanX" - corresponds to the raw measurement "fBodyAccJerk-mean()-X"
* "FreqBodyAccJerkMeanY" - corresponds to the raw measurement "fBodyAccJerk-mean()-Y"
* "FreqBodyAccJerkMeanZ" - corresponds to the raw measurement "fBodyAccJerk-mean()-Z"
* "FreqBodyAccJerkStdX" - corresponds to the raw measurement "fBodyAccJerk-std()-X"
* "FreqBodyAccJerkStdY" - corresponds to the raw measurement "fBodyAccJerk-std()-Y"
* "FreqBodyAccJerkStdZ" - corresponds to the raw measurement "fBodyAccJerk-std()-Z"
* "FreqBodyGyroMeanX" - corresponds to the raw measurement "fBodyGyro-mean()-X"
* "FreqBodyGyroMeanY" - corresponds to the raw measurement "fBodyGyro-mean()-Y"
* "FreqBodyGyroMeanZ" - corresponds to the raw measurement "fBodyGyro-mean()-Z"
* "FreqBodyGyroStdX" - corresponds to the raw measurement "fBodyGyro-std()-X"
* "FreqBodyGyroStdY" - corresponds to the raw measurement "fBodyGyro-std()-Y"
* "FreqBodyGyroStdZ" - corresponds to the raw measurement "fBodyGyro-std()-Z"
* "FreqBodyAccMagMean" - corresponds to the raw measurement "fBodyAccMag-mean()"
* "FreqBodyAccMagStd" - corresponds to the raw measurement "fBodyAccMag-std()"
* "FreqBodyAccJerkMagMean" - corresponds to the raw measurement "fBodyBodyAccJerkMag-mean()"
* "FreqBodyAccJerkMagStd" - corresponds to the raw measurement "fBodyBodyAccJerkMag-std()"
* "FreqBodyGyroMagMean" - corresponds to the raw measurement "fBodyBodyGyroMag-mean()"
* "FreqBodyGyroMagStd" - corresponds to the raw measurement "fBodyBodyGyroMag-std()"
* "FreqBodyGyroJerkMagMean" - corresponds to the raw measurement "fBodyBodyGyroJerkMag-mean()"
* "FreqBodyGyroJerkMagStd" - corresponds to the raw measurement "fBodyBodyGyroJerkMag-std()"
 
### Average
The average value for each measurement, for each activity and each subject

##### Datatype
* Numeric (floating point)

##### Values
* in the range [-1, 1]
