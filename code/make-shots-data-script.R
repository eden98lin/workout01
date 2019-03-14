#---
#title: shot data
#description: create a csv data file that contain the required variables to be used in the visualization phase
#input(s): csv files downloaded from course github
#output(s): csv and txt files that contain data that will be used in next phase
#---

library(dplyr)

# Read in data set and add a column name to each imported data frame, that contains the name of the corresponding player
iguodala <- read.csv('../data/andre-iguodala.csv', stringsAsFactors = FALSE)
iguodala <- mutate(iguodala, name = 'Andre Iguodala')
green <- read.csv('../data/draymond-green.csv', stringsAsFactors = FALSE)
green <- mutate(green, name = 'Draymond Green')
durant <- read.csv('../data/kevin-durant.csv', stringsAsFactors = FALSE)
durant <- mutate(durant, name = 'Kevin Durant')
thompson <- read.csv('../data/klay-thompson.csv', stringsAsFactors = FALSE)
thompson <- mutate(thompson, name = 'Klay Thompson')
curry <- read.csv('../data/stephen-curry.csv', stringsAsFactors = FALSE)
curry <- mutate(curry, name = 'Stephen Curry')

# Change the original values of shot_made_flag
iguodala$shot_made_flag[shot_made_flag == 'n'] <- 'shot_no'
iguodala$shot_made_flag[shot_made_flag == 'y'] <- 'shot_yes'
green$shot_made_flag[shot_made_flag == 'n'] <- 'shot_no'
green$shot_made_flag[shot_made_flag == 'y'] <- 'shot_yes'
durant$shot_made_flag[shot_made_flag == 'n'] <- 'shot_no'
durant$shot_made_flag[shot_made_flag == 'y'] <- 'shot_yes'
thompson$shot_made_flag[shot_made_flag == 'n'] <- 'shot_no'
thompson$shot_made_flag[shot_made_flag == 'y'] <- 'shot_yes'
curry$shot_made_flag[shot_made_flag == 'n'] <- 'shot_no'
curry$shot_made_flag[shot_made_flag == 'y'] <- 'shot_yes'

# Add a column minute that contains the minute number where a shot occurred.
iguodala <- mutate(iguodala, minute = 12 * iguodala$period - iguodala$minutes_remaining)
green <- mutate(green, minute = 12 * green$period - green$minutes_remaining)
durant <- mutate(durant, minute = 12 * durant$period - durant$minutes_remaining)
thompson <- mutate(thompson, minute = 12 * thompson$period - thompson$minutes_remaining)
curry <- mutate(curry, minute = 12 * curry$period - curry$minutes_remaining)

# Use sink() to send the summary() output of each imported data frame into indiciduals text files
sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()
sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()
sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()
sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()
sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()

# Stack the tables into one single data frame
df <- rbind(iguodala, green, durant, thompson, curry)

# Export the assembled table as a CSV file shots-data.csv inside the folder data/. Use relative path
write.csv(
  x = df,
  file = '../data/shots-data.csv'
)

# Use sink() to send the summary() output of the assembled table. Send this output to a text file named shots-data-summary.txt inside the output/ folder
sink(file = '../output/shots-data-summary.txt')
summary(df)
sink()