print("Loading utils library.")
library(utils)
print("Extracting ZIP file.")
if (!file.exists("getdata-projectfiles-UCI HAR Dataset.zip")) {
    print("File getdata-projectfiles-UCI HAR Dataset.zip is not in the working directory")
    print("Exiting now ...")
    stop()
}
unzip("getdata-projectfiles-UCI HAR Dataset.zip")
print("reading mapping data into data frames")

#read feature list from file
#and extract necessary ones (mean and standard devation values)
featureTable<-read.table("UCI HAR Dataset/features.txt")
selectedFeatures<-subset(featureTable, grepl("-(mean|std)\\(\\)-(X|Y|Z)", V2))

#read activity mapping from file
activityTable<-read.table("UCI HAR Dataset/activity_labels.txt")
names(activityTable)<-c("activityid","activityname")

# read training data set
print("reading training dataset")
trainingDS<-read.table("UCI HAR Dataset/train/X_train.txt")
trainingDS<-trainingDS[,selectedFeatures$V1]
names(trainingDS)<-selectedFeatures$V2
trainingSubjects<-read.table("UCI HAR Dataset//train//subject_train.txt")
names(trainingSubjects)<-c("subjectnumber")
trainingActivity<-read.table("UCI HAR Dataset//train//y_train.txt")
names(trainingActivity)<-c("activityid")
trainingDS<-cbind(trainingSubjects, trainingDS )
trainingDS<-cbind(trainingActivity, trainingDS)


# read test data set
print("reading test dataset")
testDS<-read.table("UCI HAR Dataset//test//X_test.txt")
testDS<-testDS[,selectedFeatures$V1]
names(testDS)<-selectedFeatures$V2
testSubjects<-read.table("UCI HAR Dataset//test//subject_test.txt")
names(testSubjects)<-c("subjectnumber")
testActivity<-read.table("UCI HAR Dataset//test//y_test.txt")
names(testActivity)<-c("activityid")
testDS<-cbind(testSubjects, testDS )
testDS<-cbind(testActivity, testDS )

# Merge datasets into single one
print("Merging two datasets")
fullDS<-rbind(trainingDS, testDS)
print("Decoding activity names")
fullDS<-merge(fullDS, activityTable, 
              by.x=c("activityid"), by.y=c("activityid"))

fullDS$activityid<-NULL

# Changing the measure names
print("Renaming the columns")
names(fullDS)<-sub("tBody","TimeBody",names(fullDS),)
names(fullDS)<-sub("fBody","FrequencyBody",names(fullDS),)
names(fullDS)<-sub("tGravity","TimeGravity",names(fullDS),)
names(fullDS)<-sub("Acc","Accelerometer",names(fullDS),)
names(fullDS)<-sub("Gyro","Gyroscope", names(fullDS),)
names(fullDS)<-tolower(names(fullDS))


# Converting to data.table and calculating means
print("Calculating means for Subject/Activity Group")
library(data.table)
dt<-data.table(fullDS)
simpleSet<-dt[, lapply(.SD,mean), by=list(subjectnumber, activityname)]

# Save resulting data frame to file
print("Saving tidy dataset to file 'output.txt'")
write.table(simpleSet[order(simpleSet$subject),], file="output.txt", 
            sep=",", row.names=F, quote=F)
print("Done!")
