###########################
## File Download & Unzip ##
###########################

## Download the file
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile="./data/Dataset.zip")

## Unzip the file
  unzip(zipfile="./data/Dataset.zip",exdir="./data")

##################################################################
## 1. Merges the training and the test sets to create one data set ##
##################################################################

## Individual Data Mapping for 
##  "subject_train.txt", "Y_train.txt", "X_train.txt" 
##  "subject_test.txt", "Y_test.txt", "X_test.txt" 

## sub_merge for subject data by row
temp_path <- "./data/UCI HAR Dataset/train/subject_train.txt"
data_Subject_Train <- read.table(temp_path, header = FALSE)
temp_path <- "./data/UCI HAR Dataset/test/subject_test.txt"
data_Subject_Test <- read.table(temp_path, header = FALSE)

data_Merge_For_Subject <- rbind(data_Subject_Train, data_Subject_Test)
#str(data_Merge_For_Subject)

## sub_merge for Y data by row
temp_path <- "./data/UCI HAR Dataset/train/Y_train.txt"
data_Y_Train <- read.table(temp_path, header = FALSE)
temp_path <- "./data/UCI HAR Dataset/test/Y_test.txt"
data_Y_Test <- read.table(temp_path, header = FALSE)

data_Merge_For_Y <- rbind(data_Y_Train, data_Y_Test)
#str(data_Merge_For_Y)

## sub_merge for X data by row
temp_path <- "./data/UCI HAR Dataset/train/X_train.txt"
data_X_Train <- read.table(temp_path, header = FALSE)
temp_path <- "./data/UCI HAR Dataset/test/X_test.txt"
data_X_Test <- read.table(temp_path, header = FALSE)

data_Merge_For_X <- rbind(data_X_Train, data_X_Test)
#str(data_Merge_For_X)

## name Colums & Mergee by col

names(data_Merge_For_Subject) = "Subject_Num";
names(data_Merge_For_Y) = "Y_Num";
temp_path <- "./data/UCI HAR Dataset/features.txt"
X_ColName_List <- read.table(temp_path,head=FALSE)
names(data_Merge_For_X) = X_ColName_List$V2
#str(data_Merge_For_Subject)
#str(data_Merge_For_Y)
#str(data_Merge_For_X)

Merged_Data <- cbind(data_Merge_For_Y, data_Merge_For_Subject, data_Merge_For_X)
str(Merged_Data)

##############################################################################################
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.  ##
##############################################################################################

grep_Mean_std <- grep(".*mean.*|.*std.*", X_ColName_List$V2)
Filter_ColNames <- c(as.character(X_ColName_List$V2[grep_Mean_std]), "Subject_Num", "Y_Num")
Merged_Data <- subset(Merged_Data,select=Filter_ColNames)
str(Merged_Data)

##############################################################################################
## 3. Uses descriptive activity names to name the activities in the data set                   ##
##############################################################################################

temp_path <- "./data/UCI HAR Dataset/activity_labels.txt"
activity_Labels <- read.table(temp_path,header = FALSE)
Merged_Data$Y_Num <- factor(Merged_Data$Y_Num, levels = activity_Labels[,1], labels = activity_Labels[,2])
Merged_Data$Y_Num

##############################################################################################
## 4. Appropriately labels the data set with descriptive variable names.                       ##
##############################################################################################

names(Merged_Data) <- gsub("^(t)", "time_", names(Merged_Data))
names(Merged_Data) <- gsub("^(f)", "freq_", names(Merged_Data))

names(Merged_Data) <- gsub("Acc", "_Accelerometer", names(Merged_Data))
names(Merged_Data) <- gsub("Gyro", "_Gyroscope", names(Merged_Data))
names(Merged_Data) <- gsub("JerkMag", "_JerkMagnitude", names(Merged_Data))

names(Merged_Data) <- gsub("std", "StdDev", names(Merged_Data))
names(Merged_Data) <- gsub("BodyBody", "Body", names(Merged_Data))

str(Merged_Data)

##################################################################################################
## 5. From the data set in step 4, creates a second, independent tidy data set with the average ## 
##    of each variable for each activity and each subject.                                      ##
##################################################################################################

Tidy_data <- ddply(Merged_Data, .(Subject_Num, Y_Num), function(x) colMeans(x[, 1:79]))
temp_path <- "./data/UCI HAR Dataset/tidydata.txt"
write.table(Tidy_data, file = temp_path, row.name=FALSE)