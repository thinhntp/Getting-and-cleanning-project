#This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:
- Download the data for project if it does not already exist in the working directory.
- Load the activity and feature info. 
- Loads both the training and test datasets with names **data_train** and **data_test**, *keeping only those columns which reflect a **mean** or **standard deviation***.
- Loads the activity and subject data for each dataset, and merges those columns with the dataset.
- Merges the two datasets into dataset which name is **data**.
- Converts the activity and subject of columns **data** into factors.
- "melt" data so that each row is a unique **subject-activity** combination and store in **melted_data**.
- Use cast funtion to creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair. The result stored in data which name is **tidy_data**. 
- Last step, we write the **tidy_data** into file name "**tidy.txt**".
