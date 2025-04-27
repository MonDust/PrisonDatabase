-- Query to list prisoners with their entry and exit dates.
SELECT
    PS.StayID,
    PS.EntryDate,
    PS.ExitDate,
    P.PrisonerID,
    P.Name,
    P.Surname,
    P.DateOfBirth,
    P.Gender,
    P.Nationality,
    P.PESEL,
    P.SecurityClassification
FROM
    PrisonerStay AS PS
JOIN
    Is_served_during AS ISD ON PS.StayID = ISD.StayID
JOIN
    Sentence AS S ON ISD.SentenceID = S.SentenceID
JOIN
    Prisoner AS P ON S.PrisonerID = P.PrisonerID;