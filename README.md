# r-programming-assignments
Connor Inglima
LIS4317
Repository for R Programming Assignments

# Assignment #3: Analyzing 2016 data “Poll” Data in R
# Blog Link: https://connorrjournal.blogspot.com/2025/09/assignment-3-analyzing-2016-data-poll.html
#
Name <- c("Jeb", "Donald", "Ted", "Marco", "Carly", "Hillary", "Bernie")

ABC_poll <- c(4, 62, 51, 21, 2, 14, 15)

CBS_poll <- c(12, 75, 43, 19, 1, 21, 19)

df_polls <- data.frame(Name, ABC_poll, CBS_poll)

str(df_polls)
head(df_polls)

mean(df_polls$ABC_poll)
median(df_polls$CBS_poll)
range(df_polls[, c("ABC_poll","CBS_poll")])

df_polls$Diff <- df_polls$CBS_poll - df_polls$ABC_poll

ggplot(df_polls, aes(x = Name, y = Diff)) +
  geom_col(fill = "lightblue") +
  labs(title = "CBS vs ABC",
       y = "CBS - ABC",
       x = "Candidate") +
  theme_minimal()
