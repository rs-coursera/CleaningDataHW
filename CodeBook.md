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
	
As a result, measures tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag were excluded from the tidy dataset, because they are derived measures. The same applies to the magnitude of the frequency domain magnitude variables.	
Frequency based variables were included into dataset, because Fast Fourier Transform (FFT) was applied only "to some of these signals"
As a result only the variables that end with "-mean()-XYZ" or "-std()-XYZ" are included. All other measures are left out.

Variable naming
----------------
Variables that describe subject and activity are the following:
* subjectnumber - test subject number encoded as an integer value
* activityname - activity label associated with the activity performed. Activity names are retrieved from the activity_labels.txt data file provided with the dataset.

Measure names were based on the information provided "features_info.txt" with the original dataset.
Excerpt of the variable naming description is provided below:

		"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
		These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
		Then they were filtered using a median filter and a 3rd order low pass Butterworth filter 
		with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal 
		was then separated into body and gravity acceleration signals 
		(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
		Subsequently, the body linear acceleration and angular velocity were derived 
		in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
		Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm 
		(tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
		Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing 
		fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
		(Note the 'f' to indicate frequency domain signals).
		These signals were used to estimate variables of the feature vector for each pattern:  
		'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

Based on this information variable names were expanded the following way:

* prefixes were expanded to Time and Frequency respectively
* Acc expanded to Accelerometer
* Gyro - to Gyroscope
* -mean() or -std() means mean or standard deviation respectively
* -x, -y and -z correspond to the appropriate coordinate
* dashes between function and axis are left to have better readability

The resulting variable names look like the following:

* timebodyaccelerometer-mean()-x
* timebodyaccelerometer-mean()-y
* timebodyaccelerometer-mean()-z
* timebodyaccelerometer-std()-x
* timebodyaccelerometer-std()-y
* timebodyaccelerometer-std()-z
* timegravityaccelerometer-mean()-x
* timegravityaccelerometer-mean()-y
* timegravityaccelerometer-mean()-z
* timegravityaccelerometer-std()-x
* timegravityaccelerometer-std()-y
* timegravityaccelerometer-std()-z
* timebodyaccelerometerjerk-mean()-x
* timebodyaccelerometerjerk-mean()-y
* timebodyaccelerometerjerk-mean()-z
* timebodyaccelerometerjerk-std()-x
* timebodyaccelerometerjerk-std()-y
* timebodyaccelerometerjerk-std()-z
* timebodygyroscope-mean()-x
* timebodygyroscope-mean()-y
* timebodygyroscope-mean()-z
* timebodygyroscope-std()-x
* timebodygyroscope-std()-y
* timebodygyroscope-std()-z
* timebodygyroscopejerk-mean()-x
* timebodygyroscopejerk-mean()-y
* timebodygyroscopejerk-mean()-z
* timebodygyroscopejerk-std()-x
* timebodygyroscopejerk-std()-y
* timebodygyroscopejerk-std()-z
* frequencybodyaccelerometer-mean()-x
* frequencybodyaccelerometer-mean()-y
* frequencybodyaccelerometer-mean()-z
* frequencybodyaccelerometer-std()-x
* frequencybodyaccelerometer-std()-y
* frequencybodyaccelerometer-std()-z
* frequencybodyaccelerometerjerk-mean()-x
* frequencybodyaccelerometerjerk-mean()-y
* frequencybodyaccelerometerjerk-mean()-z
* frequencybodyaccelerometerjerk-std()-x
* frequencybodyaccelerometerjerk-std()-y
* frequencybodyaccelerometerjerk-std()-z
* frequencybodygyroscope-mean()-x
* frequencybodygyroscope-mean()-y
* frequencybodygyroscope-mean()-z
* frequencybodygyroscope-std()-x
* frequencybodygyroscope-std()-y
* frequencybodygyroscope-std()-z

All variable names are lower cased.

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
		
		dt[, lapply(.SD,mean), by=list(Subject, Activity.Name)]
