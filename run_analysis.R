##download & unzip folder
fileURL <- ("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
download.file(fileURL, "UCI_HAR_Dataset.zip")
if(!file.exists("UCI HAR Dataset")){
    unzip("UCI_HAR_Dataset.zip")
}

##read activity_labels.txt & features.txt
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

##subset names for measurments mean and standard deviation from features
featuresNames <- as.character(features[,2][grep("mean\\(\\)|std\\(\\)", features[,2])])

##read test dataset
test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test_set <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_labels <- read.table("./UCI HAR Dataset/test/Y_test.txt")

##read train dataset
train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train_set <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_labels <- read.table("./UCI HAR Dataset/train/Y_train.txt")

##bind by row similar data together to create dataset for (subjects, activity, and measurments)
SubjectData <- rbind(train_subjects, test_subjects)
ActivityData <- rbind(train_labels, test_labels)
MeasurmentsData <- rbind(train_set, test_set)

##name variables before binding them. Then bind them by columns
names(MeasurmentsData) <- features$V2
names(SubjectData) <- "Subjects"
names(ActivityData) <- "Activity"
bind1 <- cbind(SubjectData, ActivityData)
full_data <- cbind(bind1, MeasurmentsData)

##use featuresNames to subset the data needed from full_data
ColumnNames <- c("Subjects", "Activity", featuresNames)
data <- subset(full_data, select = ColumnNames)

##replace numbers in Activity column in data with a suited activity from activity_labels
data[,2] <- activity_labels[data[,2], 2]

##label the dataset with descriptive variable name
names(data) <- gsub("^t", "time", names(data))
names(data) <- gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("^f", "frequency", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))

##create a tidy data with the avarage of each variable
library(plyr)
TidyData <- aggregate(. ~Subjects + Activity, data, mean)
TidyData <- TidyData[order(TidyData$Subjects, TidyData$Activity),]

##save data
write.table(TidyData, file = "tidydata.txt", row.names = FALSE)
