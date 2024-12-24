-- Rechercher les produits dont le nom contient le mot "Pro".


-- Postgres Only
SELECT 
    product
FROM 
    products
WHERE
    product ILIKE '%Pro%'


SELECT 
    product
FROM 
    products
WHERE 
    LOWER(product) LIKE '%pro%';
