# Code Book
It describes the variables, the data, and any transformations or work that was performed to clean up the data.

### Identifiers
1. Subject_Num 
  - It comes from the 2 files, subject_train.txt & subject_test.txt
  - It Shows The ID of the test subject
2. Y_Num 
  - It comes from the 2 files, Y_train.txt & Y_test.txt
  - It Contains The type of activity performed when the corresponding measurements were taken
  
### Measurements
#### There are 79 Measurements which comes from the 2 files, X_train.txt & X_test.txt
- time_Body_Accelerometer-mean()-X / Y / Z
- time_Body_Accelerometer-StdDev()-X / Y / Z 
- time_Gravity_Accelerometer-mean()-X / Y / Z
- time_Body_AccelerometerJerk-mean()-X / Y / Z 
- time_Body_AccelerometerJerk-StdDev()-X / Y / Z 
- time_Body_Gyroscope-mean()-X / Y / Z  
- time_Body_Gyroscope-StdDev()-X / Y / Z 
- time_Body_GyroscopeJerk-mean()-X / Y / Z 
- time_Body_GyroscopeJerk-StdDev()-X / Y / Z 
- time_Body_AccelerometerMag-mean() / StdDev() 
- time_Gravity_AccelerometerMag-mean() / StdDev()  
- time_Body_Accelerometer_JerkMagnitude-mean() / StdDev() 
- time_Body_GyroscopeMag-mean() / StdDev()   
- time_Body_Gyroscope_JerkMagnitude-mean() / StdDev() 
- freq_Body_Accelerometer-mean()-X / Y / Z
- freq_Body_Accelerometer-StdDev()-X / Y / Z  
- freq_Body_Accelerometer-meanFreq()-X / Y / Z 
- freq_Body_AccelerometerJerk-mean()-X / Y / Z 
- freq_Body_AccelerometerJerk-StdDev()-X / Y / Z 
- freq_Body_AccelerometerJerk-meanFreq()-X / Y / Z
- freq_Body_Gyroscope-mean()-X / Y / Z
- freq_Body_Gyroscope-StdDev()-X / Y / Z 
- freq_Body_Gyroscope-meanFreq()-X / Y / Z
- freq_Body_AccelerometerMag-mean() / StdDev() / meanFreq() 
- freq_Body_Accelerometer_JerkMagnitude-mean() / StdDev() / meanFreq() 
- freq_Body_GyroscopeMag-mean() / StdDev() / meanFreq()   
- freq_Body_Gyroscope_JerkMagnitude-mean() / StdDev() / meanFreq() 

### Activity Labels
#### It Shows 6 Steps Levels for Y_Num, One of Identifiers
- WALKING  (value  1 ): subject was walking during the test
- WALKING_UPSTAIRS  (value  2 ): subject was walking up a staircase during the test
- WALKING_DOWNSTAIRS  (value  3 ): subject was walking down a staircase during the test
- SITTING  (value  4 ): subject was sitting during the test
- STANDING  (value  5 ): subject was standing during the test
- LAYING  (value  6 ): subject was laying down during the test
