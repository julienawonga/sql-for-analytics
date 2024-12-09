-- Trouver les produits dont le prix est supérieur à la moyenne.
SELECT
    *
FROM products,  (
    SELECT 
        AVG(price) AS avg_price
    FROM products
    )
WHERE price > avg_price