-- Sample data explanation:
-- Category 1 has 3 products, and one of them has a negative P&L.
-- Category 2 has 2 products, but neither has a negative P&L.
-- Category 3 has 3 products, and one has a negative P&L.
-- Category 4 has only 1 product, so it does not meet the condition of having at least 2 products.

select * from product_performance;

-- Find the categoryid that meets the following conditions:

-- The category has at least 2 products.
-- At least one product within that category has a negative P&L.


select categoryid from product_performance
group by categoryid
having count(distinct productid) > 1
and sum(case when pnl < 0  then 1 else 0 end) > 0





SELECT DISTINCT p1.categoryid
FROM product_performance p1
JOIN (
    SELECT categoryid
    FROM product_performance
    GROUP BY categoryid
    HAVING COUNT(DISTINCT productid) >= 2
) p2 ON p1.categoryid = p2.categoryid
WHERE p1.pnl < 0;


-- First approach:
-- Step 1: Identify categories that have more than one unique product.

SELECT categoryid
    FROM product_performance
    GROUP BY categoryid
    HAVING COUNT(DISTINCT productid) > 1
	
	
	
	
-- Step 2: Join the result with the product_performance table.

with cte as (
	SELECT categoryid
    FROM product_performance
    GROUP BY categoryid
    HAVING COUNT(DISTINCT productid) > 1
)

select * from product_performance as p1 
join cte 
on p1.categoryid = cte.categoryid	


-- Step 3: Apply a WHERE clause to filter for categories with at least one product having a negative P&L.

with cte as (
	SELECT categoryid
    FROM product_performance
    GROUP BY categoryid
    HAVING COUNT(DISTINCT productid) > 1
)
select DISTINCT p1.categoryid from product_performance as p1 
join cte 
on p1.categoryid = cte.categoryid
where p1.pnl < 0






-- Approach 2: A more efficient and straightforward method without using a JOIN.
-- I didn’t use this approach during the interview, but I came up with this solution later when reflecting on it:
-- 1. This method is more concise and avoids using joins.
-- 2. It directly groups by category and applies filtering in a single query.

select categoryid from product_performance
group by categoryid
having count(distinct productid) > 1
and sum(case when pnl < 0  then 1 else 0 end) > 0
