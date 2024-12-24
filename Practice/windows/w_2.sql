-- Ajouter une colonne indiquant le rang (RANK) des employés en fonction de leur salaire dans chaque département.

SELECT  
    firstname,
    lastname,
    salary,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS r
FROM 
    employees