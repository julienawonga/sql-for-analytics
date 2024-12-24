-- Calculer le total cumulé (running total) des quantités commandées pour chaque client

SELECT 
    c.customerid,
    c.firstname,
    c.lastname,
    o.productid,
    o.quantity,
    SUM(o.quantity) OVER(PARTITION BY c.customerid ORDER BY o.orderdate) AS runing_total
FROM 
    orders AS o
JOIN
    customers AS c
ON
    o.customerid = c.customerid