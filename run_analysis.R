library("downloader")

##Download file and put in folder
##if(!file.exists("./data")){dir.create("./data")}
##fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
##filedest <-"./data/Dataset.zip"
##download.file(fileUrl,filedest="./data/Dataset.zip",method="curl")

#Unzip files
##zipfile<- "./data/Dataset.zip"
##existingdir <-"./data"
##unzip(zipfile, existingdir)

#Get list of files in Folder "UCI HAR Dataset"
data_path <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(data_path, recursive=TRUE)

#README.txt gives info about files
#values of the features variables are in x_train.txt and x_test.txt
#values of subject variables in subject_train.txt and subject_test.txt
#values of activity are in y_train.txt and y_test.txt

#Read data into variables and merge by group
#Activity files
activityTest  <- read.table(file.path(data_path, "test" , "Y_test.txt" ),header = FALSE)
activityTrain <- read.table(file.path(data_path, "train", "Y_train.txt"),header = FALSE)
activityData<- rbind(activityTrain, activityTest)
#name
names(activityData)<- "activity"

#Subject files
subjectTrain <- read.table(file.path(data_path, "train", "subject_train.txt"),header = FALSE)
subjectTest  <- read.table(file.path(data_path, "test" , "subject_test.txt"),header = FALSE)
subjectData <- rbind(subjectTrain, subjectTest)
#name
names(subjectData)<- "subject"

#Features files
featuresTest  <- read.table(file.path(data_path, "test" , "X_test.txt" ),header = FALSE)
featuresTrain <- read.table(file.path(data_path, "train", "X_train.txt"),header = FALSE)
featuresData<- rbind(featuresTrain, featuresTest)
#read in feature names from file
featuresNames <- read.table(file.path(data_path, "features.txt"),head=FALSE)
names(featuresData) <- featuresNames$V2

#Merge datasets together as columns
subjectAndActivity<- cbind(subjectData, activityData)
data <- cbind(featuresData, subjectAndActivity)

##Find names of features by mean and standard deviation - all features names containg either "mean" or "std"
subdata<-featuresNames$V2[grep("mean\\(\\)|std\\(\\)", featuresNames$V2)]
selectedNames<-c(as.character(subdata), "subject", "activity" )
##subset by selectedNames
data<-subset(data,select=selectedNames)

#Use descriptive activity names
#read descriptive avtivity names in
activityLabels <- read.table(file.path(data_path, "activity_labels.txt"),header = FALSE)
colnames(activityLabels) <- c("id", "activity")
filterData <- merge(data, activityLabels, by = "activity", all.x= TRUE)

#Appropriately label data set
names(filterData)<-gsub("^t", "time", names(filterData))
names(filterData)<-gsub("^f", "frequency", names(filterData))
names(filterData)<-gsub("Acc", "Accelerometer", names(filterData))
names(filterData)<-gsub("Gyro", "Gyroscope", names(filterData))
names(filterData)<-gsub("Mag", "Magnitude", names(filterData))
names(filterData)<-gsub("BodyBody", "Body", names(filterData))


##Create tidy data set with averages
library(plyr);
groupingElements <- list(activity = filterData$activity, subject = filterData$subject)


# Create data set with mean of each variable for each activity and subject
# Exclude first two columns from aggregate input to prevent R from trying
# to average the activity and subject columns
tidyData = aggregate(filterData[3:columnCount], by = groupingElements, mean)

# Create text file of tidy data set
write.table(tidyData, "tidyData.txt", row.name = FALSE)







