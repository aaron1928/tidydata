# tidydata
tidying data project


##This file explains how the script contained in run_analysis.R works to take the data set provided and out put a tidy data set meeting particular criteria.  First, it summarizes the full process.  Below, you can see the explanation go line by line with the code.


Summary:

##The function begins by first storing the current working directory into a variable, so that the working directory can be reset after the function has completed its operations.## 
##Next, the function changes the working directory to be the folder containing all of the Samsung data.##    
##Next, the function reads the test and train files into dataframe objects.##    
##Next, the function, keeps only the columns that deal with "mean" or "std" measurements/calculations.##  
##Next, the function, keeps only the columns that deal with "mean" or "std" measurements/calculations.##  
##Next, all the columns that we keep (mean and std variables) are given appropriate column names.##
 ##Next, the two data frames, test and train, are pasted together into a single dataframe, the test observations or rows being on top.## 
 ##Next, the numbers that code which activity generated each observation for the test and trainging data are loaded into R objects##
 ##Next, the numbers in each of these activity lists, test and training, are replaced with the activity description they stand for##   
 ##The two activity lists are pasted together into a single activity list, test on top.##
##Next, the lists of which subject performed each observation line is loaded for both the test and training data.##   
##These subject lists are pasted together, test on top.##
##Next, the Activities list and the Subject list are pasted as columns to the front of the data frame containing all the variables having to do with mean and std.##
##The pasted Activity and Subject columns are given appropriate names.##
##A new data frame is generated from the first one that computes the averages of all the observations according to the Activity.##
##This new data frame is cleaned up a bit, given some appropriate names and fields indicating that the variables are the means for all subjects aggregated together, according to activity type.##
##Another new data frame is generated from the original data frame that was pasted together.  This one averages the variable readings according to Subject x Activity.##
##This new data frame is cleaned up and labeled accordingly, indicated what the means are representing.##
##A third new date frame is created from the original pasted together one, this one computing means of the variables according to Subject only, aggregating all activities performed by each subject.##
##This third new data frame is cleaned up and labeled.##
##The three newly created data frames that compute means according to Subject, Activity, and Subject x Activity are pasted together, one on top of the other, to give a final data frame containing means of the original means/std variables calculated according to all the relevant groupings.##
##The original working directory is made to be the current one.##
##The final data frame is outputted to a file of the appropriate name.##

Line by line with the Code:

##The function begins by first storing the current working directory into a variable, so that the working directory can be reset after the function has completed its operations.## 
function () 
{
    startingWD <- getwd()
    
##Next, the function changes the working directory to be the folder containing all of the Samsung data.##    
    setwd("./UCI HAR Dataset")
    
    
##Next, the function reads the test and train files into dataframe objects.##    
    xTest <- read.csv("./test/X_test.txt", sep = "", header = FALSE)
    xTrain <- read.csv("./train/X_train.txt", sep = "", header = FALSE)
    
##Next, the function, keeps only the columns that deal with "mean" or "std" measurements/calculations.##  
    xTest <- data.frame(cbind(xTest[, 1:6], xTest[, 41:46], xTest[, 
        81:86], xTest[, 121:126], xTest[, 161:166], xTest[, 201:202], 
        xTest[, 214:215], xTest[, 227:228], xTest[, 240:241], 
        xTest[, 253:254], xTest[, 266:271], xTest[, 294:296], 
        xTest[, 345:350], xTest[, 373:375], xTest[, 424:429], 
        xTest[, 452:454], xTest[, 503:504], xTest[, 513], xTest[, 
            516:517], xTest[, 526], xTest[, 529:530], xTest[, 
            539], xTest[, 542:543], xTest[, 552], xTest[, 556:561]))
    xTrain <- data.frame(cbind(xTrain[, 1:6], xTrain[, 41:46], 
        xTrain[, 81:86], xTrain[, 121:126], xTrain[, 161:166], 
        xTrain[, 201:202], xTrain[, 214:215], xTrain[, 227:228], 
        xTrain[, 240:241], xTrain[, 253:254], xTrain[, 266:271], 
        xTrain[, 294:296], xTrain[, 345:350], xTrain[, 373:375], 
        xTrain[, 424:429], xTrain[, 452:454], xTrain[, 503:504], 
        xTrain[, 513], xTrain[, 516:517], xTrain[, 526], xTrain[, 
            529:530], xTrain[, 539], xTrain[, 542:543], xTrain[, 
            552], xTrain[, 556:561]))
            
            
##Next, all the columns that we keep (mean and std variables) are given appropriate column names.##
    names(xTest) <- cbind("BodyAcc-mean-X", "BodyAcc-mean-Y", 
        "BodyAcc-mean-Z", "BodyAcc-std-X", "BodyAcc-std-Y", "BodyAcc-std-Z", 
        "GravityAcc-mean-X", "GravityAcc-mean-Y", "GravityAcc-mean-Z", 
        "GravityAcc-std-X", "GravityAcc-std-Y", "GravityAcc-std-Z", 
        "BodyAccJerk-mean-X", "BodyAccJerk-mean-Y", "BodyAccJerk-mean-Z", 
        "BodyAccJerk-std-X", "BodyAccJerk-std-Y", "BodyAccJerk-std-Z", 
        "BodyGyro-mean-X", "BodyGyro-mean-Y", "BodyGyro-mean-Z", 
        "BodyGyro-std-X", "BodyGyro-std-Y", "BodyGyro-std-Z", 
        "BodyGyroJerk-mean-X", "BodyGyroJerk-mean-Y", "BodyGyroJerk-mean-Z", 
        "BodyGyroJerk-std-X", "BodyGyroJerk-std-Y", "BodyGyroJerk-std-Z", 
        "BodyAccMag-mean", "BodyAccMag-std", "GravityAccMag-mean", 
        "GravityAccMag-std", "BodyAccJerkMag-mean", "BodyAccJerkMag-std", 
        "BodyGyroMag-mean", "BodyGyroMag-std", "BodyGyroJerkMag-mean", 
        "BodyGyroJerkMag-std", "BodyAcc-mean-X", "BodyAcc-mean-Y", 
        "BodyAcc-mean-Z", "BodyAcc-std-X", "BodyAcc-std-Y", "BodyAcc-std-Z", 
        "BodyAcc-meanFreq-X", "BodyAcc-meanFreq-Y", "BodyAcc-meanFreq-Z", 
        "BodyAccJerk-mean-X", "BodyAccJerk-mean-Y", "BodyAccJerk-mean-Z", 
        "BodyAccJerk-std-X", "BodyAccJerk-std-Y", "BodyAccJerk-std-Z", 
        "BodyAccJerk-meanFreq-X", "BodyAccJerk-meanFreq-Y", "BodyAccJerk-meanFreq-Z", 
        "BodyGyro-mean-X", "BodyGyro-mean-Y", "BodyGyro-mean-Z", 
        "BodyGyro-std-X", "BodyGyro-std-Y", "BodyGyro-std-Z", 
        "BodyGyro-meanFreq-X", "BodyGyro-meanFreq-Y", "BodyGyro-meanFreq-Z", 
        "BodyAccMag-mean", "BodyAccMag-std", "BodyBodyAccJerkMag-mean", 
        "BodyBodyAccJerkMag-std", "BodyBodyAccJerkMag-meanFreq", 
        "BodyBodyGyroMag-mean", "BodyBodyGyroMag-std", "BodyBodyGyroMag-meanFreq", 
        "BodyBodyGyroJerkMag-mean", "BodyBodyGyroJerkMag-std", 
        "BodyBodyGyroJerkMag-meanFreq", "angle(tBodyAccMean,gravity)", 
        "angle(tBodyAccJerkMean,gravityMean)", "angle(tBodyGyroMean,gravityMean)", 
        "angle(tBodyGyroJerkMean,gravityMean)", "angle(X,gravityMean)", 
        "angle(Y,gravityMean)", "angle(Z,gravityMean))")
    names(xTrain) <- cbind("BodyAcc-mean-X", "BodyAcc-mean-Y", 
        "BodyAcc-mean-Z", "BodyAcc-std-X", "BodyAcc-std-Y", "BodyAcc-std-Z", 
        "GravityAcc-mean-X", "GravityAcc-mean-Y", "GravityAcc-mean-Z", 
        "GravityAcc-std-X", "GravityAcc-std-Y", "GravityAcc-std-Z", 
        "BodyAccJerk-mean-X", "BodyAccJerk-mean-Y", "BodyAccJerk-mean-Z", 
        "BodyAccJerk-std-X", "BodyAccJerk-std-Y", "BodyAccJerk-std-Z", 
        "BodyGyro-mean-X", "BodyGyro-mean-Y", "BodyGyro-mean-Z", 
        "BodyGyro-std-X", "BodyGyro-std-Y", "BodyGyro-std-Z", 
        "BodyGyroJerk-mean-X", "BodyGyroJerk-mean-Y", "BodyGyroJerk-mean-Z", 
        "BodyGyroJerk-std-X", "BodyGyroJerk-std-Y", "BodyGyroJerk-std-Z", 
        "BodyAccMag-mean", "BodyAccMag-std", "GravityAccMag-mean", 
        "GravityAccMag-std", "BodyAccJerkMag-mean", "BodyAccJerkMag-std", 
        "BodyGyroMag-mean", "BodyGyroMag-std", "BodyGyroJerkMag-mean", 
        "BodyGyroJerkMag-std", "BodyAcc-mean-X", "BodyAcc-mean-Y", 
        "BodyAcc-mean-Z", "BodyAcc-std-X", "BodyAcc-std-Y", "BodyAcc-std-Z", 
        "BodyAcc-meanFreq-X", "BodyAcc-meanFreq-Y", "BodyAcc-meanFreq-Z", 
        "BodyAccJerk-mean-X", "BodyAccJerk-mean-Y", "BodyAccJerk-mean-Z", 
        "BodyAccJerk-std-X", "BodyAccJerk-std-Y", "BodyAccJerk-std-Z", 
        "BodyAccJerk-meanFreq-X", "BodyAccJerk-meanFreq-Y", "BodyAccJerk-meanFreq-Z", 
        "BodyGyro-mean-X", "BodyGyro-mean-Y", "BodyGyro-mean-Z", 
        "BodyGyro-std-X", "BodyGyro-std-Y", "BodyGyro-std-Z", 
        "BodyGyro-meanFreq-X", "BodyGyro-meanFreq-Y", "BodyGyro-meanFreq-Z", 
        "BodyAccMag-mean", "BodyAccMag-std", "BodyBodyAccJerkMag-mean", 
        "BodyBodyAccJerkMag-std", "BodyBodyAccJerkMag-meanFreq", 
        "BodyBodyGyroMag-mean", "BodyBodyGyroMag-std", "BodyBodyGyroMag-meanFreq", 
        "BodyBodyGyroJerkMag-mean", "BodyBodyGyroJerkMag-std", 
        "BodyBodyGyroJerkMag-meanFreq", "angle(tBodyAccMean,gravity)", 
        "angle(tBodyAccJerkMean,gravityMean)", "angle(tBodyGyroMean,gravityMean)", 
        "angle(tBodyGyroJerkMean,gravityMean)", "angle(X,gravityMean)", 
        "angle(Y,gravityMean)", "angle(Z,gravityMean))")
        
        
  ##Next, the two data frames, test and train, are pasted together into a single dataframe, the test observations or rows being on top.##      
    xAll <- data.frame(rbind(xTest, xTrain))
    
##Next, the numbers that code which activity generated each observation for the test and trainging data are loaded into R objects##
    testActivities <- read.csv("./test/y_test.txt", header = FALSE)
    trainActivities <- read.csv("./train/y_train.txt", header = FALSE)
    
##Next, the numbers in each of these activity lists, test and training, are replaced with the activity description they stand for##    
    testActivities[testActivities == 6] <- "Laying"
    testActivities[testActivities == 5] <- "Standing"
    testActivities[testActivities == 4] <- "Sitting"
    testActivities[testActivities == 3] <- "Walking_Downstairs"
    testActivities[testActivities == 2] <- "Walking_Upstairs"
    testActivities[testActivities == 1] <- "Walking"
    trainActivities[trainActivities == 6] <- "Laying"
    trainActivities[trainActivities == 5] <- "Standing"
    trainActivities[trainActivities == 4] <- "Sitting"
    trainActivities[trainActivities == 3] <- "Walking_Downstairs"
    trainActivities[trainActivities == 2] <- "Walking_Upstairs"
    trainActivities[trainActivities == 1] <- "Walking"
    
##The two activity lists are pasted together into a single activity list, test on top.##    
    allActivities <- rbind(testActivities, trainActivities)
    
##Next, the lists of which subject performed each observation line is loaded for both the test and training data.##    
    subjectTest <- read.csv("./test/subject_test.txt", header = FALSE)
    subjectTrain <- read.csv("./train/subject_train.txt", header = FALSE)
    
##These subject lists are pasted together, test on top.##    
    allSubject <- rbind(subjectTest, subjectTrain)
    
##Next, the Activities list and the Subject list are pasted as columns to the front of the data frame containing all the variables having to do with mean and std.## 
    xAll <- cbind(allActivities, allSubject, xAll)
    
##The pasted Activity and Subject columns are given appropriate names.##    
    colnames(xAll)[1] <- "Activity"
    colnames(xAll)[2] <- "Subject"
    
##A new data frame is generated from the first one that computes the averages of all the observations according to the Activity.##    
    xActivity <- aggregate(xAll, by = list(xAll$Activity), FUN = mean, 
        na.rm = TRUE)
        
##This new data frame is cleaned up a bit, given some appropriate names and fields indicating that the variables are the means for all subjects aggregated together, according to activity type.##        
    xActivity <- xActivity[, -c(2, 3)]
    sub <- matrix("All", 6, 1)
    library(tibble)
    xActivity <- add_column(xActivity, as.character(sub), .after = 1)
    colnames(xActivity)[c(1, 2)] <- c("Activity", "Subject")
    
##Another new data frame is generated from the original data frame that was pasted together.  This one averages the variable readings according to Subject x Activity.##      
    xActivitySubject <- aggregate(xAll, by = list(xAll$Activity, 
        xAll$Subject), FUN = mean, na.rm = TRUE)
        
##This new data frame is cleaned up and labeled accordingly, indicated what the means are representing.##        
    colnames(xActivitySubject)[c(1, 2)] <- c("Activity", "Subject")
    xActivitySubject <- xActivitySubject[, -c(3, 4)]
    
##A third new date frame is created from the original pasted together one, this one computing means of the variables according to Subject only, aggregating all activities performed by each subject.##    
    xSubject <- aggregate(xAll, by = list(xAll$Subject), FUN = mean, 
        na.rm = TRUE)
        
##This third new data frame is cleaned up and labeled.##        
    xSubject <- xSubject[, -c(2, 3)]
    act <- matrix("All", 30, 1)
    xSubject <- add_column(xSubject, as.character(act), .after = 0)
    colnames(xSubject)[c(1, 2)] <- c("Activity", "Subject")
    
##The three newly created data frames that compute means according to Subject, Activity, and Subject x Activity are pasted together, one on top of the other, to give a final data frame containing means of the original means/std variables calculated according to all the relevant groupings.##    
    xMeans <- rbind(xActivity, xActivitySubject, xSubject)
    
##The original working directory is made to be the current one.##    
    setwd(startingWD)
    
##The final data frame is outputted to a file of the appropriate name.##
    write.table(xMeans, file = "tidydata.txt", row.name = FALSE)
}

