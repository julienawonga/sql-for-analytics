-- Compter le nombre total de commandes pour chaque statut (OrderStatus).
SELECT
    orderstatus,
    COUNT(*) AS num_orders
FROM orders
GROUP BY orderstatus