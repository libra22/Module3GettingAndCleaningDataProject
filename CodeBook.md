#Codebook for Course Project - Human Activity Recognition Using Smartphones Data Set

##Raw Data
The raw data for this project is available at  https://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip
The website for the dataset is https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The script file will download, extract and store the raw data files in a "data" folder of your working directory. All subsequent processing is dependent on the raw data being stored in the "data" folder of the current working directory.

##Tidy Data
the accompanying run_analysis.R file processes the training and test dataset downloaded as above and returns a tidy data that consist of 180 observations and 81 variables.

##Variables
the data file consist of the following 81 variables:

l. Subject - Values between 1 and 30, representing 30 people who did the activities
l. ActivityName - 6 types of activties: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING
l. Avg.tBodyAcc-mean()-X - average of mean of body accelaration time for X axis
l. Avg.tBodyAcc-mean()-Y
l. Avg.tBodyAcc-mean()-Z
l. Avg.tBodyAcc-std()-X
l. Avg.tBodyAcc-std()-Y
l. Avg.tBodyAcc-std()-Z
l. Avg.tGravityAcc-mean()-X
l. Avg.tGravityAcc-mean()-Y
l. Avg.tGravityAcc-mean()-Z
l. Avg.tGravityAcc-std()-X
l. Avg.tGravityAcc-std()-Y
l. Avg.tGravityAcc-std()-Z
l. Avg.tBodyAccJerk-mean()-X
l. Avg.tBodyAccJerk-mean()-Y
l. Avg.tBodyAccJerk-mean()-Z
l. Avg.tBodyAccJerk-std()-X
l. Avg.tBodyAccJerk-std()-Y
l. Avg.tBodyAccJerk-std()-Z
l. Avg.tBodyGyro-mean()-X
l. Avg.tBodyGyro-mean()-Y
l. Avg.tBodyGyro-mean()-Z
l. Avg.tBodyGyro-std()-X
l. Avg.tBodyGyro-std()-Y
l. Avg.tBodyGyro-std()-Z
l. Avg.tBodyGyroJerk-mean()-X
l. Avg.tBodyGyroJerk-mean()-Y
l. Avg.tBodyGyroJerk-mean()-Z
l. Avg.tBodyGyroJerk-std()-X
l. Avg.tBodyGyroJerk-std()-Y
l. Avg.tBodyGyroJerk-std()-Z
l. Avg.tBodyAccMag-mean()
l. Avg.tBodyAccMag-std()
l. Avg.tGravityAccMag-mean()
l. Avg.tGravityAccMag-std()
l. Avg.tBodyAccJerkMag-mean()
l. Avg.tBodyAccJerkMag-std()
l. Avg.tBodyGyroMag-mean()
l. Avg.tBodyGyroMag-std()
l. Avg.tBodyGyroJerkMag-mean()
l. Avg.tBodyGyroJerkMag-std()
l. Avg.fBodyAcc-mean()-X
l. Avg.fBodyAcc-mean()-Y
l. Avg.fBodyAcc-mean()-Z
l. Avg.fBodyAcc-std()-X
l. Avg.fBodyAcc-std()-Y
l. Avg.fBodyAcc-std()-Z
l. Avg.fBodyAcc-meanFreq()-X
l. Avg.fBodyAcc-meanFreq()-Y
l. Avg.fBodyAcc-meanFreq()-Z
l. Avg.fBodyAccJerk-mean()-X
l. Avg.fBodyAccJerk-mean()-Y
l. Avg.fBodyAccJerk-mean()-Z
l. Avg.fBodyAccJerk-std()-X
l. Avg.fBodyAccJerk-std()-Y
l. Avg.fBodyAccJerk-std()-Z
l. Avg.fBodyAccJerk-meanFreq()-X
l. Avg.fBodyAccJerk-meanFreq()-Y
l. Avg.fBodyAccJerk-meanFreq()-Z
l. Avg.fBodyGyro-mean()-X
l. Avg.fBodyGyro-mean()-Y
l. Avg.fBodyGyro-mean()-Z
l. Avg.fBodyGyro-std()-X
l. Avg.fBodyGyro-std()-Y
l. Avg.fBodyGyro-std()-Z
l. Avg.fBodyGyro-meanFreq()-X
l. Avg.fBodyGyro-meanFreq()-Y
l. Avg.fBodyGyro-meanFreq()-Z
l. Avg.fBodyAccMag-mean()
l. Avg.fBodyAccMag-std()
l. Avg.fBodyAccMag-meanFreq()
l. Avg.fBodyBodyAccJerkMag-mean()
l. Avg.fBodyBodyAccJerkMag-std()
l. Avg.fBodyBodyAccJerkMag-meanFreq()
l. Avg.fBodyBodyGyroMag-mean()
l. Avg.fBodyBodyGyroMag-std()
l. Avg.fBodyBodyGyroMag-meanFreq()
l. Avg.fBodyBodyGyroJerkMag-mean()
l. Avg.fBodyBodyGyroJerkMag-std()
l. Avg.fBodyBodyGyroJerkMag-meanFreq()




