-- Afficher les informations des commandes (produit, client, commercial) avec leurs détails.
SELECT
    c.firstname AS customer_firstname,
    o.orderstatus,
    p.Product,
    p.category,
    p.price,
    o.quantity,
    o.billaddress,
    c.country,
    e.firstname AS salesperson_firstname,
    e.department
FROM orders AS o
JOIN 
    products AS p ON o.productid = p.productid
JOIN 
    customers AS c ON o.customerid = c.customerid
JOIN 
    employees AS e ON o.salespersonid = e.employeeid