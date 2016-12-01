## About the project
The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
## The data source
The data used in this project is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##The R analysis script

The script "run_analysis.R" perform 6 following steps:

1. Download and unzip the file mentioned in the previous section. The file is saved in a directory "data" which is created inside the work space of the user.  

2. Merging the training and the test data sets to create one data set. This include:
* Reading files contained inside the unzip directory
* Reading trainings tables
* Reading testing tables
* Reading feature file 
* Reading activity labels file
* Assigning column names to the tables taking into account the features file 
* Merging all data in one set

3. Extracting only the measurements on the mean and standard deviation for each measurement. This include:
* Reading column names from the merged data set
* Create vector definning ID, mean and standard deviation
* Subset the merged data
4. Using descriptive activity names to name the activities in the data set
5. Appropriately labeling the data set with descriptive variable names
6. Creating an independent tidy data set with the average of each variable for each activity and each subject
* Making a tidy data set
* Writing the tidy data set in txt file.
