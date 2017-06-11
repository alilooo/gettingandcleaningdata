# download and unzip the file if it does not already exist
fileName <- "dataset.zip"
if (!file.exists(fileName)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
        download.file(fileURL, fileName)
}  
if (!file.exists("UCI HAR Dataset")) { 
        unzip(fileName) 
}

# Loading activities and features from the unzipped folder

activities <- read.table("UCI HAR Dataset/activity_labels.txt")
activities[,2] <- as.character(activities[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Extract only mean and standard deviation columns
meanandsd <- grep(".*mean.*|.*std.*", features[,2])
meanandsd.names <- features[meanandsd,2]
meanandsd.names = gsub('-mean', 'mean', meanandsd.names)
meanandsd.names = gsub('-std', 'standarddeviation', meanandsd.names)
meanandsd.names <- gsub('[-()]', '', meanandsd.names)


# Load the datasets
trainset <- read.table("UCI HAR Dataset/train/X_train.txt")[meanandsd]
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainset <- cbind(trainSubjects, trainActivities, trainset)

testset <- read.table("UCI HAR Dataset/test/X_test.txt")[meanandsd]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
testset <- cbind(testSubjects, testActivities, testset)

# merge train and test datasets
mergedData <- rbind(trainset, testset)
colnames(mergedData) <- c("subject", "activity", meanandsd.names)

# turn activities & subjects into factors
mergedData$activity <- factor(mergedData$activity, levels = activities[,1], labels = activities[,2])
mergedData$subject <- as.factor(mergedData$subject)

mergedData.melted <- melt(mergedData, id = c("subject", "activity"))
mergedData.mean <- dcast(mergedData.melted, subject + activity ~ variable, mean)

#create tidy.txt dataset
write.table(mergedData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
