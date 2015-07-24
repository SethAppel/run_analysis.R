## R code to perform analysis of Samsung Wearable Device Data
## Assumes user has all needed data sets pre-loaded into environment with variable 
## names equivalent to original text file name


totaltest <- cbind(subject_test,y_test,x_test)    ## Creates Total Test Data
totaltrain <- cbind(subject_train,y_train,x_train)  ## Creates Total Training Data
totaldata <- rbind(totaltest,totaltrain)   ## Combines all into Summary Data
features2 <- as.vector(features[,2])  ## Creates Vector to help subset to Mean and STD
columncut<-grep("mean+|Mean+|std",features2)+2  ## Identifies relevant columns
columncut2<- c(1,2,columncut)  ## Adds two columns for subject and activity
totaldata2<-totaldata[,columncut2]  ## Cuts data down to relevant columns
totaldata3<-totaldata2  
activitytitles <- as.character(activity[,2]) ## Creates activity titles
for (n in 1:10299) {totaldata3[n,2]<-activitytitles[totaldata2[n,2]]}  ##Creates loops to replace numbers with activity descriptions
columnames<- as.character()
columncutnames <- columncut-2
columnnames <- c("Subject","Activity",features2[columncutnames])
names(totaldata3)[1:88] <- columnnames  ## Assigns descriptive column names
finaltidy <- aggregate(totaldata3,list(totaldata3$Activity,totaldata3$Subject),mean)  ## Creates aggregate data
finaltidy[,4]<-finaltidy[,1]   ## Organizes aggregate data
finaltidy<-finaltidy[,-1]
finaltidy <- finaltidy[,-1]
write.table(finaltidy,file="TidyData.txt",row.name=FALSE)  ## Saves aggregate data

