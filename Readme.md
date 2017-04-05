# Getting and Cleaning Data - Course Project

This is the course project for the Getting and Cleaning Data Coursera.

##Files
* **run_analysis.R** contains code to perform the analysis, it does the following:

1. Download the dataset if it does not already exist in the working directory
2. Load the activity and feature info
3. Loads both the training and test datasets, keeping only those columns which
   reflect a mean or standard deviation
4. Loads the activity and subject data for each dataset, and merges those
   columns with the dataset
5. Merges the two datasets
6. Sets the descriptive activity names.
7. Creates a tidy dataset that consists of the average (mean) value of each
   variable for each subject and activity pair.

The end result is shown in the file `tidy.txt`.

* **CodeBook.md** A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data

* **tidy.txt** The text file contains the required tidy dataset for submission. 

* **README.md** The README file for this repo.