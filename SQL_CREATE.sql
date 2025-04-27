/*
    Author: O. Paszkiewicz
    Date of Preparation: 14-12-2023
    Subject: Prison Management System
    Description: The Databse for a Prison, a file creating all the tables.
*/
Use Prison;

-- Table to store information about prisoners
-- Contains data about prisoners, including name, date of birth, gender, nationality, and security classification
CREATE TABLE Prisoner (
    PrisonerID VARCHAR(7) PRIMARY KEY CHECK (PrisonerID LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    Name VARCHAR(100) NOT NULL,
    Surname VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(20) CHECK (Gender IN ('Male', 'Female')) NOT NULL,
    Nationality VARCHAR(50) NULL,
    PESEL CHAR(11) CHECK (PESEL LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') NULL,
    SecurityClassification VARCHAR(50) CHECK (SecurityClassification IN ('High Maximum', 'Maximum', 'Medium', 'Minimum', 'Other')) NULL,
    INDEX Unique_PESEL_NonNull UNIQUE (PESEL) WHERE PESEL IS NOT NULL
);

-- Table to store information about facilities
-- Contains data about prison facilities, including names, addresses, security levels, and operational dates
CREATE TABLE Facility (
    FacilityID VARCHAR(3) PRIMARY KEY CHECK (FacilityID LIKE '[0-9][0-9][0-9]'),
    FacilityName VARCHAR(100) NOT NULL,
    Address VARCHAR(100) NULL,
    City VARCHAR(100) NULL,
    SecurityLevel VARCHAR(50) CHECK (SecurityLevel IN ('High Maximum', 'Maximum', 'Medium', 'Minimum', 'Transitional', 'Correctional', 'Other')) NULL,
    StartDate DATE NULL,
    EndDate DATE NULL,
    CONSTRAINT check_valid_dates_facility CHECK (StartDate <= EndDate)
);

-- Table to track prisoners' stays at facilities
-- Contains data about prisoner stays, including entry and exit dates, and additional information
CREATE TABLE PrisonerStay (
    StayID VARCHAR(7) PRIMARY KEY CHECK (StayID LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    EntryDate DATE NOT NULL,
    ExitDate DATE NULL,
    AdditionalInformation VARCHAR(1000) NULL,
    FacilityID VARCHAR(3) NOT NULL,
    FOREIGN KEY (FacilityID) 
        REFERENCES Facility(FacilityID) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT check_valid_dates_prisoner_stay CHECK (EntryDate <= ExitDate)
);

-- Table to store medical documents
-- Contains data about the medical documents related to prisoners, including date and time, medical professionals, and associated prisoner IDs
CREATE TABLE MedicalDocuments (
    DocumentID VARCHAR(7) PRIMARY KEY CHECK (DocumentID LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    DateAndTime DATETIME NULL,
    MedicalProfessional VARCHAR(100) NOT NULL,
    PrisonerID VARCHAR(7) NOT NULL,
    FOREIGN KEY (PrisonerID)   
        REFERENCES Prisoner(PrisonerID) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table to store information about medications
-- Contains data about medications prescribed to prisoners, including dosage, frequency, and associated details
CREATE TABLE Medication (
    MedicationID VARCHAR(7) PRIMARY KEY CHECK (MedicationID LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    Name VARCHAR(100) NOT NULL,
    Dosage FLOAT(15) CHECK (Dosage > 0) NULL,
    Frequency INT CHECK (Frequency > 0) NULL,
    Reason VARCHAR(500) NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
	DocumentID VARCHAR(7),
	FOREIGN KEY (DocumentID)   
        REFERENCES MedicalDocuments(DocumentID) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT check_valid_dates_medication CHECK (StartDate <= EndDate)
);

-- Table to store information about medical conditions
-- Contains data about the medical conditions of prisoners, including severity and descriptive information
CREATE TABLE MedicalCondition (
    ICD10Code VARCHAR(10) CHECK (ICD10Code LIKE '[A-Z][0-9][0-9][.-.][0-9]'),
    PrisonerID VARCHAR(7),
    Name VARCHAR(100) NOT NULL,
    Severity VARCHAR(50) CHECK (Severity IN ('Mild', 'Moderate', 'Severe', 'Critical', 'Stable', 'Other')) NULL,
    Description VARCHAR(1000) NULL,
    PRIMARY KEY (ICD10Code, PrisonerID),
    FOREIGN KEY (PrisonerID)   
        REFERENCES Prisoner(PrisonerID) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table to store legal documents
-- Contains data about the legal documents related to prisoners, including titles, types, issuing authorities, and dates
CREATE TABLE LegalDocuments (
    DocumentID VARCHAR(7) PRIMARY KEY CHECK (DocumentID LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    Title VARCHAR(100) NOT NULL,
    Type VARCHAR(50) CHECK (Type IN ('Sentencing Orders', 'Parole Agreements', 'Release Documents', 'Probation Orders', 'Appeal Filings', 'Incarceration Records', 'Plea Agreements', 'Clemency Petitions', 'Other')) NOT NULL,
    DateIssued DATE NULL,
    IssuingAuthority VARCHAR(100) NULL,
    Description VARCHAR(1000) NULL,
    PrisonerID VARCHAR(7) NOT NULL,
    FOREIGN KEY (PrisonerID) 
        REFERENCES Prisoner(PrisonerID) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table to store information about sentences
-- Contains data about sentences given to prisoners, including length, verdict dates, and parole eligibility
CREATE TABLE Sentence (
    SentenceID VARCHAR(7) PRIMARY KEY CHECK (SentenceID LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    Length INT CHECK (Length > 0 AND Length <= 999) NOT NULL,
    DateOfVerdict DATE NOT NULL,
    ParoleEligibility DATE NULL,
    CourtName VARCHAR(100) NOT NULL,
    AdditionalInformation VARCHAR(1000) NULL,
    PrisonerID VARCHAR(7),
    FOREIGN KEY (PrisonerID) 
        REFERENCES Prisoner(PrisonerID) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table to store information about incidents
-- Contains data about incidents that occur at facilities, including types, dates, times, and locations
CREATE TABLE Incidents (
    IncidentID VARCHAR(7) PRIMARY KEY CHECK (IncidentID LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    Type VARCHAR(50) CHECK (Type IN ('Assaults', 'Contraband Possession', 'Escape Attempts', 'Unauthorized Communication', 'Drug-related Incidents', 'Property Damage', 'Riot or Disturbance', 'Harassment or Threats', 'Disciplinary Violations', 'Medical Emergencies', 'Other')) NOT NULL,
    Date DATE NOT NULL,
    Time TIME NULL,
    Place VARCHAR(100) NULL,
    Description VARCHAR(1000) NULL,
    FacilityID VARCHAR(3) NOT NULL,
    FOREIGN KEY (FacilityID) 
        REFERENCES Facility(FacilityID) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table to store involvement in incidents
-- Links prisoners' stays with incidents, indicating roles and additional information
CREATE TABLE Involvement (
    StayID VARCHAR(7),
    IncidentID VARCHAR(7),
    Role VARCHAR(50) CHECK (Role IN ('Victim', 'Perpetrator', 'Observer', 'Other')) NOT NULL,
    AdditionalInformation VARCHAR(1000) NULL,
    PRIMARY KEY (StayID, IncidentID),
    FOREIGN KEY (IncidentID)
        REFERENCES Incidents(IncidentID),
    FOREIGN KEY (StayID) 
        REFERENCES PrisonerStay(StayID) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table to store security measures
-- Contains data about the security measures implemented at facilities, including names, types, and implementation dates
CREATE TABLE SecurityMeasures (
    FacilityID VARCHAR(3),
    Name VARCHAR(100) NOT NULL,
    Type VARCHAR(50) CHECK (Type IN ('Surveillance Systems', 'Perimeter Security', 'Access Control', 'Correctional Officer Presence', 'Specialized Equipment', 'Security Checkpoints', 'Search and Seizure Protocols', 'Emergency Response Plans', 'Connected to Inmate Programs and Rehabilitation', 'Other')) NOT NULL,
    DateImplemented DATE NULL,
    Description VARCHAR(1000) NULL,
    PRIMARY KEY (FacilityID, Name),
    FOREIGN KEY (FacilityID) 
        REFERENCES Facility(FacilityID) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table to store rehabilitation programs
-- Contains data about the rehabilitation programs, including names, categories, and program dates
CREATE TABLE RehabilitationPrograms (
    ProgramID VARCHAR(5) PRIMARY KEY CHECK (ProgramID LIKE '[0-9][0-9][0-9][0-9][0-9]'),
    ProgramName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) CHECK (Category IN ('Educational Programs', 'Counselling and Therapy', 'Employment Readiness Programs', 'Life Skills Training', 'Substance Abuse Treatment Programs', 'Anger Management Programs', 'Parenting Classes', 'Restorative Justice Programs', 'Re-entry Planning and Support', 'Community Service Programs', 'Other')) NULL,
    StartDate DATE NULL,
    EndDate DATE NULL,
    Description VARCHAR(1000) NULL,
    CONSTRAINT check_valid_dates_rprograms CHECK (StartDate <= EndDate)
);

-- Table to store attendance in rehabilitation programs
-- Contains data about the prisoners attendance at rehabilitation programs, including start and end dates, results, and additional information
CREATE TABLE Attendance (
    AttendanceID VARCHAR(7) PRIMARY KEY CHECK (AttendanceID LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    StartDate DATE NOT NULL,
    EndDate DATE NULL,
    Result VARCHAR(500) NULL,
    AdditionalInformation VARCHAR(1000) NULL,
    RehabilitationProgramID VARCHAR(5) NOT NULL,
    FOREIGN KEY (RehabilitationProgramID) 
        REFERENCES RehabilitationPrograms(ProgramID) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT check_valid_dates_attendance CHECK (StartDate <= EndDate)
);

-- Table to store release information
-- Contains data about prisoner releases, including reasons, dates
CREATE TABLE ReleaseInformation (
    ReleaseID VARCHAR(7) PRIMARY KEY CHECK (ReleaseID LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    ReleaseReason VARCHAR(500) NOT NULL,
    ReleaseDate DATE NOT NULL,
    Description VARCHAR(1000) NULL,
    PrisonerStayID VARCHAR(7) NOT NULL,
    FOREIGN KEY (PrisonerStayID) 
        REFERENCES PrisonerStay(StayID) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table to store prisoner contacts
-- Contains data about the contact details for individuals related to prisoners, including names, telephone numbers, and email addresses
CREATE TABLE PrisonerContacts (
    ContactID VARCHAR(7) PRIMARY KEY CHECK (ContactID LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    TelNumber VARCHAR(20) NULL,
    Email VARCHAR(250) NULL,
    AdditionalInformation VARCHAR(1000) NULL,
    Description VARCHAR(1000) NULL
);

-- Table to store visit information
-- Contains data about prison visits, including dates, times, durations, reasons, and associated stay IDs
CREATE TABLE Visits (
    VisitID VARCHAR(7) PRIMARY KEY CHECK (VisitID LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    Date DATE NOT NULL,
    Time TIME NULL,
    Duration TIME NULL,
    Reason VARCHAR(1000) NOT NULL,
    Description VARCHAR(1000) NULL,
    PrisonerStayID VARCHAR(7) NOT NULL,
    FOREIGN KEY (PrisonerStayID) 
        REFERENCES PrisonerStay(StayID) 
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT check_duration CHECK (Duration >= '00:00:00')
);

-- Table to establish relationships between medical conditions, prisoners, and medical documents
-- Links medical conditions, prisoners, and medical documents
CREATE TABLE Is_described_in (
    ICD10Code VARCHAR(10),
    PrisonerID VARCHAR(7),
    DocumentID VARCHAR(7),
    PRIMARY KEY (ICD10Code, PrisonerID, DocumentID),
    FOREIGN KEY (ICD10Code, PrisonerID) 
        REFERENCES MedicalCondition(ICD10Code, PrisonerID)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
    FOREIGN KEY (DocumentID) 
        REFERENCES MedicalDocuments(DocumentID) 
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table to establish relationships between legal documents and sentences
-- Links legal documents and sentences
CREATE TABLE Is_documented_by (
    DocumentID VARCHAR(7),
    SentenceID VARCHAR(7),
    FOREIGN KEY (SentenceID) 
        REFERENCES Sentence(SentenceID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (DocumentID) 
        REFERENCES LegalDocuments(DocumentID),
    PRIMARY KEY (DocumentID, SentenceID)
);

-- Table to establish relationships between sentences and prisoner stays
-- Links sentences and prisoner stays
CREATE TABLE Is_served_during (
    SentenceID VARCHAR(7),
    StayID VARCHAR(7),
    FOREIGN KEY (StayID) 
        REFERENCES PrisonerStay(StayID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (SentenceID) 
        REFERENCES Sentence(SentenceID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (SentenceID, StayID)
);

-- Table to establish relationships between facilities and rehabilitation programs
-- Links facilities and rehabilitation programs
CREATE TABLE Implements (
    FacilityID VARCHAR(3),
    ProgramID VARCHAR(5),
    FOREIGN KEY (FacilityID) 
        REFERENCES Facility(FacilityID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (ProgramID) 
        REFERENCES RehabilitationPrograms(ProgramID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    PRIMARY KEY (FacilityID, ProgramID)
);

-- Table to establish relationships between attendance in rehabilitation programs and prisoner stays
-- Links attendance in rehabilitation programs and prisoner stays
CREATE TABLE During (
    AttendanceID VARCHAR(7),
    StayID VARCHAR(7),
    FOREIGN KEY (StayID)
        REFERENCES PrisonerStay(StayID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (AttendanceID) 
        REFERENCES Attendance(AttendanceID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    PRIMARY KEY (AttendanceID, StayID)
);

-- Table to establish relationships between visits and prisoner contacts
-- Links visits and prisoner contacts
CREATE TABLE Connected_to (
    VisitID VARCHAR(7),
    ContactID VARCHAR(7),
    FOREIGN KEY (ContactID)
        REFERENCES PrisonerContacts(ContactID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (VisitID) 
        REFERENCES Visits(VisitID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    PRIMARY KEY (VisitID)
);

-- Table to establish relationships between prisoners and contacts
-- Links prisoners and contacts
CREATE TABLE Has (
    PrisonerID VARCHAR(7),
    ContactID VARCHAR(7),
    FOREIGN KEY (PrisonerID) 
        REFERENCES Prisoner(PrisonerID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    FOREIGN KEY (ContactID) 
        REFERENCES PrisonerContacts(ContactID)
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    PRIMARY KEY (ContactID, PrisonerID)
);
