Getting and Cleaning Data Project Code Book
========================================================

Experimental study
------------------
For this "getting and cleaning data" homework for Coursera the study of [Human Activity Recognition Using Smart Phones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) was used.

Choosing the data
--------------------------------
It was required to extract only the measurements on the mean and standard deviation for each measurement.
Based on this only the direct measures for each coordinate were accepted into the dataset, but not calculated values like

		"magnitude of these three-dimensional signals were calculated using the Euclidean norm"
	
As a result, measures tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag were excluded from the tidy dataset.
The same applies to the magnitude of the frequency domain magnitude variables.	
Frequency based variables were included into dataset, because Fast Fourier Transform (FFT) was applied only "to some of these signals"
As a result only the variables that end with "-mean()-XYZ" or "-std()-XYZ" are included. All other measures are left out.

Variable naming
----------------
For the measures it was decided to leave the names of the measures defined the same as they were originally in the original dataset, because the name contains good enough encoding. More details are available in the file "features_info.txt" with the original dataset.
Excerpt of the variable naming description is provided below:

		"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
		Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
		Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
		These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

Two additional variables are:
* Subject - test subject number encoded as an integer value
* Activity.Name - activity label associated with the activity performed.
Names of the variables are written to the output.txt file for later reference.

Activity labels
----------------
During the process of creating tidy dataset activity labels provided with the dataset were used.
The values are defined as follows:
	
		WALKING
		WALKING_UPSTAIRS
		WALKING_DOWNSTAIRS
		SITTING
		STANDING
		LAYING

These values are used in the tidy dataset.

Data aggregation
-----------------
As part of the assignment it was required to calculate "average of each variable for each activity and each subject".
The decision was to run mean function grouping by subject and activity. Data table functionality was used to perform this action:
		
		```{r}
		dt[, lapply(.SD,mean), by=list(Subject, Activity.Name)]
		```
		

