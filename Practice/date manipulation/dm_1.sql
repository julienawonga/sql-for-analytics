-- Trouver toutes les commandes qui ont été expédiées plus de 7 jours après leur création
SELECT
    OrderID,
    ProductID,
    CustomerID,
    SalesPersonID,
    OrderDate,
    ShipDate,
    (ShipDate - OrderDate) AS DelayAfterOrder
FROM
    Orders
WHERE
    ShipDate IS NOT NULL AND
    (ShipDate - OrderDate) > 7;