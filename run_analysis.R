#data is initially seperated into trainig n test
#combine 3 files by column for each set. should have 561 columns
#then combine both sets. should have 10299 rows
# subset only the mean and std columns #grep() can use to search columns names like "mean"
# convert the activities code to actual activities names
# set the labels for variable
# create a 2nd tidy data set that is average for each activity for each subject

#tips: rename/add labels first. then extract, then merge.then finally create the 2nd tidy file

# readme is to explain how to run the code
# codebook is to describe the data

#set working directory for current use. comment it when uploading
setwd("C:/Users/BPM/Downloads/DataScience/Assignment/M03-A1")

#download and extract files
##Example:

##The R script and codebook are at /home/me/tidydata. The UCI data archive is downloaded to the same directory and its contents extracted so that the data files are in the subdirectory named UCI_HAR, for instance.

##/home/me/tidydata
##/home/me/tidydata/myscript.R
##/home/me/tidydata/mycodebook.md
##/home/me/tidydata/dataarchive.zip
##/home/me/tidydata/UCI_HAR/(multiple files herein)

##The download.file() function in your script could reference the location to store dataarchive.zip by
##> download.file("url_to_fetch_archive", "./dataarchive.zip", method = "curl") #method not needed for Microsoft Windows users

##Notice the dot followed by the forward slash? That means "in the current directory." By keeping everything relative to your working directory there will not be any location specific prefixes. if you hard-coded the fully-qualified path as "/home/me/tidydata/dataarchive.zip" then anyone else would get an error message when attempting to run your script unless they editing the script (a very bad idea for reproducible research) to point to a valid location on their computer's file system.

##As a side note if you wanted to store the dataarchive.zip file in a subdirectory named "data" your script would have to create the subdirectory, dir.create("./data"), again using a relative path from the working directory, download the file, download.file("url", "./data/dataarchive.zip", method= "curl"),  and then unzip("./data/dataarchive.zip", exdir = "./data/UCI_HAR"), and eventually to read one of the extracted data files, say datafile.csv, you would read.csv("./data/UCI_HAR/datafile.csv"). This allows anyone to run your R script unmodified on their computer and the data files end up in the same location relative to the their own current working directory, getwd().

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile=("UCI_HAR.zip"))
unzip("UCI_HAR.zip")
file.rename("UCI HAR Dataset","data")

# read the data files
featurelist <- read.table("./data/features.txt",header = FALSE,stringsAsFactors = FALSE)
activitylabel <- read.table("./data/activity_labels.txt",header = FALSE,stringsAsFactors = FALSE)
Xtest <- read.table("./data/test/X_test.txt",header = FALSE,stringsAsFactors = FALSE)
Ytest <- read.table("./data/test/y_test.txt",header = FALSE,stringsAsFactors = FALSE)
subjecttest <- read.table("./data/test/subject_test.txt",header = FALSE,stringsAsFactors = FALSE)
Xtrain <- read.table("./data/train/X_train.txt",header = FALSE,stringsAsFactors = FALSE)
Ytrain <- read.table("./data/train/y_train.txt",header = FALSE,stringsAsFactors = FALSE)
subjecttrain <- read.table("./data/train/subject_train.txt",header = FALSE,stringsAsFactors = FALSE)

#use dplyr
if (!require("dplyr")) install.packages("dplyr")
library(dplyr)

#create tbldf of Xtest
dpxtest <- tbl_df(Xtest)
dpxtrain <- tbl_df(Xtrain)

#create tbldf of Ytest
dpytest <- tbl_df(Ytest)
dpytrain <- tbl_df(Ytrain)

#rename values in ytest from number to activity names
for (i in 1:nrow(activitylabel))
{
  dpytest <- mutate(dpytest, V1 = ifelse(V1 == i, activitylabel[[2]][[i]], V1))
  dpytrain <- mutate(dpytrain, V1 = ifelse(V1 == i, activitylabel[[2]][[i]], V1))
}

#create tbldf of subject test
dpsubjecttest <- tbl_df(subjecttest)
dpsubjecttrain <- tbl_df(subjecttrain)

#combine 3 files of each set into one file (one each for test and train)
dptest <- bind_cols(dpsubjecttest,dpytest,dpxtest)
dptrain <- bind_cols(dpsubjecttrain,dpytrain,dpxtrain)

#rename column names accordingly. for features, read from feature list
colnames(dptrain)<- c("Subject","ActivityName",1:561)
colnames(dptest)<- c("Subject","ActivityName",1:561)

# combine test and train data
dp <- bind_rows(dptest,dptrain)

#rename column names accordingly. for features, read from feature list
colnames(dp)<- c("Subject","ActivityName",featurelist[[2]])

#remove unnecessary objects
remove("activitylabel","Xtest","Xtrain","Ytest","Ytrain","i","subjecttrain","subjecttest","featurelist","dpytrain","dpytest","dpxtrain","dpxtest","dptest","dptrain","dpsubjecttest","dpsubjecttrain")

# extract mean and std columns 
dpMeanStd<-dp[,c("Subject","ActivityName",grep("mean|std", colnames(dp), value = TRUE))]

# make Subject and ActivityName columns as factor so that can group later.
dpMeanStd$ActivityName <- as.factor(dpMeanStd$ActivityName)
dpMeanStd$Subject <- as.factor(dpMeanStd$Subject)

#create grouped table and then create summarised data.
dpGrp<-group_by(dpMeanStd,Subject,ActivityName)
TidyData<-summarise_each(dpGrp,funs(mean))

#Update column name of tidy data to reflect its avg of the mean or sd.
tempcolnames<-colnames(TidyData)
i <- 3
for (i in 3:length(tempcolnames))
  {
    tempcolnames[i]= paste("Avg.",tempcolnames[i],sep = "")
  }
colnames(TidyData) <- tempcolnames

#write to text file
write.table(TidyData,file="TidyData.txt",row.names = FALSE)

# -----------------------------------------------------
#reference
names(dpMeanStd)<-gsub("BodyBody", "Body", names(dpMeanStd))
names(dpMeanStd)

MeanStdColumns <- grep("mean|std", featurelist$V2, value = FALSE) 
MeanStdColumnsNames <- grep("mean|std", featurelist$V2, value = TRUE)
dpMeanStd<-dp[,c("Subject","ActivityName",MeanStdColumnsNames)]

tidydata <- aggregate(dpMeanStd,list(dpMeanStd$Subject,dpMeanStd$ActivityName),mean)
tidyData <- aggregate(. ~Subject + ActivityName, dpMeanStd, mean)


write.table(dp2,file="dp2.txt",sep=",", col.names = TRUE)
dp3 <-read.table("dp2.txt",header = TRUE,sep = ",")

distinct(dpy,V1)
dpactivity <- tbl_df(activitylabel)

xx<- mutate(dpy, V1 = ifelse(V1 == 5, "Walk", V1))
dpNamed <- data.frame()
dpNamedY <- tbl_df(dpNamed)
dpNamedY <- mutate(dpy, V1 = ifelse(V1 == 1, activitylabel[[2]][[1]], V1))
dpNamedY <- mutate(dpNamedY, V1 = ifelse(V1 == 2, activitylabel[[2]][[2]], V1))