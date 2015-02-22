## dependencies
library(data.table)
library(dplyr)
library(tidyr)

## tidy data form set to TRUE for long form, or FALSE for wide form
dataset.tidy.longform <- TRUE

## variables for files / directories
dataset.dir <- "./UCI HAR Dataset/"
dataset.activity_labels.file <- paste0(dataset.dir, "activity_labels.txt")
dataset.features.file <- paste0(dataset.dir, "features.txt")  ## 561 features

dataset.test.dir <- paste0(dataset.dir,"test/")
dataset.test.observations.file <- paste0(dataset.test.dir, "X_test.txt")
dataset.test.activity.file <- paste0(dataset.test.dir, "y_test.txt")
dataset.test.subject.file <- paste0(dataset.test.dir, "subject_test.txt")

dataset.train.dir <- paste0(dataset.dir,"train/")
dataset.train.observations.file <- paste0(dataset.train.dir, "X_train.txt")
dataset.train.activity.file <- paste0(dataset.train.dir, "y_train.txt")
dataset.train.subject.file <- paste0(dataset.train.dir, "subject_train.txt")

## read data files
dataset.activity_labels <- fread(
  dataset.activity_labels.file, sep=" ", header=FALSE,
  colClasses=c("factor", "factor")
)
setnames(dataset.activity_labels, c("index", "Activity"))

## convert activity name to CamelCase for "tidy" data
tidyActivity <- function(x){ #function for camel case
  x<-tolower(x)
  capit <- function(x) paste0(toupper(substring(x, 1, 1)), substring(x, 2, nchar(x)))
  sapply(strsplit(x, "_"), function(x) paste(capit(x), collapse=""))
}
dataset.activity_labels[,Activity:=tidyActivity(Activity)]

dataset.features <- fread(
  dataset.features.file, sep=" ", header=FALSE,
  colClasses=c("numeric", "character")
)
setnames(dataset.features, c("index", "Feature"))

# Extracts only the measurements on the mean and standard deviation for each
# measurement.
selectcols <- grepl("mean\\(\\)|std\\(\\)", dataset.features[,Feature])

## convert TRUE / FALSE to col width (16, -16)
dataset.test.observations <- read.fwf(
  dataset.test.observations.file,
  width=16*(selectcols*2-1)
)

dataset.test.activity <- fread(
  dataset.test.activity.file, colClasses=c("numeric")
)
setnames(dataset.test.activity, c("Activity"))

dataset.test.subject <- fread(
  dataset.test.subject.file, colClasses=c("numeric")
)
setnames(dataset.test.subject, c("Subject"))

## convert TRUE / FALSE to col width (16, -16)
dataset.train.observations <- read.fwf(
  dataset.train.observations.file,
  width=16*(selectcols*2-1)
)

dataset.train.activity <- fread(
  dataset.train.activity.file, colClasses=c("numeric")
)
setnames(dataset.train.activity, c("Activity"))

dataset.train.subject <- fread(
  dataset.train.subject.file, colClasses=c("numeric")
)
setnames(dataset.train.subject, c("Subject"))

# Extracts only the measurements on the mean and standard deviation for each
# measurement.
dataset.features <- dataset.features[grep("mean\\(\\)|std\\(\\)",Feature)]

# "tidy" the dataset.features
featureTidy <- function(x) {
  x<-gsub("^t", "Time", x)
  x<-gsub("^f", "Freq", x)
  x<-gsub("BodyBody", "Body", x)
  capit <- function(x) paste0(toupper(substring(x, 1, 1)), substring(x, 2, nchar(x)))
  sapply(strsplit(x, "-|[\\(\\)]"), function(x) paste(capit(x), collapse=""))
}
dataset.features[,Feature:=featureTidy(Feature)]

# Appropriately labels the data set with descriptive variable names
setnames(dataset.test.observations, dataset.features[,Feature])
setnames(dataset.train.observations, dataset.features[,Feature])

# Uses descriptive activity names to name the activities in the data set
dataset.test.activity <- transmute (
  dataset.test.activity,
  Activity = factor(
    dataset.test.activity[,Activity],
    levels=dataset.activity_labels[,index],
    labels=dataset.activity_labels[,Activity]
  )
)

# Uses descriptive activity names to name the activities in the data set
dataset.train.activity <- transmute (
  dataset.train.activity,
  Activity = factor(
    dataset.train.activity[,Activity],
    levels=dataset.activity_labels[,index],
    labels=dataset.activity_labels[,Activity]
  )
)

# Merges the training and the test sets to create one data set.
dataset.all <- bind_rows(
  bind_cols(
    list(
      dataset.test.subject, dataset.test.activity, dataset.test.observations
    )
  ),
  bind_cols(
    list(
      dataset.train.subject, dataset.train.activity, dataset.train.observations
    )
  )
)

# From the data set in step 4, creates a second, independent tidy data set with
# the average of each variable for each activity and each subject
if (dataset.tidy.longform) {
  dataset.tidy.all <- (
    dataset.all %>% group_by(Activity, Subject) %>% summarise_each(funs(mean))
      # gathers the data into Long form:
      %>% gather(Measurement, Average, -(Activity:Subject))
  )
} else {
  dataset.tidy.all <- (
    dataset.all %>% group_by(Activity, Subject) %>% summarise_each(funs(mean))
  )
}

# writes the tidy dataset to output file
write.table(dataset.tidy.all, file="tidy_dataset.txt", row.name=FALSE)
