
---

### CodeBook.md
```markdown
# Code Book

This CodeBook describes the variables, data, and transformations used to clean the Human Activity Recognition Using Smartphones Dataset.

---

## Source Data
The original dataset was downloaded from:  
[UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

It contains recordings from accelerometer and gyroscope sensors from Samsung Galaxy S smartphones, collected from 30 volunteers performing six activities.

---

## Variables
- **subject**: Integer. Identifies the volunteer (range: 1–30).
- **activity**: Factor. The type of activity performed:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING

- **feature variables**: Numeric. Mean values of sensor signals. Examples:
  - timeBodyAccelerometer_mean_X
  - timeBodyAccelerometer_mean_Y
  - timeBodyAccelerometer_std_Z
  - frequencyBodyGyroscope_mean_X
  - frequencyBodyGyroscope_std_Y  
  (etc.)

Only variables containing `mean()` or `std()` from the original dataset were kept.

---

## Transformations
1. Training and test datasets were merged into one dataset.
2. Measurements of mean and standard deviation were extracted.
3. Activity codes were replaced with descriptive activity names.
4. Variable names were cleaned:
   - Prefix `t` replaced with `time`
   - Prefix `f` replaced with `frequency`
   - Abbreviations expanded (e.g., `Acc` → `Accelerometer`, `Gyro` → `Gyroscope`)
   - Parentheses and dashes removed
5. A second tidy dataset was created with the average of each variable grouped by subject and activity.

---

## Output
- **tidyData.txt**: Contains 180 rows (30 subjects × 6 activities) and 68 columns (subject, activity, and 66 averaged feature variables).
