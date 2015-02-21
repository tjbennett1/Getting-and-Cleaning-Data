library(dplyr)
## read data set into R
subjectTest <- read.csv("./UCI HAR Dataset-2/test/subject_test.txt",header=FALSE)
subjectTrain <- read.csv("./UCI HAR Dataset-2/train/subject_train.txt",header=FALSE)
dataTest  <- read.table("./UCI HAR Dataset-2/test/X_test.txt",header=FALSE,sep="")
dataTrain <- read.table("./UCI HAR Dataset-2/train/X_train.txt",header=FALSE,sep="")
actTest <- read.csv("./UCI HAR Dataset-2/test/y_test.txt",header=FALSE)
actTrain <- read.csv("./UCI HAR Dataset-2/train/y_train.txt",header=FALSE)
dheader <- read.table("./UCI HAR Dataset-2/features.txt",header=FALSE,sep=" ")

##combine data from test and train from respective files
data <- rbind(dataTest,dataTrain)
subject <- rbind(subjectTest, subjectTrain)
activity <- rbind(actTest,actTrain)

##change column names for all datasets
colnames(activity) <- c("Activity")
colnames(subject) <- c("Subject")
dheader <- dheader[,2]
colnames(data) <- dheader

##select only the columns where the name contains either mean or std
selecteddata <- grep("mean|std",names(data))
data <- data[,selecteddata]

## bind activity, subject and data together for further analysis
data <- cbind(activity,subject,data)

##substitute descriptive names for activity value in data
data$Activity <- as.factor(data$Activity)
levels(data$Activity) <- c("Walking","Walking Upstairs","Walking Downstairs","Sitting","Standing","Laying")

##group and summarise data to make a tidy data set
tidydata<- data%>%group_by(Activity,Subject)%>%summarise_each(funs(mean))

##write data to working directory as a txt file
write.table(tidydata,file="./tidy data.txt", row.names=FALSE)
