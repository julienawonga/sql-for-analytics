-- Récupérer tous les employés ayant un salaire supérieur à 50 000 € et travaillant dans le département "Ventes".

SELECT 
    *
FROM employees
WHERE salary > 50000 AND department = "sales"