WITH Sales AS(
    SELECT 
        o.productid,
        o.quantity,
        p.price,
        (o.quantity * p.price) AS total_cost
    FROM orders AS o
    JOIN products AS p ON o.productid = p.productid JOIN employees AS e ON o.salespersonid = e.employeeid 
) 

    SELECT
        productid,
        total_cost,
        SUM(total_cost) OVER(PARTITION BY productid) AS TotalSumByProducts
    FROM Sales