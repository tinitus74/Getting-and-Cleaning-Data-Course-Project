#Create directory if not exist already
if(!file.exists("./data")){dir.create("./data")}

#download file and unzipping it

url <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filex<-file.path(getwd(),"./data/DataSet.zip")
download.file(url,filex)
unzip(filex,exdir = "./data")

#Read train files
X_Train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
Y_Train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
Subject_Train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

#Read test files 
X_Test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
Y_Test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
Subject_Test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

#Read activity labels

actLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

#Read features definitions
feat<-read.table("./data/UCI HAR Dataset/features.txt")

#Asign column names to train and test data
colnames(X_Train) <- feat[,2] 
colnames(Y_Train) <-"activityId"
colnames(Subject_Train) <- "subjectId"

colnames(X_Test) <- feat[,2] 
colnames(Y_Test) <- "activityId"
colnames(Subject_Test) <- "subjectId"

colnames(actLabels) <- c('activityId','activityType')

#Merge the data in one set
merge_train <-cbind(Y_Train, Subject_Train, X_Train)
merge_test <- cbind(Y_Test,Subject_Test,X_Test)
AllinOne <- rbind(merge_train,merge_test)

#Define ID, mean and Std vector
colN <- colnames(AllinOne)

Mean_and_Std <- (grepl("activityId" , colN) | 
                         grepl("subjectId" , colN) | 
                         grepl("mean.." , colN) | 
                         grepl("std..", colN) 
                 )


#Subset the merged data in AllinOne
setMeanStd <- AllinOne[ , Mean_and_Std == TRUE]

#Use descriptive names for the activities in the selected data set
setActNames <- merge(setMeanStd, actLabels,
                              by='activityId',
                              all.x=TRUE)
#Create a new (tidy) data set
TidySet <- aggregate(. ~subjectId + activityId, setActNames, mean)
TidySer <- TidySet[order(TidySet$subjectId, secTidySet$activityId),]

#Write the tidy data set into a file
write.table(TidySet,"./data/TidyDataSet.txt",row.name = FALSE)

