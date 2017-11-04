---
title: "README"
author: "R3M79"
date: "4 de Novembro de 2017"

## README

This README file provides a description to the provided script run_analysis.R

# Description of script run_analysis.R
This script will perform the followin actions:

   1. load files data in the following way
        - features.txt loaded to object features
        - activity_labels.txt loaded to object actlabels
        - X_test.txt loaded to object datatest.measures
        - subject_test.txt loaded to object datatest.subj
        - y_test.txt loaded to object datatest.act
        - datatest.__ objects are merged into a single object datatest
        - X_train.txt loaded to object datatrain.measures
        - subject_train.txt loaded to object datatrain.subj
        - y_train.txt loaded to object datatrain.act
        - datatrain.__ objects are merged into a single object datatrain
        
   2. join data from test and train measures
        - dataset object contains the union of datatest and datatrain objects
        - testsize local variable stores the amount of columns for test dataframe
        - trainsize local variable stores the amount of columns for train dataframe
   3. create dataset with only mean and std variables
        - recreate dataset object by greping only required variables
   4. rename column names
        - use dplyr verb rename to rename variables
   5. identify activity by description
        - use dplyr verb mutate to replace activity Id by matching description
   6. create tidy data set with average values for each 
       subject and activity
       - use verb group_by to group dataset by subject and activity
       - use verb summarize to create tidy dataset with average values grouped
       by subject and activity
   7. output a tidydataset to file ./tidydataset.txt
