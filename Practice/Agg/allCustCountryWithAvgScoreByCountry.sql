-- Lister les pays des clients avec le score moyen pour chaque pays.
SELECT
    country,
    AVG(score) AS avg_country_score
FROM customers
GROUP BY country
