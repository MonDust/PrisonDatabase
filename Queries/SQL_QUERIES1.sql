-- Creating a view to display information about stays in facilities
CREATE VIEW StaysFacilityView AS
SELECT
    PS.StayID,
    F.FacilityName,
    F.City,
    F.SecurityLevel,
    PS.EntryDate,
    PS.ExitDate
FROM
    Facility F
JOIN PrisonerStay PS ON F.FacilityID = PS.FacilityID;

-- Query using the created view
SELECT * FROM StaysFacilityView
    WHERE (SecurityLevel = 'High Maximum' AND ExitDate IS NULL);

DROP VIEW IF EXISTS StaysFacilityView;
