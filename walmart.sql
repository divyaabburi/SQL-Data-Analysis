create database if not exists walmartsales;

create table if not exists sales(
invoice_id varchar(30) not null primary key,
branch varchar(5) not null,
city varchar(30) not null,
customer_type varchar(30) not null,
gender varchar(10) not null,
product_line varchar(100) not null,
unit_price decimal(10,2) not null,
quantity int not null,
vat float(6,4) not null,
total decimal(12,4) not null,
date Datetime not null,
time TIME not null,
payment_method varchar(15) not null,
cogs decimal(10,2) not null,
gross_margin_pct float(11,9),
gross_income decimal(12,4) not null,
rating float(2,1)
);



### Feature Engineering ###########


##1.Creating a new column naming time_of_date



SELECT time,
    CASE 
        WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN time BETWEEN '12:00:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_date
FROM sales;

alter table sales add column time_of_day varchar(20);

UPDATE sales
SET time_of_day = 
    CASE 
        WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN time BETWEEN '12:00:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END;

#### 2. ADD a new day column

Select date, dayname(date) as day_name from sales;

alter table sales add column day_name varchar(10);

update sales
set day_name=dayname(date);

####3.Add a new column month name

Select date, monthname(date) as month_name from sales;

alter table sales add column month_name varchar(10);

update sales
set month_name=monthname(date);


#### Exploratory Data Analysis  ###
## select unique cities from sales table
select distinct(city) from sales;

### In which city each branch is
select distinct branch,city from sales;

#### Product ###

# how many unique product lines does the data have
select distinct product_line from sales;

## what is the most common payment method

select payment_method, count(payment_method) as cnt from sales group by payment_method order by cnt desc;

### what is the most selling product line ###

select product_line, count(product_line) as cnt from sales group by product_line order by cnt desc;


### what is the total revenue by month?

select sum(total) as total_revenue, month_name as month from sales group by month_name order by total_revenue desc;


### what month has highest cogs cost

select max(cogs) as hcc, month_name from sales group by month_name order by hcc desc;

### what product_line has largest revenue

SELECT product_line, SUM(total) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;

### what is the city that has largest revenue

select city,branch, sum(total) as revenue from sales group by city,branch order by revenue desc;


#### Product line has largest Vat

select product_line, avg(vat) as v from sales group by product_line order by v desc;

### which branch sold most products than average sales

select branch, sum(quantity) as qty from sales group by branch having sum(quantity)>avg(quantity) order by qty;


### most common product_line by gender

select product_line, count(gender) as total_cnt, gender from sales group by product_line, gender order by total_cnt desc ;

### select average rating of each product line

select product_line, round(avg(rating),2) as r from sales group by product_line order by r desc;


#####  Sales ########
# 1. Number of sales made in each time of the day per week day

select time_of_day , count(*) as total_sales,day_name from sales group by time_of_day,day_name order by FIELD(day_name, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'), time_of_day ;



### which of the customer types brings the most revenue

select customer_type, sum(total) as total_revenue from sales group by customer_type order by total_revenue desc;


### Which city has largest tax percent(vat)

select city, round(avg(vat),2) as vat from sales group by city order by vat desc; 


### which customer types pays the most vat

select customer_type , round(avg(vat),2) as vat from sales group by customer_type order by vat  desc;


###### Customer #########

# How many unique customers

select distinct(customer_type) from sales;


## Unique payments methods 

select distinct(payment_method) from sales;

### what is most common customer type

select count(customer_type) as c,customer_type from sales group by customer_type order by c desc;


## which customer_type buys the most

select count(*) as c,customer_type from sales group by customer_type order by c desc;

## what is the gender of most common customers

select count(customer_type) as c, gender, customer_type from sales group by customer_type,gender order by c desc;


## what is the gender distribution for the branch


SELECT branch, gender, COUNT(*) AS gender_count
FROM sales
GROUP BY branch, gender order by gender_count,branch desc;


### which time of the day do customers give more ratings


select time_of_day, round(avg(rating),2) as r from sales group by time_of_day order by r desc;

### which time of the day do customers give ratings for branch

select time_of_day, round(avg(rating),2) as r,branch from sales group by time_of_day,branch order by r desc;


### which day of the week has best avg ratings

select day_name, round(avg(rating),2) as r from sales group by day_name order by day_name;


 #### which day of the week has best avg ratings per branch
 
 select day_name, round(avg(rating),2) as r,branch from sales group by day_name,branch order by r desc;