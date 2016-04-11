# run_analysis.R does the following:

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data 
# set with the average of each variable for each activity and each subject.

run_analysis <-function(){
        
        #load necessary libraries
        library(dplyr)
        library(data.table)
      
        #read the variable labels
        features <- fread("./UCI HAR Dataset/features.txt",col.names =c("idno","featurelabel"))
        colnames <- make.names(names = features$featurelabel, unique = TRUE) 
        
        #read and store the data files
        xtest <- fread("./UCI HAR Dataset/test/X_test.txt", col.names = colnames)
        subject_test <- fread("./UCI HAR Dataset/test/subject_test.txt", col.names = c("subject"))
        ytest <- fread("./UCI HAR Dataset/test/y_test.txt", col.names = c("activity"))
        testset <- cbind(subject_test, ytest, xtest)
        
        xtrain <- fread("./UCI HAR Dataset/train/X_train.txt", col.names = colnames)
        subject_train <- fread("./UCI HAR Dataset/train/subject_train.txt", col.names = c("subject"))
        ytrain <- fread("./UCI HAR Dataset/train/y_train.txt", col.names = c("activity"))
        trainset <- cbind(subject_train, ytrain, xtrain)
        
        #merge the training and test sets to create one data set
        fullrecord <- rbind(trainset,testset)
        tblrecord <- tbl_df(fullrecord)
        rm(fullrecord)
        
        #extract only mean and standard deviation measurements
        meanstd <- grep("\\.mean\\.|\\.std\\.", names(tblrecord), value = TRUE)
        extnames <- c("subject","activity",meanstd)
        extracted <-select(tblrecord, one_of(extnames))
        
        #give descriptive activity names
        activity_labels <- fread("./UCI HAR Dataset/activity_labels.txt", col.names = c("no","label"))
        activity_labels$label <- tolower(gsub("_"," ",activity_labels$label))
        extracted <- mutate(extracted, activity = factor(1*activity, labels = activity_labels$label))
        
        #adjust variable names
        names(extracted) <- gsub("\\.","", names(extracted))
        names(extracted) <- gsub("mean","Mean", names(extracted))
        names(extracted) <- gsub("std","Std", names(extracted))
        
        #create a new dataset containing the average of each variable for each activity and subject
        tidyset <- extracted %>%
                group_by(subject, activity) %>%
                summarize_each(funs(mean))
        
        write.table(tidyset, file = "tidyAnalysis.txt", row.name = FALSE)
        
}