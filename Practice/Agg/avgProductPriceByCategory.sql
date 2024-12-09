--Trouver le prix moyen des produits par catégorie.

SELECT 
    category,
    AVG(price) AS avg_price
FROM products
GROUP BY category