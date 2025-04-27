-- Query to find prisoners with medical conditions classified as 'Severe'
SELECT
    P.PrisonerID,
    P.Name,
    P.Surname
FROM
    Prisoner P
WHERE
    P.PrisonerID in (
        SELECT 
            MC.PrisonerID
        FROM
            MedicalCondition MC
        WHERE
            MC.Severity = 'Severe'
    );