    -- Récupérer les employés ayant un salaire supérieur à la moyenne des salaires dans leur département.
    SELECT
        e.firstname,
        e.department,
        e.salary
    FROM 
        employees AS e
    WHERE 
        e.salary > (
            SELECT 
                AVG(e2.salary)
            FROM employees AS e2
            WHERE 
                e2.department = e.department
        )