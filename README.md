# Walmart Sales Data Analysis

This repository contains SQL queries and analysis conducted on sales data from Walmart. The database includes information on sales transactions, customer demographics, product lines, and more.

## Database Schema

The database schema consists of the following tables:

- `sales`: Contains information about sales transactions, including invoice ID, branch, city, customer type, product line, unit price, quantity, VAT, total, date, time, payment method, COGS, gross margin percentage, gross income, and rating.

## Feature Engineering

- `time_of_day`: A new column indicating the time of day (Morning, Afternoon, or Evening) based on the `time` column.
- `day_name`: A new column indicating the day of the week based on the `date` column.
- `month_name`: A new column indicating the month based on the `date` column.

## Exploratory Data Analysis (EDA)

The following analyses were performed:

- Unique cities in the dataset.
- City associated with each branch.
- Unique product lines.
- Most common payment method.
- Most selling product lines.
- Total revenue by month.
- Month with the highest COGS cost.
- Product line with the largest revenue.
- City with the largest revenue.
- Product line with the largest VAT.
- Branch with the most products sold above average.
- Most common product lines by gender.
- Average rating of each product line.
- Number of sales made in each time of the day per week day.
- Customer type bringing the most revenue.
- City with the largest VAT.
- Customer types paying the most VAT.
- Unique customer types.
- Unique payment methods.
- Most common customer type.
- Customer type with the highest number of purchases.
- Gender of the most common customers.
- Gender distribution for each branch.
- Time of day with the highest average ratings.
- Time of day with the highest average ratings for each branch.
- Day of the week with the best average ratings.
- Day of the week with the best average ratings for each branch.

## Usage

1. Clone this repository:

   ```bash
   git clone https://github.com/divyaabburi/SQL-Data-Analysis.git

2. Explore the SQL queries in the walmart.sql file to understand the analyses conducted.

   
## Contributing
Contributions are welcome! If you have suggestions for additional analyses or improvements to the existing ones, feel free to open an issue or create a pull request.
