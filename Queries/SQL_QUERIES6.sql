-- Query to count the number of incidents by type
SELECT
    Type,
    COUNT(*) AS IncidentCount
FROM
    Incidents
GROUP BY
    Type;