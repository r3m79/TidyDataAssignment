##############################################################
#This script will perform the followin actions:
#
#   1. load files data in the following way
#   2. join data from test and train measures
#   3. create dataset with only mean and std variables
#   4. rename column names
#   5. identify activity by description
#   6. create tidy data set with average values for each 
#       subject and activity
#
##############################################################

#load features data
features<-read.delim("./features.txt",header = FALSE,sep ="")

#load activity labels data
actlabels<-read.delim("./activity_labels.txt",header = FALSE,sep ="")

#store number of columns which match the amount of variables for test data
testsize<-dim(read.delim("./test/subject_test.txt",header = FALSE,sep =""))[1]

#load measures data
datatest.measures<-as.data.frame(list(seq(1:testsize),read.delim("./test/X_test.txt",header = FALSE,sep ="",col.names=features[,2])),col.names = "id")

#load subject data
datatest.subj<-as.data.frame(list(seq(1:testsize),read.delim("./test/subject_test.txt",header = FALSE,sep ="",col.names = "subject")),col.names = "id")
#create column to identify test data
datatest.subj$measure.type<-"test"

#load activities data
datatest.act<-as.data.frame(list(seq(1:testsize),read.delim("./test/y_test.txt",header = FALSE,sep ="",col.names = "activity")),col.names = "id")

#merge all test information
datatest<-merge(merge(datatest.subj,datatest.act),datatest.measures)

#store number of columns which match the amount of variables for train data
trainsize<-dim(read.delim("./train/subject_train.txt",header = FALSE,sep =""))[1]

#load measures data
datatrain.measures<-as.data.frame(list(seq(1:trainsize),read.delim("./train/X_train.txt",header = FALSE,sep ="",col.names=features[,2])),col.names = "id")

#load subject data
datatrain.subj<-as.data.frame(list(seq(trainsize),read.delim("./train/subject_train.txt",header = FALSE,sep ="",col.names = "subject")),col.names = "id")
#create column to identify train data
datatrain.subj$measure.type<-"train"

#load activities data
datatrain.act<-as.data.frame(list(seq(1:trainsize),read.delim("./train/y_train.txt",header = FALSE,sep ="",col.names = "activity")),col.names = "id")

#merge all test information
datatrain<-merge(merge(datatrain.subj,datatrain.act),datatrain.measures)

#create dataset with test and train data
dataset<-union(datatrain,datatest)

#extract only information of mean and std for each measurement
dataset<-dataset[,(grep("(subject)+|(activity)+|(mean)+|(std)+",names(dataset)))]

#rename variable to descriptive values
dataset<-rename(dataset,body.accel.tm.mean.X = NA.tBodyAcc.mean...X, body.accel.tm.mean.Y = NA.tBodyAcc.mean...Y, body.accel.tm.std.X = NA.tBodyAcc.std...X, 
                body.accel.tm.std.Z = NA.tBodyAcc.std...Z, grav.accel.tm.mean.Y = NA.tGravityAcc.mean...Y, grav.accel.tm.std.X = NA.tGravityAcc.std...X, 
                grav.accel.tm.std.Z = NA.tGravityAcc.std...Z, body.accel.jerk.tm.mean.Y = NA.tBodyAccJerk.mean...Y, body.accel.jerk.tm.std.X = NA.tBodyAccJerk.std...X, 
                body.accel.jerk.tm.std.Z = NA.tBodyAccJerk.std...Z, body.gyro.tm.mean.Y = NA.tBodyGyro.mean...Y, body.gyro.tm.std.X = NA.tBodyGyro.std...X, 
                body.gyro.tm.std.Z = NA.tBodyGyro.std...Z, body.gyro.jerk.tm.mean.Y = NA.tBodyGyroJerk.mean...Y, body.gyro.jerk.tm.std.X = NA.tBodyGyroJerk.std...X, 
                body.gyro.jerk.tm.std.Z = NA.tBodyGyroJerk.std...Z, body.accel.mag.tm.std = NA.tBodyAccMag.std.., grav.accel.mag.tm.std = NA.tGravityAccMag.std.., 
                body.accel.jerk.mag.tm.std = NA.tBodyAccJerkMag.std.., body.gyro.mag.tm.std = NA.tBodyGyroMag.std.., body.gyro.jerk.mag.tm.std = NA.tBodyGyroJerkMag.std.., 
                body.accel.fr.mean.Y = NA.fBodyAcc.mean...Y, body.accel.fr.std.X = NA.fBodyAcc.std...X, body.accel.fr.std.Z = NA.fBodyAcc.std...Z, 
                body.accel.fr.meanFreq.Y = NA.fBodyAcc.meanFreq...Y, body.accel.jerk.fr.mean.X = NA.fBodyAccJerk.mean...X, body.accel.jerk.fr.mean.Z = NA.fBodyAccJerk.mean...Z, 
                body.accel.jerk.fr.std.Y = NA.fBodyAccJerk.std...Y, body.accel.jerk.fr.meanFreq.X = NA.fBodyAccJerk.meanFreq...X, body.accel.jerk.fr.meanFreq.Z = NA.fBodyAccJerk.meanFreq...Z, 
                body.gyro.fr.mean.Y = NA.fBodyGyro.mean...Y, body.gyro.fr.std.X = NA.fBodyGyro.std...X, body.gyro.fr.std.Z = NA.fBodyGyro.std...Z, 
                body.gyro.fr.meanFreq.Y = NA.fBodyGyro.meanFreq...Y, body.accel.mag.fr.mean = NA.fBodyAccMag.mean.., body.accel.mag.fr.meanFreq = NA.fBodyAccMag.meanFreq.., 
                body.body.accel.jerk.mag.fr.std = NA.fBodyBodyAccJerkMag.std.., body.body.gyro.mag.fr.mean = NA.fBodyBodyGyroMag.mean.., body.body.gyro.mag.fr.meanFreq = NA.fBodyBodyGyroMag.meanFreq.., 
                body.body.gyro.jerk.mag.fr.std = NA.fBodyBodyGyroJerkMag.std.., body.accel.tm.mean.Z = NA.tBodyAcc.mean...Z, body.accel.tm.std.Y = NA.tBodyAcc.std...Y, 
                grav.accel.tm.mean.X = NA.tGravityAcc.mean...X, grav.accel.tm.mean.Z = NA.tGravityAcc.mean...Z, grav.accel.tm.std.Y = NA.tGravityAcc.std...Y, 
                body.accel.jerk.tm.mean.X = NA.tBodyAccJerk.mean...X, body.accel.jerk.tm.mean.Z = NA.tBodyAccJerk.mean...Z, body.accel.jerk.tm.std.Y = NA.tBodyAccJerk.std...Y, 
                body.gyro.tm.mean.X = NA.tBodyGyro.mean...X, body.gyro.tm.mean.Z = NA.tBodyGyro.mean...Z, body.gyro.tm.std.Y = NA.tBodyGyro.std...Y, body.gyro.jerk.tm.mean.X = NA.tBodyGyroJerk.mean...X, 
                body.gyro.jerk.tm.mean.Z = NA.tBodyGyroJerk.mean...Z, body.gyro.jerk.tm.std.Y = NA.tBodyGyroJerk.std...Y, body.accel.mag.tm.mean = NA.tBodyAccMag.mean.., 
                grav.accel.mag.tm.mean = NA.tGravityAccMag.mean.., body.accel.jerk.mag.tm.mean = NA.tBodyAccJerkMag.mean.., body.gyro.mag.tm.mean = NA.tBodyGyroMag.mean.., 
                body.gyro.jerk.mag.tm.mean = NA.tBodyGyroJerkMag.mean.., body.accel.fr.mean.X = NA.fBodyAcc.mean...X, body.accel.fr.mean.Z = NA.fBodyAcc.mean...Z, 
                body.accel.fr.std.Y = NA.fBodyAcc.std...Y, body.accel.fr.meanFreq.X = NA.fBodyAcc.meanFreq...X, body.accel.fr.meanFreq.Z = NA.fBodyAcc.meanFreq...Z, 
                body.accel.jerk.fr.mean.Y = NA.fBodyAccJerk.mean...Y, body.accel.jerk.fr.std.X = NA.fBodyAccJerk.std...X, body.accel.jerk.fr.std.Z = NA.fBodyAccJerk.std...Z, 
                body.accel.jerk.fr.meanFreq.Y = NA.fBodyAccJerk.meanFreq...Y, body.gyro.fr.mean.X = NA.fBodyGyro.mean...X, body.gyro.fr.mean.Z = NA.fBodyGyro.mean...Z, 
                body.gyro.fr.std.Y = NA.fBodyGyro.std...Y, body.gyro.fr.meanFreq.X = NA.fBodyGyro.meanFreq...X, body.gyro.fr.meanFreq.Z = NA.fBodyGyro.meanFreq...Z, 
                body.accel.mag.fr.std = NA.fBodyAccMag.std.., body.body.accel.jerk.mag.fr.mean = NA.fBodyBodyAccJerkMag.mean.., body.body.accel.jerk.mag.fr.meanFreq = NA.fBodyBodyAccJerkMag.meanFreq.., 
                body.body.gyro.mag.fr.std = NA.fBodyBodyGyroMag.std.., body.body.gyro.jerk.mag.fr.mean = NA.fBodyBodyGyroJerkMag.mean.., 
                body.body.gyro.jerk.mag.fr.meanFreq = NA.fBodyBodyGyroJerkMag.meanFreq..)

#replace activity ID for corresponding activity description
dataset<-mutate(dataset,activity=actlabels[as.integer(as.character(dataset$activity)),2])

#group data by subject and activity and create tidy set with average for each
dataset<-group_by(dataset,subject,activity)
tidydataset<-summarize(dataset,avg.body.accel.tm.mean.X=mean(body.accel.tm.mean.X),avg.body.accel.tm.mean.Y=mean(body.accel.tm.mean.Y),avg.body.accel.tm.std.X=mean(body.accel.tm.std.X),avg.body.accel.tm.std.Z=mean(body.accel.tm.std.Z),
                       avg.grav.accel.tm.mean.Y=mean(grav.accel.tm.mean.Y),avg.grav.accel.tm.std.X=mean(grav.accel.tm.std.X),avg.grav.accel.tm.std.Z=mean(grav.accel.tm.std.Z),avg.body.accel.jerk.tm.mean.Y=mean(body.accel.jerk.tm.mean.Y),
                       avg.body.accel.jerk.tm.std.X=mean(body.accel.jerk.tm.std.X),avg.body.accel.jerk.tm.std.Z=mean(body.accel.jerk.tm.std.Z),avg.body.gyro.tm.mean.Y=mean(body.gyro.tm.mean.Y),avg.body.gyro.tm.std.X=mean(body.gyro.tm.std.X),
                       avg.body.gyro.tm.std.Z=mean(body.gyro.tm.std.Z),avg.body.gyro.jerk.tm.mean.Y=mean(body.gyro.jerk.tm.mean.Y),avg.body.gyro.jerk.tm.std.X=mean(body.gyro.jerk.tm.std.X),avg.body.gyro.jerk.tm.std.Z=mean(body.gyro.jerk.tm.std.Z),
                       avg.body.accel.mag.tm.std=mean(body.accel.mag.tm.std),avg.grav.accel.mag.tm.std=mean(grav.accel.mag.tm.std),avg.body.accel.jerk.mag.tm.std=mean(body.accel.jerk.mag.tm.std),avg.body.gyro.mag.tm.std=mean(body.gyro.mag.tm.std),
                       avg.body.gyro.jerk.mag.tm.std=mean(body.gyro.jerk.mag.tm.std),avg.body.accel.fr.mean.Y=mean(body.accel.fr.mean.Y),avg.body.accel.fr.std.X=mean(body.accel.fr.std.X),avg.body.accel.fr.std.Z=mean(body.accel.fr.std.Z),
                       avg.body.accel.fr.meanFreq.Y=mean(body.accel.fr.meanFreq.Y),avg.body.accel.jerk.fr.mean.X=mean(body.accel.jerk.fr.mean.X),avg.body.accel.jerk.fr.mean.Z=mean(body.accel.jerk.fr.mean.Z),avg.body.accel.jerk.fr.std.Y=mean(body.accel.jerk.fr.std.Y),
                       avg.body.accel.jerk.fr.meanFreq.X=mean(body.accel.jerk.fr.meanFreq.X),avg.body.accel.jerk.fr.meanFreq.Z=mean(body.accel.jerk.fr.meanFreq.Z),avg.body.gyro.fr.mean.Y=mean(body.gyro.fr.mean.Y),avg.body.gyro.fr.std.X=mean(body.gyro.fr.std.X),
                       avg.body.gyro.fr.std.Z=mean(body.gyro.fr.std.Z),avg.body.gyro.fr.meanFreq.Y=mean(body.gyro.fr.meanFreq.Y),avg.body.accel.mag.fr.mean=mean(body.accel.mag.fr.mean),avg.body.accel.mag.fr.meanFreq=mean(body.accel.mag.fr.meanFreq),
                       avg.body.body.accel.jerk.mag.fr.std=mean(body.body.accel.jerk.mag.fr.std),avg.body.body.gyro.mag.fr.mean=mean(body.body.gyro.mag.fr.mean),avg.body.body.gyro.mag.fr.meanFreq=mean(body.body.gyro.mag.fr.meanFreq),
                       avg.body.body.gyro.jerk.mag.fr.std=mean(body.body.gyro.jerk.mag.fr.std),avg.body.accel.tm.mean.Z=mean(body.accel.tm.mean.Z),avg.body.accel.tm.std.Y=mean(body.accel.tm.std.Y),avg.grav.accel.tm.mean.X=mean(grav.accel.tm.mean.X),
                       avg.grav.accel.tm.mean.Z=mean(grav.accel.tm.mean.Z),avg.grav.accel.tm.std.Y=mean(grav.accel.tm.std.Y),avg.body.accel.jerk.tm.mean.X=mean(body.accel.jerk.tm.mean.X),avg.body.accel.jerk.tm.mean.Z=mean(body.accel.jerk.tm.mean.Z),
                       avg.body.accel.jerk.tm.std.Y=mean(body.accel.jerk.tm.std.Y),avg.body.gyro.tm.mean.X=mean(body.gyro.tm.mean.X),avg.body.gyro.tm.mean.Z=mean(body.gyro.tm.mean.Z),avg.body.gyro.tm.std.Y=mean(body.gyro.tm.std.Y),
                       avg.body.gyro.jerk.tm.mean.X=mean(body.gyro.jerk.tm.mean.X),avg.body.gyro.jerk.tm.mean.Z=mean(body.gyro.jerk.tm.mean.Z),avg.body.gyro.jerk.tm.std.Y=mean(body.gyro.jerk.tm.std.Y),avg.body.accel.mag.tm.mean=mean(body.accel.mag.tm.mean),
                       avg.grav.accel.mag.tm.mean=mean(grav.accel.mag.tm.mean),avg.body.accel.jerk.mag.tm.mean=mean(body.accel.jerk.mag.tm.mean),avg.body.gyro.mag.tm.mean=mean(body.gyro.mag.tm.mean),avg.body.gyro.jerk.mag.tm.mean=mean(body.gyro.jerk.mag.tm.mean),
                       avg.body.accel.fr.mean.X=mean(body.accel.fr.mean.X),avg.body.accel.fr.mean.Z=mean(body.accel.fr.mean.Z),avg.body.accel.fr.std.Y=mean(body.accel.fr.std.Y),avg.body.accel.fr.meanFreq.X=mean(body.accel.fr.meanFreq.X),
                       avg.body.accel.fr.meanFreq.Z=mean(body.accel.fr.meanFreq.Z),avg.body.accel.jerk.fr.mean.Y=mean(body.accel.jerk.fr.mean.Y),avg.body.accel.jerk.fr.std.X=mean(body.accel.jerk.fr.std.X),avg.body.accel.jerk.fr.std.Z=mean(body.accel.jerk.fr.std.Z),
                       avg.body.accel.jerk.fr.meanFreq.Y=mean(body.accel.jerk.fr.meanFreq.Y),avg.body.gyro.fr.mean.X=mean(body.gyro.fr.mean.X),avg.body.gyro.fr.mean.Z=mean(body.gyro.fr.mean.Z),avg.body.gyro.fr.std.Y=mean(body.gyro.fr.std.Y),
                       avg.body.gyro.fr.meanFreq.X=mean(body.gyro.fr.meanFreq.X),avg.body.gyro.fr.meanFreq.Z=mean(body.gyro.fr.meanFreq.Z),avg.body.accel.mag.fr.std=mean(body.accel.mag.fr.std),avg.body.body.accel.jerk.mag.fr.mean=mean(body.body.accel.jerk.mag.fr.mean),
                       avg.body.body.accel.jerk.mag.fr.meanFreq=mean(body.body.accel.jerk.mag.fr.meanFreq),avg.body.body.gyro.mag.fr.std=mean(body.body.gyro.mag.fr.std),avg.body.body.gyro.jerk.mag.fr.mean=mean(body.body.gyro.jerk.mag.fr.mean),avg.body.body.gyro.jerk.mag.fr.meanFreq=mean(body.body.gyro.jerk.mag.fr.meanFreq))

##write tidydataset to a CSV file
#write.csv(tidydataset,file="./tidydataset.csv")

##write tidydataset to a flat file
write.table(tidydataset,"./tidydataset.txt",row.name = FALSE)