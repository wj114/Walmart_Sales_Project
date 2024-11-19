# Walmart_Sales_Project

## Project Overview
This project showcases my work in developing a comprehensive data analysis pipeline to extract critical business insights from Walmart sales data. I utilized Python for data processing and analysis, SQL for advanced querying, and applied structured problem-solving techniques to address key business questions.

Through this project, I honed my skills in:

* Data Manipulation: Efficiently transforming and preparing raw data for analysis.
* SQL Querying: Writing advanced queries to extract meaningful insights.
* Pipeline Creation: Designing scalable workflows for seamless data analysis.

This project highlights my ability to tackle real-world data challenges and deliver actionable insights through analytical solutions.

## Project Steps
### 1. Set up Environment
  * Tools used: Visual Studio Code, Python, MySQL
  * Goal: Set up a well-organized workspace in VS Code and arrange project folders systematically to streamline development and data management.

### 2. Set up Kaggle API
* Kaggle API token in taken from [Kaggle](https://www.kaggle.com/) by navigating to profile settings and downloading the JSON file.
* The Kaggle is configured with the following:
  * a `.kaggle` file is created and the downloaded `kaggle.json` file is placed.

### 3. Download Walmart Sales Data
* **Data source:** Kaggle API is used to downlaod the Walmart sales data rom Kaggle.
* **Dataset link:** [Walmart Sales Data](https://www.kaggle.com/datasets/najir0123/walmart-10k-sales-datasets)
* **Data storage:** The data is saved in `data/` folder for easy access and reference.

### 4. Install Required Libraries and Load Data
* **Libraries:** Install necessary Python libraries using:
```
pip install pandas numpy sqlalchemy mysql
```
* **Loading data:** The data is read into Pandas Dataframe for initial analysis.

### 5. Data Exploration
* **Goal:** Initial exploration is conducted to understand data distribution, heck column names,types and he potential issues are identified.
* **Analysis:** The functions such as `.info()`, `.describe()`,`.head()` are used to have an overview of the data.

### 6. Data Cleaning
* **Remove Duplicates:** The duplicate entries are identified and removed to aoivd skewed results.
* **Handle missing values:** Rows and columns with missing value are removed if they are insignificant.
* **Fix Data Types:** All columns are ensured to have consistant data type (e.g., dates as datetime, prices as float).
* **Currency Formatting:** `.replace()` is used to handle and format currency value.
* **Validation:** The remaining inconsistecies are identified and fixed.

### 7. Feature Engineering
* **Create New Column:** The `total` is calculated for each transaction by multiplying `unit_price` by `quantity` and adding this as new column.

### 8. Load Data into MySQL
* **Set Up Connections:** MySQL is connected by using `sqlachemy`and load the clean data into database.
* **Table Creation:** Tables in MySQL are being set up using Python SQLAlchemy to automate table creation and data insertion.
* **Verification:** Initial SQL queries are executed to comfirm the data has been loaded successfully.

### 9. SQl Analysis: Complex Queries and Business Problem Solving
* Advanced SQl queries are developed and run to address key business insights, including:
  * Trends in revenue across different branches and product categories.
  * Determining the top-performing product categories.
  * Evaluating sales performance based on time, location, and payment methods.
  * Investigating peak sales periods and customer purchasing behaviors.
  * Analyzing profit margins by branch and product category.
 
### 10. Project Publication and Documentation
* **Documentation:** The entire process is being documented in a well-structured manner using Markdown or a Jupyter Notebook.
* **Project Publishing:** The completed project is being published on GitHub, including:
  * The `README.md`file (this document)
  * Jupyter Notebooks
  * SQL Queries
 
---
## Tools used
* Python 3.9.3
* MySQL
* Python Libraries: `pandas`,`sqlalchemy`,`pymsql`
* Kaggle API key (for downloading data)
***
## Results and Insights
The output and findings of this project including:
* **Sales Insight:** Highlighting top-performing categories, branches with the highest sales, and commonly used payment methods.
* **Profitability:** Analysis of the most profitable product categories and locations.
* **Customer Behaviour:** Examining trends in customer ratings, payment preferences, and peak shopping times.
