# gettingandcleaningdata
This is the course project for the Getting and Cleaning Data Coursera course. The script run_analysis.R does the following:

1. Download and unzip the dataset if it does not already exists

2. Loads the activity and feature from the existing files in the unzipped folder

3. Loads only mean and standard deviation columns of both training and test datasets

4. Loads the activity and subject data for each dataset, and merges those columns with the dataset

5. Merges the two datasets

6. converting subject and activity into factors

7. Creates a dataset that consists of the mean of each variable for each subject and activity pair in tidy.txt file
