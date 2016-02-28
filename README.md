##Getting and Cleaning Data Project##
###Overview###
This is the Getting and Cleaning Data course project in Coursera. The tidydata.csv file servese as the cleaned and arranged data from a [raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The dataset being used is: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
<p>run_analysis.R is the script that is used to turn the raw data to a tidy one.</p> 
###Notes for readers###
The run_analysis.R doesn't need any modifications, the only thing you to do is set your directory before running it. When you want to read the tidydata.csv, make sure to add "header = TRUE" to the "read.csv" function.
###Project's requirements###
It was required from the students to create one R script called run_analysis.R that does the following:
<ol>
<li>Merges the training and the test sets to create one data set.</li>
<li>Extracts only the measurements on the mean and standard deviation for each measurement.</li>
<li>Uses descriptive activity names to name the activities in the data set.</li>
<li>Appropriately labels the data set with descriptive variable names.</li>
<li>From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.</li>
</ol>

###Additional information###
For more information about the tidydata.csv variables and the steps taken to create it, go to codebook.md
