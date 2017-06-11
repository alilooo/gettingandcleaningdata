The following has been done to achieve the tidied dataset:

Process names of the variables
Names of the variables are read from the file "features.txt"
Names are sanitized to replace the characters "(" ,")" and "-" (Refer to R reference documentation on make.names for definition on valid names)
Names are converted to lowercase
Process test Dataset
Read list of subject id from "subject_test.txt"
Read list of activity id from "y_test.txt"
Read list of data from "X_test.txt" and replace with headers from #1
Concatenate subject id, activity id and data together
Extract only the mean and standard deviation measurements for each subject id and activity id.
NOTE: Referring to "features_info.txt", only the following variables are considered as mean and standard deviation measurements
mean()
std()
Process train Dataset
Repeat the same steps for test Dataset on the train Dataset and corresponding files.
Processed datasets from #2 and #3 are combined.
The required data is then extracted
Read in activity names from "activity_labels.txt"
Merge activity names with the combined dataset from #4
"Activity ID" variable is then removed
Tidied data is derived from #5 by performing the following
Required data is aggregated and grouped by subject id and activity name. The aggreate function is the average i.e. arithmetic mean
duplicate subject id and activity name variables resulting from the aggregation is removed
activity names in the oberservations are converted to lowercase
data variable names are appened with "average_"
Tidied data is saved to TXT and CSV files
