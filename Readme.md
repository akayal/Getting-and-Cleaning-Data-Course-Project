Course Project for Getting and Cleaning Data on Coursera

This README file contains guidance on running the run_analysis.R script on the UCI Human Activity Recognition (HAR) Dataset to generate a tidy summary data set as well as relevant background information.

Script Output

The run_analysis.R script outputs a text file containing a tidy data set with the mean of each variable for each activity and subject within the UCI HAR Dataset.

In addition to this README file, a code book file is provided which details the name, field width, definition, and range of values for each variable in the data set.

Prerequisites

In order to successfully run the script and generate the tidy data set, a zip file containing the UCI HAR Dataset must be downloaded (link) and extracted. The root folder from the zip file must be in the same directory as the run_analysis.R script.

Running the Script

Set the working directory to the folder containing the run_analysis.R script and the UCI HAR Dataset folder using the R function setwd().
Read the script file into R using the function source('run_analysis.R').
Script Pseudocode

Construct folder and file paths.
Import test and training subject data.
Label subject column name.
Import test and training activity data.
Label activity column name.
Import test and training feature data.
Import feature names.
Label feature columns.
Merge training set components into one training set and test set components into one test set.
(Course Project Step 1) Merge the training and the test sets to create one data set.
(Course Project Step 2) Extract only the measurements on the mean and standard deviation for each measurement.
Find features with "mean", "std", "act_id", or "subject" in feature name.
Select only the desired features.
(Course Project Step 3) Use descriptive activity names to name the activities in the data set.
Import activity name list.
Rename columns of activity list.
Perform join operation to match activity names to respective activity id's.
Remove act_id column since it is no longer needed.
Move activity column to second column position.
(Course Project Step 4) Appropriately label the data set with descriptive variable names.
Remove hyphens and parentheses as well as convert variable names to lowerCamelCase due to variable name lengths.
Convert non-obvious abbreviations to a longer form for readability.
(Course Project Step 5) Create a second, independent tidy data set with the average of each variable for each activity and each subject.
Specify grouping elements.
Create data set with mean of each variable for each activity and subject.
Exclude first two columns from aggregate input to prevent R from trying to average the activity and subject columns.
Create text file of tidy data set.
Course Project Instructions

The following instructions are taken verbatim from the course project web site.

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!