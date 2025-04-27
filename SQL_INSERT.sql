/*
    Author: O. Paszkiewicz
    Date of Preparation: 14-12-2023
    Subject: Prison Management System
    Description: The Databse for a Prison, a file adding all the data to the tables.
*/
Use Prison;

-- Delete all the entries in the tables
DELETE FROM Has
DELETE FROM Implements
DELETE FROM Connected_to
DELETE FROM During
DELETE FROM Is_documented_by
DELETE FROM Is_served_during
DELETE FROM Is_described_in
DELETE FROM Involvement
DELETE FROM Attendance
DELETE FROM RehabilitationPrograms
DELETE FROM ReleaseInformation
DELETE FROM SecurityMeasures
DELETE FROM Visits
DELETE FROM PrisonerContacts
DELETE FROM Incidents
DELETE FROM LegalDocuments
DELETE FROM MedicalCondition
DELETE FROM MedicalDocuments
DELETE FROM Medication
DELETE FROM Sentence
DELETE FROM Prisoner
DELETE FROM PrisonerStay
DELETE FROM Facility

-- Put entries into the Prisoner table
INSERT INTO Prisoner (PrisonerID, Name, Surname, DateOfBirth, Gender, Nationality, PESEL, SecurityClassification)
VALUES
    ('1234567', 'John', 'Smith', '1990-05-15', 'Male', 'American', NULL, 'Maximum'),
    ('2345678', 'Joanna', 'Kowalska', '1985-08-22', 'Female', 'Polish', '23456789012', 'Medium'),
    ('3456789', 'Robert', 'Johnson', '1982-11-10', 'Male', 'British', NULL, 'High Maximum'),
    ('4567890', 'Emilia', 'Jones', '1998-03-29', 'Female', 'Polish', '45678901234', 'Minimum'),
    ('5678901', 'Michael', 'Williams', '1977-07-03', 'Male', 'German', NULL, 'Other'),
    ('6789012', 'Sonia', 'Miller', '1995-01-18', 'Female', 'Polish', '67890123456', 'Medium'),
    ('7890123', 'Dominik', 'Brown', '1989-09-05', 'Male', 'Polish', '78901234567', 'High Maximum'),
    ('8901234', 'Magdalena', 'Turen', '1993-12-12', 'Female', 'Polish', '89012345678', 'Maximum'),
    ('9012345', 'Eryk', 'Lipinski', '1980-04-08', 'Male', 'Polish', '90123456789', 'Minimum'),
    ('0123456', 'Ania', 'Grudzinska', '1991-06-20', 'Female', 'Polish', '01234567890', NULL);

-- Put entries into MedicalDocuments table
INSERT INTO MedicalDocuments (DocumentID, DateAndTime, MedicalProfessional, PrisonerID)
VALUES
    ('1234567', '2023-01-05 08:30:00', 'Dr. Smith', '1234567'),
    ('2345678', '2023-02-10 14:45:00', 'Dr. Johnson', '2345678'),
    ('3456789', '2023-03-18 10:15:00', 'Dr. White', '3456789'),
    ('4567890', '2023-04-25 11:00:00', 'Dr. Miller', '4567890'),
    ('5678901', '2023-05-30 16:20:00', 'Dr. Taylor', '5678901'),
    ('6789012', '2023-06-08 09:45:00', 'Dr. Anderson', '6789012'),
    ('7890123', '2023-07-12 13:30:00', 'Dr. Brown', '7890123'),
    ('8901234', '2023-08-20 15:10:00', 'Dr. Wilson', '8901234'),
    ('9012345', '2023-09-22 12:00:00', 'Dr. Davis', '9012345'),
    ('0123456', '2023-10-05 17:40:00', 'Dr. Garcia', '0123456');

-- Put entries into MedicalCondition tables
INSERT INTO MedicalCondition (ICD10Code, PrisonerID, Name, Severity, Description)
VALUES
    ('A01.1', '1234567', 'Influenza', 'Moderate', 'Prisoner has moderate symptoms of influenza.'),
    ('B12.2', '2345678', 'Anemia', 'Severe', 'Prisoner has severe anemia and requires medical attention.'),
    ('C03.0', '3456789', 'Melanoma', 'Critical', 'Prisoner diagnosed with critical stage melanoma.'),
    ('D45.9', '4567890', 'Polyarteritis Nodosa', 'Stable', 'Prisoner has stable polyarteritis nodosa.'),
    ('E05.9', '5678901', 'Thyroid Disorder', 'Mild', 'Prisoner diagnosed with a mild thyroid disorder.'),
    ('F32.9', '6789012', 'Major Depressive Disorder', 'Moderate', 'Prisoner has moderate symptoms of major depressive disorder.'),
    ('G20.9', '7890123', 'Parkinsons Disease', 'Severe', 'Prisoner diagnosed with severe Parkinsons disease.'),
    ('H40.9', '8901234', 'Glaucoma', 'Critical', 'Prisoner diagnosed with critical stage glaucoma.'),
    ('I10.9', '9012345', 'Hypertension', 'Stable', 'Prisoner has stable hypertension.'),
    ('J45.9', '0123456', 'Asthma', 'Other', 'Prisoner has other symptoms related to asthma.');

-- Put entries into the Facility table
INSERT INTO Facility (FacilityID, FacilityName, Address, City, SecurityLevel, StartDate, EndDate)
VALUES 
    ('001', 'Warsaw Central Prison', '123 Main Street', 'Warsaw', 'High Maximum', '2001-01-01', NULL),
    ('002', 'Krakow Correctional Facility', '456 Oak Avenue', 'Krakow', 'Medium', '2002-02-01', NULL),
    ('003', 'Gdansk Transitional Center', '789 Pine Road', 'Gdansk', 'Transitional', '2001-03-01', NULL),
    ('004', 'Wroclaw Maximum Security Prison', '101 Cedar Lane', 'Wroclaw', 'Maximum', '1998-04-01', NULL),
    ('005', 'Poznan Correctional Institution', '202 Birch Street', 'Poznan', 'Correctional', '1950-05-01', NULL),
    ('006', 'Szczecin Minimum Security Facility', '303 Elm Boulevard', 'Szczecin', 'Minimum', '1967-06-01', NULL),
    ('007', 'Lodz High Maximum Prison', '404 Maple Drive', 'Lodz', 'High Maximum', '1978-07-01', NULL),
    ('008', 'Katowice Transitional Center', '505 Walnut Court', 'Katowice', 'Transitional', '1979-08-01', NULL),
    ('009', 'Bydgoszcz Medium Security Prison', '606 Pine Lane', 'Bydgoszcz', 'Medium', '1945-09-01', NULL),
    ('010', 'Rzeszow Minimum Security Facility', '707 Oak Street', 'Rzeszow', 'Minimum', '1901-10-01', NULL);

-- Put entries into the PrisonerStay table
INSERT INTO PrisonerStay (StayID, EntryDate, ExitDate, AdditionalInformation, FacilityID)
VALUES 
    ('0000001', '2020-01-15', NULL, NULL, '001'),
    ('0000002', '2017-02-10', '2023-03-20', NULL, '002'),
    ('0000003', '2023-03-05', NULL, NULL, '003'),
    ('0000004', '2010-04-20', '2023-06-10', 'Underwent psychological counseling.', '004'),
    ('0000005', '2022-05-15', NULL, NULL, '005'),
    ('0000006', '2012-06-10', NULL, NULL, '006'),
    ('0000007', '2018-07-01', NULL, NULL, '007'),
    ('0000008', '2018-08-20', NULL, NULL, '008'),
    ('0000009', '2019-09-15', NULL, NULL, '009'),
    ('0000010', '2019-10-10', NULL, NULL, '010');

-- Put entries into the Medication table
INSERT INTO Medication (MedicationID, Name, Dosage, Frequency, Reason, StartDate, EndDate, DocumentID)
VALUES 
    ('0000001', 'Ibuprofen', 200.0, 2, 'Pain relief', '2022-01-01', '2022-02-01', '1234567'),
    ('0000002', 'Amoxicillin', 500.0, 1, 'Antibiotic treatment', '2022-02-05', '2022-03-05','2345678'),
    ('0000003', 'Lisinopril', 10.0, 1, 'Blood pressure control', '2022-03-10', '2022-04-10', '3456789'),
    ('0000004', 'Omeprazole', 20.0, 1, 'Acid reflux prevention', '2022-04-15', '2022-05-15', '4567890'),
    ('0000005', 'Metformin', 1000.0, 2, 'Diabetes management', '2022-05-20', '2022-06-20', '5678901'),
    ('0000006', 'Sertraline', 50.0, 1, 'Depression treatment', '2022-06-25', '2022-07-25', '6789012'),
    ('0000007', 'Atorvastatin', 20.0, 1, 'Cholesterol control', '2022-07-30', '2022-08-30','7890123'),
    ('0000008', 'Hydrochlorothiazide', 25.0, 1, 'Diuretic for edema', '2022-08-31', '2022-09-30', '8901234'),
    ('0000009', 'Warfarin', 5.0, 1, 'Blood clot prevention', '2022-10-01', '2022-11-01', '9012345'),
    ('0000010', 'Aspirin', 81.0, 1, 'Cardiovascular health', '2022-11-05', '2022-12-05', '0123456');

-- Put entries into the LegalDocuments table
INSERT INTO LegalDocuments (DocumentID, Title, Type, DateIssued, IssuingAuthority, Description, PrisonerID)
VALUES 
    ('9876543', 'Sentencing Order', 'Sentencing Orders', '2022-01-15', 'District Court of Warsaw', 'Sentenced to 5 years for robbery.', '1234567'),
    ('8765432', 'Parole Agreement', 'Parole Agreements', '2022-02-20', 'Parole Board of Krakow', 'Granted parole after completing rehabilitation program.', '2345678'),
    ('7654321', 'Release Document', 'Release Documents', '2022-03-25', 'State Department of Corrections', 'Released on good behavior after serving 2 years.', '3456789'),
    ('6543210', 'Probation Order', 'Probation Orders', '2022-04-30', 'Probation Office of Gdansk', 'Placed on probation for 1 year with mandatory counseling.', '4567890'),
    ('5432109', 'Appeal Filing', 'Appeal Filings', '2022-05-05', 'Court of Appeals in Wroclaw', 'Filed an appeal against the conviction for reconsideration.', '5678901'),
    ('4321098', 'Incarceration Record', 'Incarceration Records', '2022-06-10', 'State Penitentiary of Poznan', 'Record of the inmates time served, including disciplinary actions.', '6789012'),
    ('3210987', 'Plea Agreement', 'Plea Agreements', '2022-07-15', 'District Court of Szczecin', 'Entered into a plea agreement to reduce the sentence for cooperation with authorities.', '7890123'),
    ('2109876', 'Clemency Petition', 'Clemency Petitions', '2022-08-20', 'Office of the President', 'Petition for clemency due to health issues and exemplary behavior.', '8901234'),
    ('1098765', 'Other Document', 'Other', '2022-09-25', 'Unknown Issuing Authority', 'Document of unknown type and purpose.', '9012345'),
    ('9876544', 'Sentencing Order', 'Sentencing Orders', '2022-10-01', 'District Court of Lodz', 'Sentenced to community service for a non-violent offense.', '0123456');

INSERT INTO Sentence (SentenceID, Length, DateOfVerdict, ParoleEligibility, CourtName, AdditionalInformation, PrisonerID)
VALUES 
    ('8765432', 60, '2022-01-15', '2025-01-15', 'District Court of Warsaw', 'Convicted for robbery.', '1234567'),
    ('7654321', 36, '2022-02-20', '2024-02-20', 'District Court of Krakow', 'Convicted for fraud.', '2345678'),
    ('6543210', 120, '2022-03-25', '2026-03-25', 'Supreme Court of Poland', 'Convicted for serious offenses including organized crime.', '3456789'),
    ('5432109', 48, '2022-04-30', '2024-10-30', 'District Court of Gdansk', 'Convicted for drug trafficking.', '4567890'),
    ('4321098', 72, '2022-05-05', '2025-11-05', 'Court of Appeals in Wroclaw', 'Convicted for assault.', '5678901'),
    ('3210987', 24, '2022-06-10', '2023-12-10', 'State Penitentiary of Poznan', 'Convicted for theft.', '6789012'),
    ('2109876', 96, '2022-07-15', '2025-07-15', 'District Court of Szczecin', 'Convicted for white-collar crime.', '7890123'),
    ('1098765', 180, '2022-08-20', NULL, 'Office of the President', 'Convicted for high-profile corruption.', '8901234'),
    ('9876543', 60, '2022-09-25', '2024-03-25', 'Unknown Court', 'Convicted for unknown offense.', '9012345'),
    ('8765435', 12, '2022-10-01', '2023-04-01', 'District Court of Lodz', 'Convicted for minor offenses.', '0123456');

INSERT INTO Incidents (IncidentID, Type, Date, Time, Place, Description, FacilityID)
VALUES 
    ('0000001', 'Assaults', '2022-01-15', '12:30:00', 'Common Area', 'Altercation between two inmates.', '001'),
    ('0000002', 'Contraband Possession', '2022-02-20', '08:45:00', 'Cell Block C', 'Inmate found with unauthorized items.', '002'),
    ('0000003', 'Escape Attempts', '2022-03-25', '16:20:00', 'Perimeter Fence', 'Inmate tried to escape but was apprehended.', '003'),
    ('0000004', 'Unauthorized Communication', '2022-04-30', NULL, 'Visitation Room', 'Inmate caught attempting unauthorized communication.', '004'),
    ('0000005', 'Drug-related Incidents', '2022-05-05', NULL, 'Recreation Yard', 'Drug use detected during routine inspection.', '005'),
    ('0000006', 'Property Damage', '2022-06-10', NULL, 'Dormitory 3', 'Vandalism resulting in property damage.', '006'),
    ('0000007', 'Riot or Disturbance', '2022-07-15', NULL, 'Cell Block B', 'Large-scale disturbance among inmates.', '007'),
    ('0000008', 'Harassment or Threats', '2022-08-20', NULL, 'Cafeteria', 'Report of inmate harassment and threats.', '008'),
    ('0000009', 'Disciplinary Violations', '2022-09-25', NULL, 'Security Checkpoint', 'Inmate violated prison rules.', '009'),
    ('0000010', 'Riot or Disturbance', '2022-10-01', '15:45:00', 'Exercise Yard', 'Inmate displaying aggressive behavior towards staff and other inmates.', '010'),
    ('0000011', 'Riot or Disturbance', '2022-10-01', '15:45:00', 'Exercise Yard', 'Inmate displaying aggressive behavior towards staff and other inmates.', '010');

INSERT INTO Involvement (StayID, IncidentID, Role, AdditionalInformation)
VALUES 
    ('0000001', '0000001', 'Perpetrator', 'Initiated a fight with another inmate during a disagreement.'),
    ('0000002', '0000002', 'Observer', 'Witnessed a fellow inmate in possession of contraband.'),
    ('0000003', '0000003', 'Victim', 'Subjected to threats during an attempted escape.'),
    ('0000004', '0000004', 'Perpetrator', 'Attempted unauthorized communication with an outsider.'),
    ('0000005', '0000005', 'Perpetrator', 'Involved in drug-related activities during recreation time.'),
    ('0000006', '0000006', 'Perpetrator', 'Vandalized property in the dormitory during a dispute.'),
    ('0000007', '0000007', 'Perpetrator', 'Participated in a riot within Cell Block B.'),
    ('0000008', '0000008', 'Victim', 'Harassed and threatened by another inmate in the cafeteria.'),
    ('0000009', '0000009', 'Observer', 'Witnessed a fellow inmate violating prison rules.'),
    ('0000010', '0000010', 'Perpetrator', 'Engaged in aggressive behavior towards staff and other inmates in the exercise yard.');

INSERT INTO SecurityMeasures (FacilityID, Name, Type, DateImplemented, Description)
VALUES 
    ('001', 'Surveillance System Upgrade', 'Surveillance Systems', '2022-01-15', 'Installed new high-definition cameras throughout the facility.'),
    ('002', 'Enhanced Perimeter Fencing', 'Perimeter Security', '2022-02-20', 'Upgraded perimeter fencing to enhance security and prevent unauthorized access.'),
    ('003', 'Access Control System Overhaul', 'Access Control', '2022-03-25', 'Implemented a modern access control system to regulate entry and exit points.'),
    ('004', 'Increased Correctional Officer Presence', 'Correctional Officer Presence', '2022-04-30', 'Boosted the number of correctional officers on duty to enhance supervision.'),
    ('005', 'Specialized Equipment Deployment', 'Specialized Equipment', '2022-05-05', 'Introduced advanced security equipment for better inmate monitoring.'),
    ('006', 'Security Checkpoints Restructuring', 'Security Checkpoints', '2022-06-10', 'Reorganized security checkpoints to improve inmate and staff safety.'),
    ('007', 'Search and Seizure Protocol Revision', 'Search and Seizure Protocols', '2022-07-15', 'Updated procedures for more effective searching and contraband seizure.'),
    ('008', 'Emergency Response Plan Review', 'Emergency Response Plans', '2022-08-20', 'Conducted a comprehensive review and update of emergency response plans.'),
    ('009', 'Integration with Inmate Programs', 'Connected to Inmate Programs and Rehabilitation', '2022-09-25', 'Connected security measures with inmate programs to promote rehabilitation.'),
    ('010', 'Other Security Enhancement', 'Other', '2022-10-01', 'Implemented additional security measures to address specific facility needs.');

INSERT INTO RehabilitationPrograms (ProgramID, ProgramName, Category, StartDate, EndDate, Description)
VALUES 
    ('00001', 'Literacy Program', 'Educational Programs', '2022-01-15', '2022-03-15', 'Provides inmates with literacy skills and basic education.'),
    ('00002', 'Cognitive Behavioral Therapy', 'Counselling and Therapy', '2022-02-20', '2022-04-20', 'Helps inmates identify and change negative thought patterns and behaviors.'),
    ('00003', 'Job Skills Workshop', 'Employment Readiness Programs', '2022-03-25', '2022-05-25', 'Equips inmates with skills necessary for employment upon release.'),
    ('00004', 'Life Skills Training Program', 'Life Skills Training', '2022-04-30', '2022-06-30', 'Teaches essential life skills such as budgeting, time management, and communication.'),
    ('00005', 'Substance Abuse Rehabilitation', 'Substance Abuse Treatment Programs', '2022-05-05', '2022-07-05', 'A comprehensive program for inmates struggling with substance abuse.'),
    ('00006', 'Anger Management Workshop', 'Anger Management Programs', '2022-06-10', '2022-08-10', 'Helps inmates manage and control anger in a constructive manner.'),
    ('00007', 'Parenting Skills Classes', 'Parenting Classes', '2022-07-15', '2022-09-15', 'Educates inmates on effective parenting skills and responsibilities.'),
    ('00008', 'Restorative Justice Circles', 'Restorative Justice Programs', '2022-08-20', '2022-10-20', 'Promotes healing and understanding through facilitated group discussions.'),
    ('00009', 'Re-entry Planning Seminar', 'Re-entry Planning and Support', '2022-09-25', '2022-11-25', 'Assists inmates in developing plans for successful re-entry into society.'),
    ('00010', 'Community Service Initiative', 'Community Service Programs', '2022-10-01', '2022-12-01', 'Inmates contribute to community service projects as part of rehabilitation efforts.');

INSERT INTO Attendance (AttendanceID, StartDate, EndDate, Result, AdditionalInformation, RehabilitationProgramID)
VALUES 
    ('0000001', '2022-01-15', '2022-03-15', 'Completed', 'Active participation and completion of the literacy program.', '00001'),
    ('0000002', '2022-02-20', '2022-04-20', 'Completed', 'Successful completion of cognitive behavioral therapy.', '00002'),
    ('0000003', '2022-03-25', '2022-05-25', 'In Progress', 'Currently attending job skills workshop.', '00003'),
    ('0000004', '2022-04-30', '2022-06-30', 'Incomplete', 'Partially completed life skills training program.', '00004'),
    ('0000005', '2022-05-05', '2022-07-05', 'Completed', 'Successful completion of substance abuse rehabilitation.', '00005'),
    ('0000006', '2022-06-10', '2022-08-10', 'Not Attended', 'Missed anger management workshop sessions without justification.', '00006'),
    ('0000007', '2022-07-15', '2022-09-15', 'Completed', 'Active participation in parenting skills classes.', '00007'),
    ('0000008', '2022-08-20', '2022-10-20', 'Not Started', 'Restorative justice circles program yet to begin.', '00008'),
    ('0000009', '2022-09-25', '2022-11-25', 'In Progress', 'Currently participating in re-entry planning seminar.', '00009'),
    ('0000010', '2022-10-01', '2022-12-01', 'Not Attended', 'Missed community service initiative due to health reasons.', '00010');

INSERT INTO ReleaseInformation (ReleaseID, ReleaseReason, ReleaseDate, Description, PrisonerStayID)
VALUES 
    ('0000002', 'Sentence Completion', '2023-03-20', 'Prisoner completed the assigned sentence term.', '0000002'),
    ('0000004', 'Sentence Completion', '2023-06-10', 'Prisoner completed the assigned sentence term after undergoing psychological counseling.', '0000004');

INSERT INTO PrisonerContacts (ContactID, FirstName, LastName, TelNumber, Email, AdditionalInformation, Description)
VALUES 
    ('0000001', 'Jan', 'Kowalski', '+48600700800', 'jan.kowalski@gmail.com', 'Emergency contact', NULL),
    ('0000002', 'Anna', 'Nowak', '+48600300300', 'anna.nowak@outlook.com', 'Family member of Prisoner 1234567', NULL),
    ('0000003', 'Robert', 'Lis', '+48600100100', 'robert.lis@gmail.com', 'In case of medical emergencies', 'Medical Support'),
    ('0000004', 'Emilia', 'Wiśniewska', '+48600200200', 'emilia.wisniewska@yahoo.com', NULL, NULL),
    ('0000005', 'Michał', 'Nowicki', '+48600500500', 'michal.nowicki@gmail.com', 'Legal matters', 'Lawyer'),
    ('0000006', 'Sylwia', 'Mazurek', '+48600600600', 'sylwia.mazurek@outlook.com', 'Regular check-ins, keep and eye on', NULL),
    ('0000007', 'Daniel', 'Miller', '+48600100100', 'daniel.miller@gmail.com', 'Work-related matters', NULL),
    ('0000008', 'Zofia', 'Martyna', '+48600200200', 'zofia.martyna@gmail.com', 'Important family events', NULL),
    ('0000009', 'Eryk', 'Wilczyński', '+48600500500', 'eryk.wilczynski@outlook.com', 'In case of emergencies', NULL),
    ('0000010', 'Olga', 'Jankowska', '+48600600600', 'olga.jankowska@outlook.com', 'Local support contact', 'Psychologist');

-- Generating ten visits based on existing PrisonerStay entries
INSERT INTO Visits (VisitID, Date, Time, Duration, Reason, Description, PrisonerStayID)
VALUES 
    ('0000001', '2022-01-20', '15:30:00', '01:30:00', 'Family visit', NULL, '0000001'),
    ('0000002', '2022-02-15', '10:00:00', '02:00:00', 'Legal consultation', 'Meeting with the lawyer', '0000002'),
    ('0000003', '2022-03-10', '14:45:00', '01:15:00', 'Medical check-up', 'Routine health examination', '0000003'),
    ('0000004', '2022-04-25', '11:30:00', '01:00:00', 'Family visit', NULL, '0000004'),
    ('0000005', '2022-05-20', '16:00:00', '02:30:00', 'Legal consultation', 'Discussing case details with legal representative', '0000005'),
    ('0000006', '2022-06-15', '09:45:00', '01:45:00', 'Family visit', NULL, '0000006'),
    ('0000007', '2022-07-10', '13:15:00', '01:00:00', 'Work-related visit', 'Meeting with employer', '0000007'),
    ('0000008', '2022-08-25', '10:30:00', '02:15:00', 'Family visit', NULL, '0000008'),
    ('0000009', '2022-09-20', '14:00:00', '01:30:00', 'Legal consultation', 'Reviewing legal documents', '0000009'),
    ('0000010', '2022-10-15', '11:15:00', '01:45:00', 'Family visit', NULL, '0000010');

INSERT INTO Is_described_in (ICD10Code, PrisonerID, DocumentID)
VALUES
    ('A01.1', '1234567', '1234567'),
    ('B12.2', '2345678', '2345678'),
    ('C03.0', '3456789', '3456789'),
    ('D45.9', '4567890', '4567890'),
    ('E05.9', '5678901', '5678901'),
    ('F32.9', '6789012', '6789012'),
    ('G20.9', '7890123', '7890123'),
    ('H40.9', '8901234', '8901234'),
    ('I10.9', '9012345', '9012345'),
    ('J45.9', '0123456', '0123456');

INSERT INTO Is_documented_by (DocumentID, SentenceID)
VALUES 
    ('9876543', '8765432'),
    ('8765432', '7654321'),
    ('7654321', '6543210'),
    ('6543210', '5432109'),
    ('5432109', '4321098'),
    ('4321098', '3210987'),
    ('3210987', '2109876'),
    ('2109876', '1098765'),
    ('1098765', '9876543'),
    ('9876544', '8765435');

INSERT INTO Is_served_during (SentenceID, StayID)
VALUES 
    ('8765432', '0000001'),
    ('7654321', '0000002'),
    ('6543210', '0000003'),
    ('5432109', '0000004'),
    ('4321098', '0000005'),
    ('3210987', '0000006'),
    ('2109876', '0000007'),
    ('1098765', '0000008'),
    ('9876543', '0000009'),
    ('8765435', '0000010');

INSERT INTO Implements (FacilityID, ProgramID)
VALUES 
    ('001', '00001'),
    ('002', '00002'),
    ('003', '00003'),
    ('004', '00004'),
    ('005', '00005'),
    ('006', '00006'),
    ('007', '00007'),
    ('008', '00008'),
    ('009', '00009'),
    ('010', '00010');

INSERT INTO During (AttendanceID, StayID)
VALUES 
    ('0000001', '0000001'),
    ('0000002', '0000002'),
    ('0000003', '0000003'),
    ('0000004', '0000004'),
    ('0000005', '0000005'),
    ('0000006', '0000006'),
    ('0000007', '0000007'),
    ('0000008', '0000008'),
    ('0000009', '0000009'),
    ('0000010', '0000010');

INSERT INTO Connected_to (VisitID, ContactID)
VALUES 
    ('0000001', '0000001'),
    ('0000002', '0000002'),
    ('0000003', '0000003'),
    ('0000004', '0000004'),
    ('0000005', '0000005'),
    ('0000006', '0000006'),
    ('0000007', '0000007'),
    ('0000008', '0000008'),
    ('0000009', '0000009'),
    ('0000010', '0000010');

INSERT INTO Has (PrisonerID, ContactID)
VALUES 
    ('1234567', '0000001'),
    ('2345678', '0000002'),
    ('3456789', '0000003'),
    ('4567890', '0000004'),
    ('5678901', '0000005'),
    ('6789012', '0000006'),
    ('7890123', '0000007'),
    ('8901234', '0000008'),
    ('9012345', '0000009'),
    ('0123456', '0000010');

-- AUTO_INCREMENT - automatic increamentation
