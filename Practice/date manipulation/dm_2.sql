-- Afficher les employés ayant fêté leur anniversaire le mois dernier
SELECT 
    FirstName,
    LastName,
    BirthDate
FROM 
    Employees
WHERE 
    EXTRACT(MONTH FROM BirthDate) = EXTRACT(MONTH FROM CURRENT_DATE - INTERVAL '1 month');