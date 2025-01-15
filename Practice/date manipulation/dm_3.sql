-- Calculer la durée moyenne entre la date de commande et la date d'expédition pour les commandes livrées.

SELECT 

    AVG(ShipDate - OrderDate) AS AvgShipDey
    
FROM
    Orders
