-- Créer une colonne concaténant les noms et prénoms des employés

SELECT
    *,
    INITCAP(e.firstname || ' ' || e.lastname) AS full_name
FROM
    employees AS e


SELECT
    firstname,
    lastname,
    COALESCE(firstname, '') || ' ' || COALESCE(lastname, '') AS full_name
FROM 
    employees;
