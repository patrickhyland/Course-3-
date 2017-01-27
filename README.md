##Script Analysis
###The following steps were taken to create a completed script and tidy dataset:

* Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Save folder into your local repo
* Read the x and y training and testing txt files into R with the fread function.
* This ascertains that data will be kept in a data table format.
* Read the subject train and test and features txt files with fread.
* Rename the column names of both x_train and x_test with the elements of features
* Rename the features and subject tables with appropriate headers
* Column bind the subject and activity tables to its respective x table so that data is cleaner before joining.
* Rename the first column of xtrain and xtest to activity
* Row bind xtrain and xtest which merges the training and the test sets to create one data set.
* Use grep to find only the columns that have mean or standard deviation of variables
* Put these row numbers into a vector
* Extract those rows from the dataset by matching the elements of the vector with the column numbers
* Read in the activity labels txt filter
* Join the labels table and new data set on Activity ID, this names the activities
* To clean the columns, remove extraneous parentheses and dashes
* To create a new tidy dataset with means of variables by activity by subject, use the aggregate function
* Rename the columns to label them Activity and Subject ID
* Write the table to a txt file.
