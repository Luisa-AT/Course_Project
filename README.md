# Data Cleaning and Merging Datasets Script

## Overview
This R script merges two sets containing different files with data from 30 subjets that performed 6 physical activities using a Smartphone on their weist. The dataset extracts means and standard deviations for specific variables related to 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The scipt purpose is to produce a tidy dataset that can be used for additional analysis. 

## Table of Contents
1. [Dependencies](#dependencies)
2. [Dataset Information](#dataset-information)
3. [Script Functionality](#script-functionality)
4. [Usage](#usage)
5. [Output](#output)
6. [Notes](#notes)

## Dependencies
The R packages required to run the script are:
- dplyr
- readr

## Dataset Information
The datasets that were merged are:
- Set of data 1: Training
  - Source: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto, Smartlab - Non Linear Complex Systems Laboratory
  - Description: contains measurements of 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz from 30 subjects that used
    a Smartphone while performing an activity.
  - Variables: body_acc_x_train.txt (also available for Y and Z axis), body_gyro_x_train.txt, (also available for Y and Z axis), subject_id, activity_id

- Set of data 2: Test
  - Source: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto, Smartlab - Non Linear Complex Systems Laboratory
  - Description: contains measurements of 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz from 1 volunter from which activities were recorded as to
    compare with the training data.
  - Variables: body_acc_x_train.txt (also available for Y and Z axis), body_gyro_x_train.txt, (also available for Y and Z axis), subject_id, activity_id

## Script Functionality
1. Function that enables to read and combine train and test data into one dataset
2. Data Processing: addition of activity labels as well as subject id, also added descriptive activity names to the variables
3. Calculation of Means: Identify and extract columns containing mean measurements
4. Calculation of Standard Deviations: Identify and extract columns containing mean standard deviations
5. Create a tidy dataset with the average of each variable for each activity and subject
   
## Usage
1. Set up: load required libraries to run the script
2. Running the script: source(".R")

## Output
- Tidy dataset in CSV format for additional analysis

## Version History
- v1.0 (2024-08-16): Initial version

## Contact
Luisa Arredondo, luisa_arredondo@yahoo.com
