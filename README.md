Here is described list of steps, performed in order to get tidy dataset, as result of instructions from Coursera Getting and Cleaning Course Project:

1. First part of the script is aimed to connect all needed libraries to be able to run this script.

2. List of commands to achive step number 1: created new columns "subject" and "activity" in train and test datasets. Both datasets are united to new xdata dataset, by using commant rbind. At the last, new column names were added.

3. List of commands to achive step number 2: extracted only measurements, which are ralated to mean and standard deviation, using grepl commang and appropriate regular expression.

4. List of commands to achive step number 3: codes of activity types are read into variable actnames. Then this dataframe is merged with xdata by specified columns, therefore new columns with activity names appeared in xdata dataset.

5. List of commands to achive step number 4: renaming of columns: t -> Time, f -> Frequency, and remained only letters.

6. List of commands to achive step number 5: split dataset into groups per each activity and subject, using group_by command. Run function mean, over each variable in splitted groups of dataset. And finally write dataset into file.
