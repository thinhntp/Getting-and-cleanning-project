library(reshape)

# Load data before compute
# Load the training data
data_train <- read.table("UCI HAR Dataset/train/X_train.txt")
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
data_train <- cbind(trainSubjects, trainActivities, data_train)

# Load the test data
data_test <- read.table("UCI HAR Dataset/test/X_test.txt")
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
data_test <- cbind(testSubjects, testActivities, data_test)

# Combine data_train and data_test by rows into one data called data
data <- rbind(data_train, data_test)

# Load activityLabels
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
# Load features
features <- read.table("UCI HAR Dataset/features.txt")
#Load trainning data and test data

# filter out the features
features_filterd <- grep(".*mean.*|.*std.*", features[,2])

# filter out the data
# noticed that the indexs of feature_filter were pushed back to the right 2 
# colume after we add activity and subject into data
data<-cbind(data[,c(1,2)],data[,features_filterd+2])

# Add colume name to data
features_name<-as.character(features[features_filterd,2])
features_name<-c("subject", "activity",features_name)
colnames(data)<-features_name

# Melt data stored in melted_data
melted_data <- melt(data, id = c("subject", "activity"))

# Compute average of each variable for each activity and each subject.
tidy_data <- cast(melted_data, subject + activity ~ variable, mean)

write.table(tidy_data, "tidy.txt", row.names = FALSE, quote = FALSE)