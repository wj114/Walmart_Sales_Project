SELECT * 
FROM walmart_project.walmart;

##Exploratory Data 
#a. Check the data whetehr is mnatched with the cleaned data
SELECT count(*)
FROM walmart_project.walmart;

#b. Check the payment method from dataset
SELECT distinct payment_method 
FROM walmart_project.walmart;

#c. Total transactions for eact payment method
SELECT payment_method, count(*) as total
FROM walmart_project.walmart
group by payment_method
order by total desc;

#d. Total number of bracnhes
SELECT count(distinct Branch)
FROM walmart_project.walmart;

#e. Maximum quantity
SELECT max(quantity)
FROM walmart_project.walmart;

#----------------------------
# Buisness Questions

#1. FInd the difference payment method and the number of transactions, number of quantity sold
SELECT payment_method, count(*) as total_transaction, sum(quantity) as total_quantity
FROM walmart_project.walmart
group by payment_method;

#2. Identify the Highest-Rated Category in Each Branch, displaying the bracnh, category, avg rating
with cte as 
(SELECT Branch, category, round((avg(rating)),3) as avg_rating,
	rank() over (partition by Branch order by avg(rating) desc) as rnk
FROM walmart_project.walmart
group by Branch, category)

select Branch, category, avg_rating
from cte
where rnk=1;

#3. Identify the busiest day on a week for each branch based on the number of transactions

with cte as
(SELECT Branch, dayname(str_to_date(date, '%d/%m/%Y'))as day_name, count(*) as total_transactions,
	rank()over(partition by Branch order by count(*) desc) as rnk
FROM walmart_project.walmart
group by Branch,day_name
order by 1,3 desc)

select Branch, day_name, total_transactions
from cte
where rnk=1;

#4. Determone the quantity sold per payment method. List paymeent method and total_quantity

SELECT payment_method, sum(quantity)
FROM walmart_project.walmart
group by payment_method;

#5. Determine the average, minimum, and maximum rating of products for each city. 
	#List the city, average_rating, min_rating anad max_rating
    
SELECT City, category, avg(rating) as avg_rating, max(rating) as max_rating, min(rating) as min_rating
FROM walmart_project.walmart
group by City,category;

#6. Calculate the total profit for each category by considering total_Profit as (unit_price * quantity * profit_margin)
	#List category and total_profit, orderd from highest to lowest profit.

SELECT category, sum(total) as total_revenue, sum(total * profit_margin) as total_profit
FROM walmart_project.walmart
group by category
order by total_profit desc;

#7. Determine the Most Common Payment Method per Branch
with cte as
(SELECT Branch, payment_method, count(*) as total,
	rank()over(partition by Branch order by count(*) desc) as rnk
FROM walmart_project.walmart
group by Branch, payment_method)

select Branch, payment_method, total
from cte
where rnk =1;


#8. How many transactions occur in each shift (Morning, Afternoon, Evening) across branches?
with cte as
(SELECT Branch, payment_method,time,
	case
		when time(time) between '06:00:00' and '11:59:59' then 'Morning'
        when time(time) between '12:00:00' and '17:59:59' then 'Afternoon'
		when time(time) between '18:00:00' and '23:59:59' then 'Evening'
        else 'Night'
	end as period
FROM walmart_project.walmart)

select Branch, period, count(payment_method)
from cte
group by Branch, period
order by Branch, period;

#9. Identify 5 branches with higest decrease ratio in revenue compared to the previous year (in the year 2023 and previous year 2022.
with cte2022 as
(SELECT Branch, year(str_to_date(date, '%d/%m/%Y')) as year_2022, round((sum(total)),3) as revenue_2022
FROM walmart_project.walmart
where year(str_to_date(date, '%d/%m/%Y'))='2022' 
group by Branch, year(str_to_date(date, '%d/%m/%Y'))
order by 1),

cte2023 as
(SELECT Branch, year(str_to_date(date, '%d/%m/%Y')) as year_2023, round((sum(total)),3) as revenue_2023
FROM walmart_project.walmart
where year(str_to_date(date, '%d/%m/%Y'))='2023' 
group by Branch, year(str_to_date(date, '%d/%m/%Y'))
order by 1)

select c1.Branch, c1.revenue_2022, c2.revenue_2023, round(((c2.revenue_2023-c1.revenue_2022)*100/c1.revenue_2022),3) as differene_ratio
from cte2022 c1
left join cte2023 c2
	on c1.Branch = c2.Branch
order by differene_ratio
limit 5
