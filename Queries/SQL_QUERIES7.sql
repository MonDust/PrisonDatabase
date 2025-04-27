-- Query to list ordered prisonerstays by entrydate with the faciliy
SELECT
    PS.StayID,
    PS.EntryDate,
    F.FacilityID,
    F.FacilityName,
    F.City
FROM
    Facility F
JOIN PrisonerStay PS ON F.FacilityID = PS.FacilityID
ORDER BY
    PS.EntryDate DESC;