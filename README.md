# Video Game Sales - EDA

## Exploratory Data Analysis: Video Game Sales

This project presents an **Exploratory Data Analysis (EDA)** on a dataset containing video game sales data up to the year 2016. The primary objective is to uncover insights into sales trends, platform and genre performance, and user versus critic perceptions.

---

## Project Overview

The dataset includes metadata about video game titles, such as:
- Platform
- Release year
- Genre
- Publisher
- Critic scores
- User scores
- Regional and global sales figures

This analysis is done using **R**, focusing on:
- Data cleaning
- Statistical summaries
- Visual insights
- Trend identification

---

## Objectives

- Clean and preprocess video game sales data  
- Explore relationships between sales, scores, and categories  
- Analyze platform and genre performance  
- Visualize release and sales trends over time  

---

## Dataset

**File**: `VGS_2016.csv`

Each record includes:
- `Name` – Game title
- `Platform` – Console/Platform
- `Year_of_Release` – Release year
- `Genre` – Game genre
- `Publisher` – Publishing company
- `Critic_Score` – Score by critics (Metacritic)
- `User_Score` – Score by users (Metacritic)
- `Rating` – ESRB rating
- `NA_Sales`, `EU_Sales`, `JP_Sales`, `Other_Sales`, `Global_Sales` – Sales (in millions)

---

## Tools & Libraries

The following R libraries were used:
- `dplyr` – Data manipulation  
- `tidyr` – Data tidying  
- `ggplot2` – Data visualization  
- `readr` – CSV import  
- `skimr` – Summary statistics  
- `janitor` – Data cleaning and validation  

---

## Data Cleaning Process

- Converted `Year_of_Release` to numeric and removed rows with missing values  
- Replaced `"tbd"` and blank strings in `User_Score` with `NA`, then converted to numeric  
- Removed entries with empty `Genre` values  
- Replaced missing `Rating` values with `"Not Rated"`  
- Filtered top genres and platforms for focused analysis  

---

## Visualizations

All visualizations were created using **ggplot2** and saved as PNGs in the `Plots/` folder.

1. **Distribution of Global Sales**  
2. **Distribution of Critic Scores**  
3. **Distribution of User Scores**  
4. **Relationship Between Critic and User Scores**  
5. **Global Sales by Genre**  
6. **Global Sales by Platform**  
7. **Number of Game Releases Over Time by Top Platforms**  
8. **Global Sales Over Time by Top Genres**  

---

## Key Insights

- Global sales are **right-skewed**, with a few games generating massive revenue  
- **Action** and **Shooter** genres dominate in total global sales  
- **Critic scores** follow a near-normal distribution, while **user scores** are left-skewed  
- A **positive correlation** exists between critic and user scores  
- Game **releases peaked between 2005–2010**, especially for top platforms  

---

## How to Use

1. Clone or download the repository
2. Ensure the dataset `VGS_2016.csv` is in your working directory
3. Run the R script `game.R` to reproduce all plots and analysis

---

## Folder Structure

```
video-game-sales-eda/
├── VGS_2016.csv               # Dataset
├── EDA_script.R               # R analysis script
├── README.md                  # Project documentation
├── Plots/                     # Folder containing exported PNG plots
│   ├── 1Distribution_of_global_sales.png
│   ├── 2Distirbution_of_critic_score.png
│   ├── ...
```

---

## Credits

- Data Source: [Kaggle Video Game Sales Dataset](https://www.kaggle.com/datasets/gregorut/videogame-sales-with-ratings)
- Analysis and Visualization: *Sanjay Kumar*



