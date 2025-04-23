# Code Book

## Data Source

The data used in this analysis comes from the Human Activity Recognition Using Smartphones Dataset.
The original data can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variables

### Identifiers
- `subject`: ID of the test subject (1-30)
- `activity`: Type of activity performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

### Measurements
All measurements are averages for each subject and activity combination. The measurements include:

- Time domain signals (prefix 'time')
- Frequency domain signals (prefix 'frequency')
- Accelerometer signals (contains 'Accelerometer')
- Gyroscope signals (contains 'Gyroscope')
- Body signals (contains 'Body')
- Gravity signals (contains 'Gravity')
- Mean values (contains 'Mean')
- Standard deviation values (contains 'StdDev')
- X,Y,Z axis signals (suffix 'X', 'Y', or 'Z')

### Transformations

1. Merged training and test datasets
2. Extracted only mean and standard deviation measurements
3. Applied descriptive activity names from activity_labels.txt
4. Created descriptive variable names by:
   - Replacing prefix 't' with 'time'
   - Replacing prefix 'f' with 'frequency'
   - Replacing 'Acc' with 'Accelerometer'
   - Replacing 'Gyro' with 'Gyroscope'
   - Replacing 'Mag' with 'Magnitude'
   - Removing duplicate 'Body' strings
   - Replacing '-mean()' with 'Mean'
   - Replacing '-std()' with 'StdDev'
   - Removing dashes
5. Calculated averages for each variable by subject and activity
6. Added 'average_' prefix to the column names in the final tidy dataset

## Tidy Data

The final tidy dataset contains 180 observations (30 subjects × 6 activities) with 68 variables representing the averages of the mean and standard deviation measurements.

### Variable Naming Convention

The variable names follow this structure:
- Prefix: "average_" (indicating these are averaged values)
- Domain: "time" or "frequency"
- Measurement Type: "Body" or "Gravity"
- Sensor: "Accelerometer" or "Gyroscope"
- Measurement: "Mean" or "StdDev"
- Optional: "Magnitude" or specific axis ("X", "Y", or "Z")

Example: 
- `average_timeBodyAccelerometerMeanX`: Average of time domain body acceleration mean values in the X direction
- `average_frequencyBodyGyroscopeMagnitudeStdDev`: Average of frequency domain body gyroscope magnitude standard deviation values

### Units

- Accelerometer measurements are in standard gravity units 'g'
- Gyroscope measurements are in radians/second
- All features are normalized and bounded within [-1,1]
