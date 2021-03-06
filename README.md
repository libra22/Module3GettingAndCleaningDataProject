
#README for run_analysis.R

##Introduction
This file describes the steps in run_analysis.R script which reads dataset downloaded from [UCI HAR] (https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and processes selected features (variables) to produce a tidy dataset `tidydata.txt' which is also found in this repository along with run_analysis.R.

Basically, the input for run_analysis.R is training and test datasets (along with supporting text files) found in `data` folder, and the output is TidyData.txt.


##Download dataset
The website for the dataset is [UCI HAR] (https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The raw data for this project is available at [UCI website download] (https://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip).


The script downloads, and unzips the dataset into a folder named 'data' in the working directory. 


```
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile=("UCI_HAR.zip"))
unzip("UCI_HAR.zip")
file.rename("UCI HAR Dataset","data")
```

For example, if your working directory is `/Users/Balan/Project1`, then the following files should be installed/found in that directory:

/Users/Balan/Project1/run_analysis.R

/Users/Balan/Project1/CodeBook.md

/Users/Balan/Project1/README.md

/Users/Balan/Project1/UCI_HAR.zip

/Users/Balan/Project1/data/(multiple files herein)

The output file `TidyData.txt` will also be written to this directory.

Within the `data` folder, the following files/folders are found:
----

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

NOTE:
* for this project, the files in `Inertial Signal` folders are not used as its used to derive the training and test datasets (`X_train.txt` and `X_test.txt`)

##Read the text files into data frame
Read the relevant 8 files as follows:

* features.txt - list of features (variables) which consist of 561 items
* activity_labels.txt - list of the 6 activities. The activity codes are used in Y_test and Y_training files
* X_test - the observations of the 561 variables for test data
* Y_test - the activities which correspond to the observations in X_test. Each row in Y_test corresponds to a respective row in X_test
* subject_test.txt - the list of individuals who were observed as per the X_test data. Each row in subject_test corresponds to a row in X_test
* X_training - the observations of the 561 variables for training data
* Y_training - the activities which correspond to the observations in X_train. Each row in Y_train corresponds to a respective row in X_train
* subject_training.txt - the list of individuals who were observed as per the X_train data. Each row in subject_train corresponds to a row in X_train

```
featurelist <- read.table("./data/features.txt",header = FALSE,stringsAsFactors = FALSE)
activitylabel <- read.table("./data/activity_labels.txt",header = FALSE,stringsAsFactors = FALSE)
Xtest <- read.table("./data/test/X_test.txt",header = FALSE,stringsAsFactors = FALSE)
Ytest <- read.table("./data/test/y_test.txt",header = FALSE,stringsAsFactors = FALSE)
subjecttest <- read.table("./data/test/subject_test.txt",header = FALSE,stringsAsFactors = FALSE)
Xtrain <- read.table("./data/train/X_train.txt",header = FALSE,stringsAsFactors = FALSE)
Ytrain <- read.table("./data/train/y_train.txt",header = FALSE,stringsAsFactors = FALSE)
subjecttrain <- read.table("./data/train/subject_train.txt",header = FALSE,stringsAsFactors = FALSE)
```

##Processing the data frames

###Using dplyr package
To simplify tidying data, dplyr package is used. If the package is not available, the script will download and install dplyr. Next, the script converts the datasets into tbl_df.

```
if (!require("dplyr")) install.packages("dplyr")
library(dplyr)
````

````
dpxtest <- tbl_df(Xtest)
dpxtrain <- tbl_df(Xtrain)
dpytest <- tbl_df(Ytest)
dpytrain <- tbl_df(Ytrain)
dpsubjecttest <- tbl_df(subjecttest)
dpsubjecttrain <- tbl_df(subjecttrain)
```

###Change activity column values
The column names in dpytest and dpytraining are changed from the activity code to activity name as per listed in activitylabel. For example, "1" will be replaced by "WALKING" and so on.

```
for (i in 1:nrow(activitylabel))
{
  dpytest <- mutate(dpytest, V1 = ifelse(V1 == i, activitylabel[[2]][[i]], V1))
  dpytrain <- mutate(dpytrain, V1 = ifelse(V1 == i, activitylabel[[2]][[i]], V1))
}
```

###Combine the 6 files into 2 files (training and test)
For each group of data, combine the subjects, Y and X tbl_df objects using bind_cols. Each tbl_df will now contain 563 variables (1 from subject, 1 from Y, and 561 from X).

```
dptest <- bind_cols(dpsubjecttest,dpytest,dpxtest)
dptrain <- bind_cols(dpsubjecttrain,dpytrain,dpxtrain)
```

###Rename column names
Rename the columns to Subject (1st column), ActivityName (2nd column), and the rest of the columns as numbers from 1 to 561. The numbered columns is done for purpose of combining the two datasets later.
```
colnames(dptrain)<- c("Subject","ActivityName",1:561)
colnames(dptest)<- c("Subject","ActivityName",1:561)
```

###Combine test and train data
Combine test and train data using bind_rows into single tbl_df named dp.
```
dp <- bind_rows(dptest,dptrain)
```

###Rename column names
Rename the column names again, this time repeating the same name for first two columns, and replacing the balance columns names with corresponding rows in featurelist. After this step, all the column names will have descriptive names.
```
colnames(dp)<- c("Subject","ActivityName",featurelist[[2]])
```

###Remove unnecessary objects
For purpose of clearing up memory and having cleaner environment, the unused objects are removed
```
remove("activitylabel","Xtest","Xtrain","Ytest","Ytrain","i","subjecttrain","subjecttest","featurelist","dpytrain","dpytest","dpxtrain","dpxtest","dptest","dptrain","dpsubjecttest","dpsubjecttrain")
```

At the end of this stage, a single tbl_df named 'dp' will have 10299 observations and 563 named columns.

##Creating tidy data
The following codes extract, calculate and create the tidy data set.

###Extract mean and std columns 
Extract the mean and std columns as per the project requirement. For the purpose of this project, only those variables with mean(), std(), and meanFreq() are considered while those within angle() are not as these are derived from other variables. A total of 79 columns are extracted, and together with Subject and ActivityName columns, gives a 81 column dataset.

```
dpMeanStd<-dp[,c("Subject","ActivityName",grep("mean|std", colnames(dp), value = TRUE))]
```

###Convert to factor
Subject and ActivityName columns are made into factors so that these columns can be used for grouping.
```
dpMeanStd$ActivityName <- as.factor(dpMeanStd$ActivityName)
dpMeanStd$Subject <- as.factor(dpMeanStd$Subject)
```

###Create grouped table
The dataset is grouped by Subject and ActivityName for easier aggregation of data in next step.
```
dpGrp<-group_by(dpMeanStd,Subject,ActivityName)
```

###Create summarised data.
Using the grouped dataset, mean for each of the balance 79 columns is calculated, using summarise_each. This new dataset set is stored in TidyData.
```
TidyData<-summarise_each(dpGrp,funs(mean))
```

###Update column name of tidy data
The column names of 3rd till 81st columns are appended with "Avg." to reflect that its the mean value of grouped dataset.
```
tempcolnames<-colnames(TidyData)
i <- 3
for (i in 3:length(tempcolnames))
  {
    tempcolnames[i]= paste("Avg.",tempcolnames[i],sep = "")
  }
colnames(TidyData) <- tempcolnames
```

###Write to text file
Write the tidy data to 'TidyData.txt' in the current working directory.
```
write.table(TidyData,file="TidyData.txt",row.names = FALSE)
```





##Reference
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012