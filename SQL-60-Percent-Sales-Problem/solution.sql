-- transactions table
Select * from transactions;
	
select *, (sum(amount) over(order by order_id)) as running_total from transactions;

-- Generally, we use SUM(amount) to find the total, but I needed to calculate 
-- the running percentage, so I used a window function.
select sum(amount) over() as total from transactions;

-- running_percentage per day
select *, ((sum(amount) over(order by order_id))/sum(amount) over())*100 as running_percentage from transactions

--Problem statment: Given a month’s transaction data, 
--determine the exact date when cumulative sales first exceed 60% of the total monthly sales.

with cte as (
	select *, ((sum(amount) over(order by order_id))/sum(amount) over())*100 as running_percentage from transactions
)
select transaction_date from cte where running_percentage >= 60 limit 1