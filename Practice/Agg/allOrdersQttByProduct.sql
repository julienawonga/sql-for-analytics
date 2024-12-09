--Calculer la somme totale des quantités commandées pour chaque produit.
SELECT
    productid,
    SUM(quantity) as qtt
FROM orders
GROUP BY productid