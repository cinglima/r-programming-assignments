# Task 1: Import Assignment 6 Data
student6 <- read.csv(file.choose(), header = TRUE, stringsAsFactors = FALSE)
head(student6)
str(student6)

# Load plyr and compute the mean of Grade by Sex
library(plyr)

gender_mean <- ddply(
  student6,
  "Sex",
  summarise,
  GradeAverage = mean(Grade, na.rm = TRUE)
)
# Print gender_mean
gender_mean

# Write the grouped means to a text file
write.table(
  gender_mean,
  file = "gender_mean.txt",
  sep  = "\t",
  row.names = FALSE
)

# Task 2: Filter Names Containing “i”
i_students <- subset(
  student6,
  grepl("i", Name, ignore.case = TRUE)
)

# Extract just the names and write them to a CSV:
write.csv(
  i_students$Name,
  file      = "i_students.csv",
  row.names = FALSE,
  quote     = FALSE
)

# Task 3: Export Filtered Dataset
write.csv(
  i_students,
  file      = "i_students_full.csv",
  row.names = FALSE
)


