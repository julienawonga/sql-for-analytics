SELECT 
        e.firstname,
        o.productid,
        o.quantity,
        p.price,
        (o.quantity * p.price) AS total_cost
    FROM orders AS o
    JOIN products AS p ON o.productid = p.productid 
    JOIN employees AS e ON o.salespersonid = e.employeeid 
