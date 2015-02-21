#Getting and Cleaning Data Course Project CodeBook
####A description of variables, data and transformations used to create the tidy data set
1.  Website where data was obtained 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
2.  Zip file with data
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

About the DATA (from the website above):  
  The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

**The run_analysis.R function assumes the data set has been unzipped and resides in the UCI HAR Dataset-2 folder within the working directory.**
  
  
  1. Necessary files are read and stored in variables shown below.  
*  X_test.txt stored as **dataTest**
  *  X_train.txt stored as **dataTrain**
  *  subject_test.txt stored as **subjectTest**
  *  subject_train.txt stored as **subjectTrain**
  *  y_test.txt stored as **activityTest**
  *  y_train.txt stored as **activityTrain**
  *  features.txt stored as **datahead**
  
  2. dataset = dataTest and dataTrain combined  10299 observations of 561 variables

3. Using grep, selects only columns with names containing "mean" or "std".  10299 observations of 79 variables

4. subject = subjectTest and subjectTrain combined.  10299 observations of 1 variable

5. activity = activityTest and activityTrain combined. 10299 observations of 1 variable

6. combinedData =  activity, subject and dataset combined.  10299 observations of 81 variables

7. Changes Activity column to factors in order to replace integer values into descriptives (values are included in features.txt file within UCI HAR Dataset-2 folder):
  * 1 = Walking
*  2 = Walking Upstairs
*  3 = Walking Downstairs
*  4 = Sitting
*  5 = Standing
*  6 = Laying

8. tidyData = combinedData grouped by Activity and Subject and then summarized to give mean across all columns.180 observations of 81 variables

9. tidyData is written to a file called "tidy data.txt" which resides in the working directory.
