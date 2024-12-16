-- Active: 1734096921923@@127.0.0.1@5432@analytics@public
-- Trouver les produits qui n'ont jamais été commandés.
SELECT 
   p.product
FROM (
    SELECT * 
    FROM products AS p
    LEFT JOIN orders AS o 
    ON p.productid = o.productid
    WHERE o.productid IS NULL
) 