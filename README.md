**The run_analysis.R function assumes the data set has been unzipped and resides in the UCI HAR Dataset-2 folder within the working directory.**
  
  1. Loads dplyr package to ensure all functions used will work
2. Reads necessary files and store in variables.  
*  X_test.txt stored as **dataTest**
  *  X_train.txt stored as **dataTrain**
  *  subject_test.txt stored as **subjectTest**
  *  subject_train.txt stored as **subjectTrain**
  *  y_test.txt stored as **activityTest**
  *  y_train.txt stored as **activityTrain**
  *  features.txt stored as **datahead**
  
  3. Combines **dataTest** and **dataTrain** data into one table named **dataset**. 10299 observations of 561 variables
4. Replaces column names of **dataset** with values from the second column of **datahead** table
5. Using grep, selects only the **dataset** columns with names containing mean or std.  10299 observations of 79 variables
6. Combines **subjectTest** and **subjectTrain** into one table named **subject** and change column name to Subject.  10299 observations of 1 variable
7. Combines **activityTest** and **activityTrain** into one table named **activity** and changes column name to Activity. 10299 observations of 1 variable
8. Column binds **activity, subject and dataset** together to create one table with 10299 observations of 81 variables named **combinedData**
  9. Changes Activity column of **combinedData** to factors in order to replace integer values into descriptives (values are included in features.txt file within data set):
  * 1 = Walking
*  2 = Walking Upstairs
*  3 = Walking Downstairs
*  4 = Sitting
*  5 = Standing
*  6 = Laying
10. Groups **combinedData** by Activity and then by subject to provide a summary of the mean across all columns and stored as the variable **tidyData**.  This produces a data set of 180 observations of 81 variables
11. **tidyData** is written to a file called "tidy data.txt" which resides in the working directory.
