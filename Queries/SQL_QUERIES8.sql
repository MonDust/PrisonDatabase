-- Query to find the facility with the highest number of incidents
SELECT TOP 1
    F.FacilityName,
    COUNT(I.IncidentID) AS IncidentCount
FROM
    Facility F
LEFT JOIN Incidents I ON F.FacilityID = I.FacilityID
GROUP BY
    F.FacilityName
ORDER BY
    IncidentCount DESC;