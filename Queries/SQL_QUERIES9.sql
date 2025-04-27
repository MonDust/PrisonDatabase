-- Query to find facilities in which Assaults happened.
SELECT 
    F.FacilityID, 
    F.FacilityName
FROM 
    Facility F
WHERE
    F.FacilityID in (
        SELECT 
            PS.FacilityID
        FROM 
            PrisonerStay PS
            JOIN Involvement ON PS.StayID = Involvement.StayID
            JOIN Incidents ON Involvement.IncidentID = Incidents.IncidentID
        WHERE
            Incidents.Type = 'Assaults'
    );