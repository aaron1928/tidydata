function () 
{
    startingWD <- getwd()
    setwd("./UCI HAR Dataset")
    xTest <- read.csv("./test/X_test.txt", sep = "", header = FALSE)
    xTrain <- read.csv("./train/X_train.txt", sep = "", header = FALSE)
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
    xAll <- data.frame(rbind(xTest, xTrain))
    testActivities <- read.csv("./test/y_test.txt", header = FALSE)
    trainActivities <- read.csv("./train/y_train.txt", header = FALSE)
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
    allActivities <- rbind(testActivities, trainActivities)
    subjectTest <- read.csv("./test/subject_test.txt", header = FALSE)
    subjectTrain <- read.csv("./train/subject_train.txt", header = FALSE)
    allSubject <- rbind(subjectTest, subjectTrain)
    xAll <- cbind(allActivities, allSubject, xAll)
    colnames(xAll)[1] <- "Activity"
    colnames(xAll)[2] <- "Subject"
    xActivity <- aggregate(xAll, by = list(xAll$Activity), FUN = mean, 
        na.rm = TRUE)
    xActivity <- xActivity[, -c(2, 3)]
    sub <- matrix("All", 6, 1)
    library(tibble)
    xActivity <- add_column(xActivity, as.character(sub), .after = 1)
    colnames(xActivity)[c(1, 2)] <- c("Activity", "Subject")
    xActivitySubject <- aggregate(xAll, by = list(xAll$Activity, 
        xAll$Subject), FUN = mean, na.rm = TRUE)
    colnames(xActivitySubject)[c(1, 2)] <- c("Activity", "Subject")
    xActivitySubject <- xActivitySubject[, -c(3, 4)]
    xSubject <- aggregate(xAll, by = list(xAll$Subject), FUN = mean, 
        na.rm = TRUE)
    xSubject <- xSubject[, -c(2, 3)]
    act <- matrix("All", 30, 1)
    xSubject <- add_column(xSubject, as.character(act), .after = 0)
    colnames(xSubject)[c(1, 2)] <- c("Activity", "Subject")
    xMeans <- rbind(xActivity, xActivitySubject, xSubject)
    setwd(startingWD)
    write.table(xMeans, file = "tidydata.txt", row.name = FALSE)
}
