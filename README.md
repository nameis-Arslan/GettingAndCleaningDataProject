# Getting and Cleaning Data Project

## Overview
This project demonstrates the process of collecting, cleaning, and preparing a data set for analysis.  
The source data comes from the UCI Machine Learning Repository:  
[Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The dataset was collected from accelerometer and gyroscope sensors of a Samsung Galaxy S smartphone.  
The goal is to create a tidy dataset that contains the average of each variable for each activity and each subject.

---

## Files in this repository
- **run_analysis.R**: R script that performs the data cleaning and creates the tidy dataset.
- **tidyData.txt**: Final tidy dataset containing the averages of each variable grouped by subject and activity.
- **CodeBook.md**: Describes the variables, data, and transformations performed.
- **README.md**: Explains the project and how the scripts work.

---

## How to run the analysis
1. Download this repository to your R working directory.
2. Run the script `run_analysis.R`.  
   It will:
   - Download and unzip the dataset if not already present.
   - Merge training and test data.
   - Extract only mean and standard deviation variables.
   - Replace activity codes with descriptive activity names.
   - Label dataset with descriptive variable names.
   - Create a tidy dataset with averages for each subject and activity.
3. The tidy dataset will be saved as `tidyData.txt`.

---

## Dependencies
The script requires the following R packages:
- **dplyr**

You can install it with:
```r
install.packages("dplyr")
