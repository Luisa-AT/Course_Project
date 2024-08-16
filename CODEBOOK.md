# Codebook: Getting and Cleaning data assignment

## Dataset Overview
This dataset contains a tidy dataset about an experiment conducted with 30 subjects. Each person in the experiment 
performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
The purpose of this dataset is to provide tidy data for any kind of analysis related to this experiment.

###Variables

### subject_id
- Description: Unique identifier for each participant
- Type: String
- Range: 1-30
- Units: Numbers
  
### activity_id
- Description: Unique identifier for each activity
- Type: Integer
- Range: 1-6
- Units: numbers

### activity_name
- Description: name of the physical activity performed by each subject
- Type: String
- Possible values: "Walking", "Walking_Upstairs", "Walking_downstairs", "Sitting", "Standing", "Laying"

### timeBodyAccelerometer-MeanXaxis (same description applies for timeBodyAccelerometer_meanYaxis and timeBodyAccelerometer_meanZaxis)
- Description: Mean of the acceleration signal from the smartphone accelerometer X axis
- Type: decimal
- Units: Hundredths

### timeBodyAccelerometer-StandardDeviationXAxis (same description applies for timeBodyAccelerometer-StandardDeviationYAxis and timeBodyAccelerometer-StandardDeviationZAxis)
- Description: Standard deviation of the acceleration signal from the smartphone accelerometer X axis 
- Type: decimal
- Units: Hundredths

### timeGravityAccelerometer-MeanXAxis (same description applies for Y and Z axis)
- Description: mean of time gravity variable
- Type: decimal
- Units: Hundredths

### timeGravityAccelerometer-StandardDeviationXAxis (same description applies for Y and Z axis)
- Description: standard deviation of the time gravity variable
- Type: decimal
- Units: Tenths

### timeBodyGyroscope-MeanXAxis (same description applies for Y and Z axis)
- Description: mean of the angular velocity vector measured by the gyroscope for each window sample.
- Type: decimal
- Units: radiants/seconds

### frequencyBodyAccelerometer-MeanXAxis (same description applies for Y and Z axis)
- Description: mean of the rate at which the bodyAccelerometer occurs in the given sample.
- Type: decimal
- Units: Tenths


## Additional Information
- All physical measurements were taken by trained professionals using calibrated equipment.
- Participants were volunteers within the age bracket of 19 to 48 years old.
- Activity levels were reported based on the information recorded in the smartphones used by each participant.

## Data Collection Protocol
1. Participants filled out a demographic questionnaire.
2. Height and weight measurements were taken.
3. Participants completed a 1-mile walk test on a treadmill.
4. Heart rate was measured immediately after the walk test.
5. Additional fitness tests were conducted (details in separate document).


## Version History
- v1.0 (2024-08-16): Initial codebook creation
