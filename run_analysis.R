#Download dataset
destfile<-"C:\\Users\\Hema\\Downloads\\CleaningData\\week4\\getdata_projectfiles_UCI HAR Dataset.zip"
destdir<-"C:\\Users\\Hema\\Downloads\\CleaningData\\week4\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset"

if(!file.exists(destfile))
{
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","C:\\Users\\Hema\\Downloads\\CleaningData\\week4\\getdata_projectfiles_UCI HAR Dataset.zip",method = "auto")

}

if(!file.exists("C:\\Users\\Hema\\Downloads\\CleaningData\\week4\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset"))
{
  unzip(destfile)
}

#Load datasets
train<-read.table(paste0(destdir,"\\train\\x_train.txt"))
trainActivities<-read.table(paste0(destdir,"\\train\\y_train.txt"))

train<-read.table(paste0(destdir,"\\train\\x_train.txt"))
trainSubject<-read.table(paste0(destdir,"\\train\\subject_train.txt"))

test<-read.table(paste0(destdir,"\\test\\x_test.txt"))
testActivities<-read.table(paste0(destdir,"\\test\\y_test.txt"))
testSubject<-read.table(paste0(destdir,"\\test\\subject_test.txt"))


#load activity labels
activityLabels<-read.table(paste0(destdir,"\\activity_labels.txt"))
activityLabels[,2]<-as.character(activityLabels[,2])

features<-read.table(paste0(destdir,"\\features.txt"))
str(features)
features[,2]<-as.character(features[,2])

#Extract mean and std data only



featureswanted<-grep(".mean.|.std.",features[,2])
featureswanted.names<-features[featureswanted,2]
featureswanted.names<-gsub("-mean","Mean", featureswanted.names)
featureswanted.names<-gsub("-std","Std", featureswanted.names)
featureswanted.names<-gsub("[-()]","", featureswanted.names)

#keep only required columns
train<-train[,featureswanted]
test<-test[,featureswanted]

#Merge data sets
traintest<-rbind(train,test)
traintestActivities<-rbind(trainActivities,testActivities)
traintestSubject<-rbind(trainSubject,testSubject)

names(traintest)<-featureswanted.names

#Set appropriate names to the variables in dataset

names(traintestActivities)<-"activity"
names(traintestSubject)<-"subject"

#Merge all data
all<-cbind(traintest,traintestActivities,traintestSubject)

#Set descriptive activity names to activity

all[,"activity"]<-activityLabels[all[,"activity"],2]

#create independent tidy dataset with the average of each variable for each activity and each subject.

library(reshape2)
all.melted<-melt(all,id=c("subject","activity"))
all.mean<-dcast(all.melted,subject+activity~variable,mean)
write.table(all.mean,paste0(destdir,"\\tidy.txt"))