# Code Book
This Code book describes the variables, the data, and any transformations or work performed to clean up the data.

### Source Data
The data used represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

[UCI Machine Learning Repository: Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The zip file containing the data for the project is available here:
[Dataset]( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The unzipped file "UCI HAR Dataset" contains a text file, features.txt, which contains the variable names of the features selected for the database. The file activity_labels.txt contains the descriptive labels of activities for which data was collected. The two folders, "test" and "train" each contain files on the subject (subject_test.txt and subject_train.txt) the activity performed (y_test.txt and y_train.txt), and the accelerometer and gyroscope signals (X_test.txt and X_train.txt).

### Data Clean Up
To clean up this data, run_analysis.R loads the files from the text and train folders, using features.txt to obtain the variable names for the accelerometer and gyroscope signals. The subject and activity data is added as columns to the dataset, and the test and train data is combined into one  set of data. Subsequently, measurements on only the mean and standard deviation are extracted from the dataset, and the activity names are changed from number values to descriptive activity names. Using the dplyr package, the averages of each variable are obtained for each subject and activity, resulting in a new, tidy data set containing the average of each mean and std measurement for each subject performing each of the six possible activities. 

### Variables
The description of the variable names for the accelerometer and gyroscope data is obtained from the features_info.txt file contained in the above dataset zip file:
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
> 
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
> 
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
> 
> These signals were used to estimate variables of the feature vector for each pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

List of variable names as they appear in the output file:

 [1] "subject"                  "activity"                
 [3] "tBodyAccMeanX"            "tBodyAccMeanY"           
 [5] "tBodyAccMeanZ"            "tBodyAccStdX"            
 [7] "tBodyAccStdY"             "tBodyAccStdZ"            
 [9] "tGravityAccMeanX"         "tGravityAccMeanY"        
[11] "tGravityAccMeanZ"         "tGravityAccStdX"         
[13] "tGravityAccStdY"          "tGravityAccStdZ"         
[15] "tBodyAccJerkMeanX"        "tBodyAccJerkMeanY"       
[17] "tBodyAccJerkMeanZ"        "tBodyAccJerkStdX"        
[19] "tBodyAccJerkStdY"         "tBodyAccJerkStdZ"        
[21] "tBodyGyroMeanX"           "tBodyGyroMeanY"          
[23] "tBodyGyroMeanZ"           "tBodyGyroStdX"           
[25] "tBodyGyroStdY"            "tBodyGyroStdZ"           
[27] "tBodyGyroJerkMeanX"       "tBodyGyroJerkMeanY"      
[29] "tBodyGyroJerkMeanZ"       "tBodyGyroJerkStdX"       
[31] "tBodyGyroJerkStdY"        "tBodyGyroJerkStdZ"       
[33] "tBodyAccMagMean"          "tBodyAccMagStd"          
[35] "tGravityAccMagMean"       "tGravityAccMagStd"       
[37] "tBodyAccJerkMagMean"      "tBodyAccJerkMagStd"      
[39] "tBodyGyroMagMean"         "tBodyGyroMagStd"         
[41] "tBodyGyroJerkMagMean"     "tBodyGyroJerkMagStd"     
[43] "fBodyAccMeanX"            "fBodyAccMeanY"           
[45] "fBodyAccMeanZ"            "fBodyAccStdX"            
[47] "fBodyAccStdY"             "fBodyAccStdZ"            
[49] "fBodyAccJerkMeanX"        "fBodyAccJerkMeanY"       
[51] "fBodyAccJerkMeanZ"        "fBodyAccJerkStdX"        
[53] "fBodyAccJerkStdY"         "fBodyAccJerkStdZ"        
[55] "fBodyGyroMeanX"           "fBodyGyroMeanY"          
[57] "fBodyGyroMeanZ"           "fBodyGyroStdX"           
[59] "fBodyGyroStdY"            "fBodyGyroStdZ"           
[61] "fBodyAccMagMean"          "fBodyAccMagStd"          
[63] "fBodyBodyAccJerkMagMean"  "fBodyBodyAccJerkMagStd"  
[65] "fBodyBodyGyroMagMean"     "fBodyBodyGyroMagStd"     
[67] "fBodyBodyGyroJerkMagMean" "fBodyBodyGyroJerkMagStd"