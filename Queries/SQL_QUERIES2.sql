-- Query to retrieve incidents along with related facility information
SELECT
    I.IncidentID,
    I.Type,
    I.Date,
    I.Time,
    I.Place,
    F.FacilityName
FROM
    Incidents I
JOIN Facility F ON I.FacilityID = F.FacilityID;