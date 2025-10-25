# California Test Score Data
install.packages("AER")
library(AER)
data("CASchools", package = "AER")
head(CASchools)

# Task 1: Base R Graphics
# Scatterplot
plot(CASchools$expenditure, CASchools$testscr,
     main = "Test Score vs. Expenditure",
     xlab = "Expenditure per Student ($)",
     ylab = "Average Test Score",
     col  = "black",
     pch  = 19)

# Histogram: Distribution of Number of Teachers
hist(CASchools$teachers,
     main = "Histogram of Number of Teachers",
     xlab = "Number of Teachers",
     col  = "grey",
     border = "black")

# Task 2: Lattice Graphics
library(lattice)
CASchools$str <- CASchools$students / CASchools$teachers

# Boxplot: Student-Teacher Ratio by Grades
bwplot(str ~ grades,
       data = CASchools,
       main = "Student-Teacher Ratio by Grades",
       xlab = "Grades",
       ylab = "Student-Teacher Ratio",
       col = "black")

# Task 3: ggplot2
library(ggplot2)

# Histogram of average math scores
ggplot(CASchools, aes(x = math)) +
  geom_histogram(binwidth = 20, fill = "grey", color = "black") +
  labs(title = "Distribution of Math Scores",
       x = "Math Score",
       y = "Count") +
  theme_minimal()
