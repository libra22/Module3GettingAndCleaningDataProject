##run_analysis.R by M Poobalan 25 July 2015.
##============================================

#download and extract files into working directory. rename the unzipped folder to "data"
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile=("UCI_HAR.zip"))
unzip("UCI_HAR.zip")
file.rename("UCI HAR Dataset","data")

# read the data files. 8 files in total. 3 for each training and test, and 2 reference files (features.txt and activity_labels.txt)
featurelist <- read.table("./data/features.txt",header = FALSE,stringsAsFactors = FALSE)
activitylabel <- read.table("./data/activity_labels.txt",header = FALSE,stringsAsFactors = FALSE)
Xtest <- read.table("./data/test/X_test.txt",header = FALSE,stringsAsFactors = FALSE)
Ytest <- read.table("./data/test/y_test.txt",header = FALSE,stringsAsFactors = FALSE)
subjecttest <- read.table("./data/test/subject_test.txt",header = FALSE,stringsAsFactors = FALSE)
Xtrain <- read.table("./data/train/X_train.txt",header = FALSE,stringsAsFactors = FALSE)
Ytrain <- read.table("./data/train/y_train.txt",header = FALSE,stringsAsFactors = FALSE)
subjecttrain <- read.table("./data/train/subject_train.txt",header = FALSE,stringsAsFactors = FALSE)

#use dplyr. install if not found.
if (!require("dplyr")) install.packages("dplyr")
library(dplyr)

#create tbldf test and train datasets (X,Y,subject)
dpxtest <- tbl_df(Xtest)
dpxtrain <- tbl_df(Xtrain)
dpytest <- tbl_df(Ytest)
dpytrain <- tbl_df(Ytrain)
dpsubjecttest <- tbl_df(subjecttest)
dpsubjecttrain <- tbl_df(subjecttrain)

#rename values in dpytest and dpytrain from number to activity names
for (i in 1:nrow(activitylabel))
{
  dpytest <- mutate(dpytest, V1 = ifelse(V1 == i, activitylabel[[2]][[i]], V1))
  dpytrain <- mutate(dpytrain, V1 = ifelse(V1 == i, activitylabel[[2]][[i]], V1))
}



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
