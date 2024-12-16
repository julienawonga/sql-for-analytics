-- Lister les clients ayant passé une commande après leur première commande.

SELECT 
    c.firstname,
    c.lastname
FROM 
    customers c 
WHERE c.customerid IN (
    SELECT
        customerid
    FROM orders
    GROUP BY customerid
    HAVING COUNT(1) >= 2
)

SELECT 
    c.FirstName,
    c.LastName
FROM 
    Customers AS c
JOIN 
    (
        SELECT 
            o.CustomerID
        FROM 
            Orders AS o
        GROUP BY 
            o.CustomerID
        HAVING 
            COUNT(o.OrderID) >= 2
    ) AS subquery ON c.CustomerID = subquery.CustomerID;
