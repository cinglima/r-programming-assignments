# 1. Download Data

data("mtcars")
head(mtcars)
str(mtcars)

# 2. Test Generic Functions

print(mtcars)        
summary(mtcars)

# 3. Explore S3 vs. S4

# S3
s3_obj <- list(name = "Connor", age = 21, GPA = 3.5)
class(s3_obj) <- "student_s3"
print(s3_obj)

# S4
setClass("student_s4",
         slots = c(name = "character", age = "numeric", GPA = "numeric"))
s4_obj <- new("student_s4", name = "Connor", age = 21, GPA = 3.5)
s4_obj
