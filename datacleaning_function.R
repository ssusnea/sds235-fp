library(tidyverse)
library(readxl)

# test to see how these excel sheets behave. 
animal_data <- read_excel("FoodImports.xlsx", sheet = "Animals")
beverages_data <- read_excel("FoodImports.xlsx", sheet = "Beverages")


# what if we create a vector of the names, iterate over that, and then write a function that will import the data, clean it, and then return the individual data frames 
sheets <- c("Animals", "Beverages", "Cocoa", "Coffee", "Dairy", "Fish", "Fruits", "Grains", "Meats", "Nuts", "Other", "Sweets", "Vegetables", "VegOils")


# define function 
read_file <- function(sheet_name){
  
  # read in the data 
  data <- read_excel("FoodImports.xlsx", sheet = sheet_name)
  
  # removed all the rows with NA is `...5` so that get's rid of all of that, 
  # but i still want to turn this into tidy data
  experiment <- split(data, is.na(data$`...5`))
  
  sorted <- experiment$`FALSE`
  
  sorted <- sorted |> 
    select(-`...2`)
  
  # years <- sorted[1, 5:]
  print(years)
  
  # or perhaps we need to split into mini little data frames and then clean and then rbind accordingly 
  
  return(experiment$`FALSE`)
}

debug(read_file)
undebug(read_file)

trial <- read_file("Animals")
# this returns a list that we can subset out from. this could work??? 
test <- purrr::map(.f = read_file, sheets)


# cindy thought about writing an if else statement where the row below gets populated with the same thing as what's above


