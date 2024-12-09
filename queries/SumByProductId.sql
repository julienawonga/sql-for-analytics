SELECT 
    productid,
    SUM(quantity)
FROM orders
GROUP BY productid