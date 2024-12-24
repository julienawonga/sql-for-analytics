-- Calculer la date de la première commande pour chaque client.
WITH ranked_orders  AS (
    SELECT
        customerid,
        quantity,
        orderstatus,
        orderdate,
        RANK() OVER(PARTITION BY customerid ORDER BY orderdate ASC) AS rk
    FROM
        orders
)
SELECT
    c.firstname,
    c.lastname,
    c.score,
    c.country,
    r.quantity,
    r.orderstatus,
    r.orderdate AS first_order_date
FROM 
    ranked_orders AS r
JOIN 
    customers c
ON 
    r.customerid = c.customerid
WHERE 
    rk=1


SELECT 
    c.firstname,
    MIN(o.orderdate) AS first_order_date
FROM 
    customers c
JOIN 
    orders o 
ON 
    c.customerid = o.customerid
GROUP BY 
    c.firstname;
