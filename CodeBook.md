# Introduction

The script `run_analysis.R`performs the steps described in the course project's definition.

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

# Variables

train: contains data downloaded from train file.

trainActivities: contains data downloaded from train activities file.

trainSubject: contains data downloaded from train subject file.

test: contains data downloaded from test file.

testActivities: contains data downloaded from test activities file.

testSubject: contnains data downloaded from test subject file.

features: contnains data downloaded from feature file.

subject: contnains data downloaded from feature file.

traintest: contains merged data of train and test.

traintestActivities: contain merged data of train and test activities.

traintestSubject: contain merged data of train and test subject.

all: contains merged data from train and test with only require variables.

featureswanted: contains only required feature names.

all.melted: contains melted data from all

all.mean: contain mean value by subject, activity of melted data.



