-- Top 10 customer per Total Sales
select top 10
	customerID,
	sum(Total_price) as [Total Price]
from Ecommerce
Group by customerID
order by [Total Price]desc

-- total revenue per Country
select
	Country,
	sum(total_price) AS [Total Revenue]
from Ecommerce
group by Country
order by [Total Revenue] desc

-- monthly Groth
with CTE as(
select
	Year,
	Month,
	sum(total_price) as revenue
from Ecommerce
group by Year, Month
)
select 
	Year,
	Month,
	revenue,
	lag(revenue)over(order by year , month asc) as [last month revenue]
	,(revenue-lag(revenue)over(order by year , month asc)) as [Groth value],
	(
    (revenue - LAG(revenue) OVER (ORDER BY Year, Month))
    * 100.0
    /
    NULLIF(LAG(revenue) OVER (ORDER BY Year, Month), 0)
) AS growth_percent
from CTE
order by Year, Month ;