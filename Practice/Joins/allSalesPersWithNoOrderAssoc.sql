-- Lister les employés qui n’ont aucune commande associée en tant que SalesPerson
SELECT
    e.firstname
FROM employees AS e
LEFT JOIN orders AS o ON e.employeeid = o.salespersonid
WHERE o.salespersonid IS NULL;
