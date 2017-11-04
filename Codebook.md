---
title: "Codebook"
author: "R3M79"
date: "4 de Novembro de 2017"
---
##Codebook

#Variables Description for global dataset

subject
	ID from 1:30 identifying the subject of measurements
activity
	activity to which measurement was performed with the following values:
		WALKING
		WALKING_UPSTAIRS
		WALKING_DOWNSTAIRS
		SITTING
		STANDING
		LAYING

The range values for the following variables are bounded within [-1,1]

Mean of body acceleration frequency for each axis (XYZ)
	body.accel.fr.mean.X
	body.accel.fr.mean.Y
	body.accel.fr.mean.Z
	
Mean frequency of body acceleration for each axis (XYZ)
	body.accel.fr.meanFreq.X
	body.accel.fr.meanFreq.Y
	body.accel.fr.meanFreq.Z
	
Standard Deviation of body acceleration frequency for each axis (XYZ)
	body.accel.fr.std.X
	body.accel.fr.std.Y
	body.accel.fr.std.Z
	
Mean of body acceleration jerk frequency for each axis (XYZ)
	body.accel.jerk.fr.mean.X
	body.accel.jerk.fr.mean.Y
	body.accel.jerk.fr.mean.Z

Mean frequency of body acceleration jerk for each axis (XYZ)
	body.accel.jerk.fr.meanFreq.X
	body.accel.jerk.fr.meanFreq.Y
	body.accel.jerk.fr.meanFreq.Z

Body acceleration standard deviation for each axis (XYZ)
	body.accel.jerk.fr.std.X
	body.accel.jerk.fr.std.Y
	body.accel.jerk.fr.std.Z
	
Body acceleration jerk magnitude mean
	body.accel.jerk.mag.tm.mean

Body acceleration jerk magnitude standard deviation
	body.accel.jerk.mag.tm.std
	
Body acceleration jerk time mean for each axis (XYZ)		
	body.accel.jerk.tm.mean.X
	body.accel.jerk.tm.mean.Y
	body.accel.jerk.tm.mean.Z
	
Body acceleration jerk time standard deviation for each axis (XYZ)		
	body.accel.jerk.tm.std.X
	body.accel.jerk.tm.std.Y
	body.accel.jerk.tm.std.Z

	
Body acceleration magnitude frequency mean
	body.accel.mag.fr.mean

Mean frequency of Body acceleration magnitude
	body.accel.mag.fr.meanFreq
	
Body acceleration magnitude frequency standard deviation
	body.accel.mag.fr.std

Body acceleration magnitude time mean
	body.accel.mag.tm.mean
	
Body acceleration magnitude time standard deviation
	body.accel.mag.tm.std

Body acceleration time mean for each axis (XYZ)
	body.accel.tm.mean.X
	body.accel.tm.mean.Y
	body.accel.tm.mean.Z
	
Body acceleration time standard deviation for each axis (XYZ)
	body.accel.tm.std.X
	body.accel.tm.std.Y
	body.accel.tm.std.Z
	
Body gyroscope frequency mean for each axis (XYZ)
	body.gyro.fr.mean.X
	body.gyro.fr.mean.Y
	body.gyro.fr.mean.Z

Mean Frequency Body gyroscope for each axis (XYZ)
	body.gyro.fr.meanFreq.X
	body.gyro.fr.meanFreq.Y
	body.gyro.fr.meanFreq.Z
	
Body gyroscope frequency standard deviation for each axis (XYZ)
	body.gyro.fr.std.X
	body.gyro.fr.std.Y
	body.gyro.fr.std.Z
	
Body gyroscope jerk magnitude time mean
	body.gyro.jerk.mag.tm.mean

Body gyroscope jerk magnitude time standard deviation
	body.gyro.jerk.mag.tm.std
	
Body gyroscope jerk time mean for each axis (XYZ)
	body.gyro.jerk.tm.mean.X
	body.gyro.jerk.tm.mean.Y
	body.gyro.jerk.tm.mean.Z
	
Body gyroscope jerk time standard deviation for each axis (XYZ)
	body.gyro.jerk.tm.std.X
	body.gyro.jerk.tm.std.Y
	body.gyro.jerk.tm.std.Z
	
Body gyroscope magnitude time mean
	body.gyro.mag.tm.mean
	
Body gyroscope magnitude time standard deviation
	body.gyro.mag.tm.std
	
Body gyroscope time mean for each axis (XYZ)
	body.gyro.tm.mean.X
	body.gyro.tm.mean.Y
	body.gyro.tm.mean.Z
	
Body gyroscope time standard deviation for each axis (XYZ)
	body.gyro.tm.std.X
	body.gyro.tm.std.Y
	body.gyro.tm.std.Z
	
Gravity acceleration magnitude time mean
	grav.accel.mag.tm.mean

Gravity acceleration magnitude time standard deviation
	grav.accel.mag.tm.std
	
Gravity acceleration magnitude time mean for each axis (XYZ)
	grav.accel.tm.mean.X
	grav.accel.tm.mean.Y
	grav.accel.tm.mean.Z
	
Gravity acceleration magnitude time standard deviation for each axis (XYZ)
	grav.accel.tm.std.X
	grav.accel.tm.std.Y
	grav.accel.tm.std.Z

Variables Description for tidydataset
This dataset has the same variables as the global one, but this dataset is grouped by subject and activity.
"avg." prefix indicates that the values of variable are the calculated mean