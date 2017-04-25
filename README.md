## Getting and Cleaning Data - Course Project
This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:
1. Download the data for project if it does not already exist in the working directory.
2. Load the activity and feature info. 
3. Loads both the training and test datasets with names **data_train** and **data_test**, *keeping only those columns which reflect a **mean** or **standard deviation***.
4. Loads the activity and subject data for each dataset, and merges those columns with the dataset.
5. Merges the two datasets into dataset which name is **data**.
6. Converts the activity and subject of columns **data** into factors.
7. "melt" data so that each row is a unique **subject-activity** combination and store in **melted_data**.
8. Use cast funtion to creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair. The result stored in data which name is **tidy_data**. 
9. Last step, we wrote the **tidy_data** into file name "**tidy.txt**".
