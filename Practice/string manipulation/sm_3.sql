-- Extraire le code du pays de l'adresse d'expédition (ShipAddress)


SELECT 
    ShipAddress,
    SPLIT_PART(
        TRIM(SPLIT_PART(ShipAddress, ',', 2)),
        ' ',
        1)
         AS state_code
FROM 
    Orders;
    