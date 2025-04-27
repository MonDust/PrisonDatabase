/*
    Author: Olga Paszkiewicz 187583
    Date of Preparation: 14-12-2023
    Subject: Prison Management System
    Description: The Databse for a Prison, a file showing operations on the Database.
*/
Use Prison;

-- SEE ENTRIES --
SELECT * FROM Has;
SELECT * FROM Implements;
SELECT * FROM Connected_to;
SELECT * FROM During;
SELECT * FROM Is_documented_by;
SELECT * FROM Is_served_during;
SELECT * FROM Is_described_in;
SELECT * FROM Involvement;
SELECT * FROM Attendance;
SELECT * FROM RehabilitationPrograms;
SELECT * FROM ReleaseInformation;
SELECT * FROM SecurityMeasures;
SELECT * FROM Visits;
SELECT * FROM PrisonerContacts;
SELECT * FROM Incidents;
SELECT * FROM LegalDocuments;
SELECT * FROM MedicalCondition;
SELECT * FROM MedicalDocuments;
SELECT * FROM Medication;
SELECT * FROM Sentence;
SELECT * FROM Prisoner;
SELECT * FROM PrisonerStay;
SELECT * FROM Facility;

-- ON UPDATE CASCADE --
SELECT * FROM Has;
SELECT * FROM PrisonerContacts;

UPDATE PrisonerContacts
    SET ContactID = '0000023'
    WHERE ContactID = '0000001';

SELECT * FROM SecurityMeasures;
SELECT * FROM Facility;

UPDATE Facility
    SET FacilityID = '100'
    WHERE FacilityID = '001';


-- ON DELETE CASCADE --
SELECT * FROM PrisonerStay;
SELECT * FROM Involvement;

DELETE FROM PrisonerStay
    WHERE StayID = '0000002';

SELECT * FROM SecurityMeasures;
SELECT * FROM Facility;

DELETE FROM Facility
	WHERE FacilityID = '002';
