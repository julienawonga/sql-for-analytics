-- Utiliser un CTE pour afficher les produits ayant été commandés plus de 10 fois.

WITH Order_CTE AS (
    SELECT 
        o.productid,
        COUNT(1) AS TotalOrders
    FROM orders AS o
    GROUP BY productid
)
SELECT 
    ProductId,
    TotalOrders
FROM Order_CTE
WHERE TotalOrders > 10