## Getting and Cleaning Data - Course Project
This is the course project for the Getting and Cleaning Data Coursera course. 
Before run R scirpt below, you need to download data from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip data into your working directory. A full description is available at the site where the data was obtained [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The R script, run_analysis.R, does the following:
1. Load data:
- Load training dataset store in table names **data_train**
  * read table from "UCI HAR Dataset/train/X_train.txt",  
  * read table from "UCI HAR Dataset/train/Y_train.txt"
  * read table from "UCI HAR Dataset/train/subject_train.txt"
  * Combine three by Columns and store in **data_train**
- Load test dataset store in table names **data_test**
  * read table from "UCI HAR Dataset/test/X_test.txt",  
  * read table from "UCI HAR Dataset/test/Y_test.txt"
  * read table from "UCI HAR Dataset/test/subject_test.txt"
  * Combine three by Columns and store in **data_test**
- Combine **data_train** and **data_test** by rows into one data set called **data**
2. Load activity labels and features:
- Load the activity from "UCI HAR Dataset/activity_labels.txt" store in **activityLabels**.
- Load features from "UCI HAR Dataset/features.txt" store in **features**. 
3. Filter out the data
- Filter the Labels, we just need features which  measurements on the mean and standard deviation then store in **features_filtered**
- make a subset data of data with features in **features_filtered**
2. Loads both the training and test datasets with names **data_train** and **data_test**, *keeping only those columns which reflect a **mean** or **standard deviation***.
4. Loads the activity and subject data for each dataset, and merges those columns with the dataset.
5. Merges the two datasets into dataset which name is **data**.
6. Converts the activity and subject of columns **data** into factors.
7. "melt" data so that each row is a unique **subject-activity** combination and store in **melted_data**.
8. Use cast funtion to creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair. The result stored in data which name is **tidy_data**. 
9. Last step, we wrote the **tidy_data** into file name "**tidy.txt**".
