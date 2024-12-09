-- Trouver les clients qui ont passé des commandes pour des produits coûtant plus de 100 €.

SELECT 
    c.firstname,
    p.price
FROM customers AS c 
JOIN 
    orders AS o ON c.customerid = o.customerid
JOIN
    products AS p ON  o.productid = p.productid 
WHERE 
    p.price > 100