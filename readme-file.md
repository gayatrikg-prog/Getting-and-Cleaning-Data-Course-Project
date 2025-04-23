# Human Activity Recognition Using Smartphones Data Analysis

This repository contains the R script for cleaning and analyzing data from the Human Activity Recognition Using Smartphones Dataset.

## Files

- `run_analysis.R`: The main R script that performs the following steps:
  1. Downloads and unzips the dataset (if not already present)
  2. Merges the training and test data sets
  3. Extracts measurements for mean and standard deviation
  4. Applies descriptive activity names
  5. Labels variables with descriptive names
  6. Creates a tidy dataset with averages by subject and activity

- `CodeBook.md`: Describes the variables, data, and transformations performed

- `tidy_data.txt`: The output tidy dataset created by the script

## How to run the analysis

1. Ensure you have R and the dplyr package installed
2. Place the run_analysis.R script in your working directory
3. Run the script using `source("run_analysis.R")`
4. The script will create a tidy_data.txt file with the results

## Dependencies

- R
- dplyr package

## Data Source

The Human Activity Recognition Using Smartphones Dataset is used in this analysis. The data was collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Script Workflow

The `run_analysis.R` script performs the following operations:

1. Downloads the dataset if not already present
2. Reads and merges training and test data for subjects, activities, and features
3. Applies feature names from the features.txt file
4. Extracts only mean() and std() measurements
5. Replaces activity codes with descriptive activity names
6. Creates more readable variable names by expanding abbreviations
7. Generates a tidy dataset with averages grouped by subject and activity
8. Saves the result to tidy_data.txt
