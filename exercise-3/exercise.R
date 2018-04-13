# Exercise 3: working with built-in data sets

# Load R's "USPersonalExpenditure" dataset using the `data()` function
# This will produce a data frame called `USPersonalExpenditure`
data("USPersonalExpenditure")

# The variable `USPersonalExpenditure` is now accessible to you. Unfortunately,
# it's not a data frame (it's actually what is called a matrix)
# Test this using the `is.data.frame()` function
is.data.frame(USPersonalExpenditure)

# Luckily, you can pass the USPersonalExpenditure variable as an argument to the
# `data.frame()` function to convert it a data farm. Do this, storing the
# result in a new variable
Expense_DataFrame <- data.frame(USPersonalExpenditure)
View(Expense_DataFrame)

# What are the column names of your dataframe?
colnames(Expense_DataFrame)

## Consider: why are they so strange? Think about whether you could use a number 
## like 1940 with dollar notation!
#Placing the X before the years allows it to be read as a string

# What are the row names of your dataframe?
row.names(Expense_DataFrame)

# Add a column "category" to your data frame that contains the rownames
Expense_DataFrame$category <- rownames(Expense_DataFrame)
Expense_DataFrame

# How much money was spent on personal care in 1940?
Expense_DataFrame["Personal Care", "X1940"]

# How much money was spent on Food and Tobacco in 1960?
Expense_DataFrame["Food and Tobacco", "X1960"]

# What was the highest expenditure category in 1960?
Expense_DataFrame[Expense_DataFrame$X1960 == max(Expense_DataFrame$X1960) ,"category"]

# Define a function `lowest_category` that takes in a year as a parameter, and
# returns the lowest spending category of that year
lowest_category <- function(year){
  year_string <- paste0("X", year)
  Expense_DataFrame[Expense_DataFrame[[year_string]] == min(Expense_DataFrame
                                                [[year_string]]), "category"]
}

# Using your function, determine the lowest spending category of each year
# Hint: use the `sapply()` function to apply your function to a vector of years
years <- c(1940, 1945, 1950, 1955, 1960)
sapply(years, lowest_category)


