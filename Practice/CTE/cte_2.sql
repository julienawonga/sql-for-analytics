-- Créer un CTE pour calculer les revenus générés par chaque produit, puis afficher les 5 produits les plus rentables.

WITH product_revenus AS (
    SELECT
        p.product AS product, 
        SUM(p.price * o.quantity) AS revenu
    FROM 
        orders AS o
    JOIN 
        products AS p
    ON 
        o.productid = p.productid
    GROUP BY 
        p.productid, product
)
SELECT 
    product,
    revenu
FROM
    product_revenus
ORDER BY 
    revenu DESC    
LIMIT 5