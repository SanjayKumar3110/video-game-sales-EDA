#EDA project: video game sales Data

#load libraries
install.packages(c("dplyr", "tidyr", "ggplot2", "readr", "skimr", "janitor"))
library(dplyr)
library(tidyr)
library(ggplot2)
library(readr)
library(skimr)
library(janitor)

#setup working directory
setwd("C:\\Users\\user\\OneDrive\\Desktop\\projects\\EDAR")
getwd()

#Load the Data
vgs_data <-read.csv("VGS_2016.csv")

head(vgs_data)
tail(vgs_data)
str(vgs_data)
glimpse(vgs_data)
summary(vgs_data)

#data cleaning process
#convert year of release to numeric

unique(vgs_data$Year_of_Release)
vgs_data$Year_of_Release <- as.numeric(vgs_data$Year_of_Release)
str(vgs_data$Year_of_Release)
summary(vgs_data$Year_of_Release)

#Remove Rows with NA in Year_of_Release

sum(is.na(vgs_data$Year_of_Release))
vgs_data <- vgs_data %>% filter(!is.na(Year_of_Release))
nrow(vgs_data)
sum(is.na(vgs_data$Year_of_Release))

#inspect and clean User_Score

unique(vgs_data$User_Score)
vgs_data$User_Score[vgs_data$User_Score == ""] <- NA
vgs_data$User_Score[vgs_data$User_Score == "tbd"] <- NA
vgs_data$User_Score <- as.numeric(vgs_data$User_Score)
str(vgs_data$User_Score)
summary(vgs_data$User_Score)

# Explore Platform
unique(vgs_data$Platform)
table(vgs_data$Platform)

# Explore Genre
unique(vgs_data$Genre)
table(vgs_data$Genre)
sum(vgs_data$Genre == "")
vgs_data <- vgs_data %>% filter(Genre != "")
nrow(vgs_data)
sum(vgs_data$Genre == "")

# Explore Publisher (showing top 20 due to potentially many publishers)
top_publishers <- vgs_data %>%
  group_by(Publisher) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) %>%
  top_n(20, count)
print(top_publishers)

# Explore Rating
unique(vgs_data$Rating)
table(vgs_data$Rating)
vgs_data$Rating[vgs_data$Rating == ""] <- "Not Rated"
table(vgs_data$Rating)

#data analysis process and visualization 

#Right skew
ggplot(vgs_data, aes(x = Global_Sales)) +
  geom_histogram(binwidth = 1, fill = "steelblue", color = "black") + 
  labs(title = "Distribution of Global Sales", 
       x = "Global Sales (in millions)",
       y = "Frequency")

# Univariate analysis 
# distribution of user score = left skew and critic score = normal distibution

ggplot(vgs_data, aes(x = Critic_Score)) +
  geom_histogram(binwidth = 5, fill = "lightcoral", color = "black", na.rm = TRUE) +
  labs(title = "Distribution of Critic Scores",
       x = "Critic Score (Metacritic)",
       y = "Frequency")

ggplot(vgs_data, aes(x = User_Score)) +
  geom_histogram(binwidth = 0.5, fill = "lightgreen", color = "black", na.rm = TRUE) +
  labs(title  = "Distribution of User_Score",
       x = "User Score(Metacritic)",
       y = "Frequency")

#relationship between critic score and user score
# positive correlation
ggplot(vgs_data, aes(x = Critic_Score, y = User_Score)) +
  geom_point(alpha = 0.5) +
  labs(title = "Relationship between Critic Score and User Score",
       x = "Critic Score (Metacritic)",
       y = "User Score (Metacritic)")

#global sales by genre

ggplot(vgs_data, aes(x = Genre, y = Global_Sales, fill = Genre)) +
  geom_boxplot() + 
  labs(title = "Global sales by genre",
       x = "Genre",
       y = "Global sales(in millions)",
       fill = "Genre") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#global sales across platform

ggplot(vgs_data, aes(x = Platform, y = Global_Sales, fill = Platform)) +
  geom_boxplot() +
  labs(title = "Global Sales by Platform",
       x = "Platform",
       y = "Global Sales (in millions)",
       fill = "Platform") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 8),
        legend.position = "none")

#number of releases per platform over time

top_platforms <- names(sort(table(vgs_data$Platform), decreasing = TRUE)[1:5])

platform_yearly_counts <- vgs_data %>% 
  filter(Platform %in% top_platforms) %>%
  group_by(Year_of_Release, Platform) %>%
  summarise(n = n(), .groups = 'drop')

ggplot(platform_yearly_counts, aes(x = Year_of_Release, y = n, color = Platform)) +
  geom_line() +
  labs(title = "Number of game releases per top platform over time",
       x = "year of release",
       y = "Number of releases",
       color = "Platform")

#Global Sales per Top Genre Over Time

top_genres <- names(sort(table(vgs_data$Genre), decreasing = TRUE)[1:5])

genre_yearly_sales <- vgs_data %>%
  filter(Genre %in% top_genres) %>%
  group_by(Year_of_Release, Genre) %>%
  summarise(Total_Global_Sales = sum(Global_Sales, na.rm = TRUE), .groups = 'drop')

ggplot(genre_yearly_sales, aes(x = Year_of_Release, y = Total_Global_Sales, color = Genre)) +
  geom_line() +
  labs(title = "Total Global Sales per Top Genre Over Time",
       x = "Year of Release",
       y = "Total Global Sales (in millions)",
       color = "Genre")















