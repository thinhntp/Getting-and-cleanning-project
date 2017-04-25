library(reshape)

## Download and unzip the dataset:
filename <- "getdata_dataset.zip"
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# Load activity labels + features
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Extract only the data on mean and standard deviation

featuresNeed <- grep(".*mean.*|.*std.*", features[,2])
featuresNeed_names <- features[featuresNeed,2]
featuresNeed_names = gsub('-mean', 'Mean', featuresNeed_names)
featuresNeed_names = gsub('-std', 'Std', featuresNeed_names)
featuresNeed_names <- gsub('[-()]', '', featuresNeed_names)


# Load the datasets
data_train <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresNeed]
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
data_train <- cbind(trainSubjects, trainActivities, data_train)

data_test <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresNeed]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
data_test <- cbind(testSubjects, testActivities, data_test)

# Merge datasets and add labels
data <- rbind(data_train, data_test)
colnames(data) <- c("subject", "activity", featuresNeed_names)

# Turn activities & subjects into factors
data$activity <- factor(data$activity, levels = activityLabels[,1], labels = activityLabels[,2])
data$subject <- as.factor(data$subject)

# Melt data stored in melted_data
melted_data <- melt(data, id = c("subject", "activity"))

# Compute average of each variable for each activity and each subject.
tidy_data <- cast(melted_data, subject + activity ~ variable, mean)

write.table(tidy_data, "tidy.txt", row.names = FALSE, quote = FALSE)