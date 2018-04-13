# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"
employees <- c(paste("Employee", 1:100, sep = " "))

# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000
salaries17 <- c(round(runif(100, min = 40000, max = 50000), digits = 2))

# Create a vector of 100 salaries in 2018 that have changed from 2017
# Use `runif()` to add a random number between -5000 and 10000 to each of 2017's
# salaries (the negative number means that a salary may have decreased!)
salaries18 <- c(salaries17 + round(runif(100, min = -500, max = 10000), digits = 2))

# Create a data frame 'salaries' by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries <- data.frame(employees, salaries17, salaries18, stringsAsFactors = FALSE)
View(salaries)

# Create a column 'change' that stores each person's change in salary between
# 2017 and 2018
salaries$change <- (salaries18 - salaries17)

# Create a column 'got_raise' that is TRUE if the person got a raise (their
# salary went up)
salaries$got_raise <- ifelse(salaries$change > 1, TRUE, FALSE)
View(salaries)

### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2018 salary of employee 57
salaries[5,3]

# How many employees got a raise?
sum(salaries$got_raise == TRUE)

# What was the dollar value of the highest raise?
max(salaries$change)

# What was the "name" of the employee who received the highest raise?
salaries[salaries$change == max(salaries$change), ]

# What was the largest decrease in salaries between the two years?
min(salaries$change)
 
# What was the name of the employee who recieved largest decrease in salary?
salaries[salaries$change == min(salaries$change), ]


# What was the average salary change?
mean(salaries$change)

# For people who did not get a raise, how much money did they lose on average?


## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?

# Write a .csv file of your salary data to your working directory
write.csv(salaries, file = "MyData.csv")
