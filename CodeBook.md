#Codebook for Course Project - Human Activity Recognition Using Smartphones Data Set

##Introduction
This codebook describes the variables listed in the 'TidyData.txt' file. 'TidyData.txt' is the output from run-analysis.R which processes the raw datasets and product a tidy dataset.


##Raw Data
The raw data for this project is available at [UCI website download] (https://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip).

The website for the dataset is [UCI HAR] (https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The script file will download, extract and store the raw data files in a `data` folder of your working directory. All subsequent processing is dependent on the raw data being stored in the `data` folder of the current working directory.

##Tidy Data
The accompanying run_analysis.R file processes the training and test dataset downloaded as above and returns a tidy data that consist of 180 observations and 81 variables.

##Variables
the data file consist of the following 81 features (variables):

NOTE: 
* Features are normalized and bounded within [-1,1].
* The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2)
* The gyroscope units are rad/seg.


1. Subject - Range between 1 and 30, representing 30 individuals who participated in the activities
2. ActivityName - 6 types of activties: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING
3. Avg.tBodyAcc-mean()-X - average of mean of time signal for body acceleration for X axis
4. Avg.tBodyAcc-mean()-Y - average of mean of time signal for body acceleration for Y axis
5. Avg.tBodyAcc-mean()-Z - average of mean of time signal for body acceleration for Z axis
6. Avg.tBodyAcc-std()-X - average of standard deviation of time signal for body acceleration for X axis
7. Avg.tBodyAcc-std()-Y - average of standard deviation of time signal for body acceleration for Y axis
8. Avg.tBodyAcc-std()-Z - average of standard deviation of time signal for body acceleration for Z axis
9. Avg.tGravityAcc-mean()-X - average of mean of time signal for gravity acceleration for X axis
10. Avg.tGravityAcc-mean()-Y - average of mean of time signal for gravity acceleration for Y axis
11. Avg.tGravityAcc-mean()-Z - average of mean of time signal for gravity acceleration for Z axis
12. Avg.tGravityAcc-std()-X - average of standard deviation of time signal for gravity acceleration for X axis
13. Avg.tGravityAcc-std()-Y - average of standard deviation of time signal for gravity acceleration for Y axis
14. Avg.tGravityAcc-std()-Z - average of standard deviation of time signal for gravity acceleration for Z axis
15. Avg.tBodyAccJerk-mean()-X - average of mean of time for Jerk signals for body acceleration for X axis
16. Avg.tBodyAccJerk-mean()-Y - average of mean of time for Jerk signals for body acceleration for Y axis
17. Avg.tBodyAccJerk-mean()-Z - average of mean of time for Jerk signals for body acceleration for Z axis
18. Avg.tBodyAccJerk-std()-X - average of standard deviation of time for Jerk signals for body acceleration for X axis
19. Avg.tBodyAccJerk-std()-Y - average of standard deviation of time for Jerk signals for body acceleration for Y axis
20. Avg.tBodyAccJerk-std()-Z - average of standard deviation of time for Jerk signals for body acceleration for Z axis
21. Avg.tBodyGyro-mean()-X - average of mean of time signal for body gyroscope (angular velocity) for X axis
22. Avg.tBodyGyro-mean()-Y - average of mean of time signal for body gyroscope (angular velocity) for Y axis
23. Avg.tBodyGyro-mean()-Z - average of mean of time signal for body gyroscope (angular velocity) for Z axis
24. Avg.tBodyGyro-std()-X - average of standard deviation of time signal for body gyroscope (angular velocity) for X axis
25. Avg.tBodyGyro-std()-Y - average of standard deviation of time signal for body gyroscope (angular velocity) for Y axis
26. Avg.tBodyGyro-std()-Z - average of standard deviation of time signal for body gyroscope (angular velocity) for Z axis
27. Avg.tBodyGyroJerk-mean()-X - average of mean of time for Jerk signals for body gyroscope (angular velocity) for X axis
28. Avg.tBodyGyroJerk-mean()-Y - average of mean of time for Jerk signals for body gyroscope (angular velocity) for Y axis
29. Avg.tBodyGyroJerk-mean()-Z - average of mean of time for Jerk signals for body gyroscope (angular velocity) for Z axis
30. Avg.tBodyGyroJerk-std()-X - average of standard deviation of time for Jerk signals for body gyroscope (angular velocity) for X axis
31. Avg.tBodyGyroJerk-std()-Y - average of standard deviation of time for Jerk signals for body gyroscope (angular velocity) for Y axis
32. Avg.tBodyGyroJerk-std()-Z - average of standard deviation of time for Jerk signals for body gyroscope (angular velocity) for Z axis
33. Avg.tBodyAccMag-mean() - average of mean of time signal magnitude (calculated using the Euclidean norm) for body acceleration
34. Avg.tBodyAccMag-std() - average of standard deviation of time signal magnitude (calculated using the Euclidean norm) for body acceleration
35. Avg.tGravityAccMag-mean() - average of mean of time signal magnitude (calculated using the Euclidean norm) for gravity acceleration
36. Avg.tGravityAccMag-std() - average of standard deviation of time signal magnitude (calculated using the Euclidean norm) for gravity acceleration
37. Avg.tBodyAccJerkMag-mean() - average of mean of time for Jerk signal magnitude (calculated using the Euclidean norm) for body acceleration
38. Avg.tBodyAccJerkMag-std() - average of standard deviation of time for Jerk signal magnitude (calculated using the Euclidean norm) for body acceleration
39. Avg.tBodyGyroMag-mean() - average of mean of time signal magnitude (calculated using the Euclidean norm) for body gyroscope (angular velocity)
40. Avg.tBodyGyroMag-std() - average of standard deviation of time signal magnitude (calculated using the Euclidean norm) for body gyroscope (angular velocity)
41. Avg.tBodyGyroJerkMag-mean() - average of mean of time for Jerk signal magnitude (calculated using the Euclidean norm) for body gyroscope (angular velocity)
42. Avg.tBodyGyroJerkMag-std() - average of standard deviation of time for Jerk signal magnitude (calculated using the Euclidean norm) for body gyroscope (angular velocity)
43. Avg.fBodyAcc-mean()-X - average of mean of frequency signal (derived using a Fast Fourier Transform (FFT)) for body acceleration for X axis
44. Avg.fBodyAcc-mean()-Y - average of mean of frequency signal (derived using a Fast Fourier Transform (FFT)) for body acceleration for Y axis
45. Avg.fBodyAcc-mean()-Z - average of mean of frequency signal (derived using a Fast Fourier Transform (FFT)) for body acceleration for Z axis
46. Avg.fBodyAcc-std()-X - average of standard deviation of frequency signal (derived using a Fast Fourier Transform (FFT)) for body acceleration for X axis
47. Avg.fBodyAcc-std()-Y - average of standard deviation of frequency signal (derived using a Fast Fourier Transform (FFT)) for body acceleration for Y axis
48. Avg.fBodyAcc-std()-Z - average of standard deviation of frequency signal (derived using a Fast Fourier Transform (FFT)) for body acceleration for Z axis
49. Avg.fBodyAcc-meanFreq()-X - average of Weighted average of the frequency components (derived using a Fast Fourier Transform (FFT)) for body acceleration for X axis
50. Avg.fBodyAcc-meanFreq()-Y - average of Weighted average of the frequency components (derived using a Fast Fourier Transform (FFT)) for body acceleration for Y axis
51. Avg.fBodyAcc-meanFreq()-Z - average of Weighted average of the frequency components (derived using a Fast Fourier Transform (FFT)) for body acceleration for Z axis
52. Avg.fBodyAccJerk-mean()-X - average of mean of frequency Jerk signal (derived using a Fast Fourier Transform (FFT)) for body acceleration for X axis
53. Avg.fBodyAccJerk-mean()-Y - average of mean of frequency Jerk signal (derived using a Fast Fourier Transform (FFT)) for body acceleration for Y axis
54. Avg.fBodyAccJerk-mean()-Z - average of mean of frequency Jerk signal (derived using a Fast Fourier Transform (FFT)) for body acceleration for Z axis
55. Avg.fBodyAccJerk-std()-X - average of standard deviation of frequency Jerk signal (derived using a Fast Fourier Transform (FFT)) for body acceleration for X axis
56. Avg.fBodyAccJerk-std()-Y - average of standard deviation of frequency Jerk signal (derived using a Fast Fourier Transform (FFT)) for body acceleration for Y axis
57. Avg.fBodyAccJerk-std()-Z - average of standard deviation of frequency Jerk signal (derived using a Fast Fourier Transform (FFT)) for body acceleration for Z axis
58. Avg.fBodyAccJerk-meanFreq()-X - average of Weighted average of the frequency components Jerk signal (derived using a Fast Fourier Transform (FFT)) for body acceleration for X axis
59. Avg.fBodyAccJerk-meanFreq()-Y - average of Weighted average of the frequency components Jerk signal (derived using a Fast Fourier Transform (FFT)) for body acceleration for Y axis
60. Avg.fBodyAccJerk-meanFreq()-Z- average of Weighted average of the frequency components Jerk signal (derived using a Fast Fourier Transform (FFT)) for body acceleration for Z axis
61. Avg.fBodyGyro-mean()-X - average of mean of frequency signal (derived using a Fast Fourier Transform (FFT)) for body gyroscope (angular velocity) for X axis
62. Avg.fBodyGyro-mean()-Y - average of mean of frequency signal (derived using a Fast Fourier Transform (FFT)) for body gyroscope (angular velocity) for Y axis
63. Avg.fBodyGyro-mean()-Z - average of mean of frequency signal (derived using a Fast Fourier Transform (FFT)) for body gyroscope (angular velocity) for Z axis
64. Avg.fBodyGyro-std()-X - average of standard deviation of frequency signal (derived using a Fast Fourier Transform (FFT)) for body gyroscope (angular velocity) for X axis
65. Avg.fBodyGyro-std()-Y - average of standard deviation of frequency signal (derived using a Fast Fourier Transform (FFT)) for body gyroscope (angular velocity) for Y axis
66. Avg.fBodyGyro-std()-Z - average of standard deviation of frequency signal (derived using a Fast Fourier Transform (FFT)) for body gyroscope (angular velocity) for Y axis
67. Avg.fBodyGyro-meanFreq()-X - average of Weighted average of the frequency components (derived using a Fast Fourier Transform (FFT)) for body gyroscope (angular velocity) for X axis
68. Avg.fBodyGyro-meanFreq()-Y - average of Weighted average of the frequency components (derived using a Fast Fourier Transform (FFT)) for body gyroscope (angular velocity) for Y axis
69. Avg.fBodyGyro-meanFreq()-Z - average of Weighted average of the frequency components (derived using a Fast Fourier Transform (FFT)) for body gyroscope (angular velocity) for Z axis
70. Avg.fBodyAccMag-mean() - average of mean of frequency signal (derived using a Fast Fourier Transform (FFT)) magnitude (calculated using the Euclidean norm) for body acceleration
71. Avg.fBodyAccMag-std() - average of standard deviation of frequency signal (derived using a Fast Fourier Transform (FFT)) magnitude (calculated using the Euclidean norm) for body acceleration
72. Avg.fBodyAccMag-meanFreq() - average of Weighted average of the frequency components (derived using a Fast Fourier Transform (FFT)) magnitude (calculated using the Euclidean norm) for body acceleration
73. Avg.fBodyBodyAccJerkMag-mean() - average of mean of frequency Jerk signal (derived using a Fast Fourier Transform (FFT)) magnitude (calculated using the Euclidean norm) for body acceleration
74. Avg.fBodyBodyAccJerkMag-std() - average of standard deviation of frequency Jerk signal (derived using a Fast Fourier Transform (FFT)) magnitude (calculated using the Euclidean norm) for body acceleration
75. Avg.fBodyBodyAccJerkMag-meanFreq() - average of Weighted average of the frequency components Jerk signal (derived using a Fast Fourier Transform (FFT)) magnitude (calculated using the Euclidean norm) for body acceleration
76. Avg.fBodyBodyGyroMag-mean() - average of mean of frequency signal (derived using a Fast Fourier Transform (FFT)) magnitude (calculated using the Euclidean norm) for body gyroscope (angular velocity)
77. Avg.fBodyBodyGyroMag-std() - average of standard deviation of frequency signal (derived using a Fast Fourier Transform (FFT)) magnitude (calculated using the Euclidean norm) for body gyroscope (angular velocity)
78. Avg.fBodyBodyGyroMag-meanFreq() - average of Weighted average of the frequency components (derived using a Fast Fourier Transform (FFT)) magnitude (calculated using the Euclidean norm) for body gyroscope (angular velocity)
79. Avg.fBodyBodyGyroJerkMag-mean() - average of mean of the frequency components Jerk signal (derived using a Fast Fourier Transform (FFT)) magnitude (calculated using the Euclidean norm) for body gyroscope (angular velocity)
80. Avg.fBodyBodyGyroJerkMag-std() - average of standard deviation of the frequency components Jerk signal (derived using a Fast Fourier Transform (FFT)) magnitude (calculated using the Euclidean norm) for body gyroscope (angular velocity)
81. Avg.fBodyBodyGyroJerkMag-meanFreq() - average of Weighted average of the frequency components Jerk signal (derived using a Fast Fourier Transform (FFT)) magnitude (calculated using the Euclidean norm) for body gyroscope (angular velocity)

##Reference
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.