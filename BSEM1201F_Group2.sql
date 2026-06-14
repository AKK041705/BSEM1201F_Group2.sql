PUBLIC HEALTH CLINIC RECORDS SYSTEM


CREATE DATABASE public_health_clinic;

 1. CREATE TABLES

CREATE TABLE Patient (
    Patient_ID    INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    First_Name    VARCHAR(50)  NOT NULL,
    Last_Name     VARCHAR(100) NOT NULL,
    Date_Of_Birth DATE         NOT NULL,
    Gender        ENUM('Male','Female','Other') NOT NULL,
    Phone_Number  VARCHAR(20)  NULL,
    Address       VARCHAR(200) NOT NULL
);

CREATE TABLE Health_Worker (
    Health_Worker_ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Full_Name        VARCHAR(100) NOT NULL,
    Role             ENUM('Doctor','Nurse') NOT NULL,
    Department       VARCHAR(100) NOT NULL
);

CREATE TABLE Appointment (
    Appointment_ID   INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Visit_Date       DATE         NOT NULL,
    Reason           VARCHAR(255) NOT NULL,
    Patient_ID       INT          NOT NULL,
    Health_Worker_ID INT          NOT NULL,

    FOREIGN KEY (Patient_ID)       REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Health_Worker_ID) REFERENCES Health_Worker(Health_Worker_ID)
);

CREATE TABLE Diagnoses (
    Diagnoses_ID   INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Appointment_ID INT          NOT NULL,
    Condition_Name VARCHAR(150) NOT NULL,
    Notes          TEXT         NULL,

    FOREIGN KEY (Appointment_ID) REFERENCES Appointment(Appointment_ID)
);

CREATE TABLE Treatment (
    Treatment_ID   INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Diagnoses_ID   INT            NOT NULL,
    Medicine_Name  VARCHAR(150)   NOT NULL,
    Dosage         VARCHAR(100)   NOT NULL,
    Start_Date     DATE           NOT NULL,
    End_Date       DATE           NOT NULL,
    Treatment_Cost DECIMAL(10,2)  NOT NULL,

    FOREIGN KEY (Diagnoses_ID) REFERENCES Diagnoses(Diagnoses_ID)
);
 RENAME A TABLE
    Rename:  Diagnoses  →  Medical_Diagnosis


RENAME TABLE Diagnoses TO Medical_Diagnosis;

SELECT * FROM Medical_Diagnosis;   -- see table after rename (empty for now)

RENAME A COLUMN
    Rename column:  Reason  →  Visit_Reason  in Appointment


ALTER TABLE appointment
CHANGE Reason Visit_Reason VARCHAR(255);

SELECT * FROM Appointment;         -- see column name change (empty for now)
ADD A CONSTRAINT
    Add a CHECK constraint: Treatment_Cost must be > 0


ALTER TABLE Treatment
ADD CONSTRAINT chk_positive_cost CHECK (Treatment_Cost > 0);

SELECT * FROM Treatment;           -- confirm constraint added (empty for now)
INSERT SAMPLE DATA — PATIENTS (20 records)


INSERT INTO Patient (First_Name, Last_Name, Date_Of_Birth, Gender, Phone_Number, Address)
VALUES
('Moses Sutton',            'Koroma',            '2003-02-15', 'Male',   '076123456', 'Makeni'),
('Osman Abdul Salam',       'Sesay',             '2002-04-22', 'Other',   '078234567', 'Freetown'),
('Saffa Wuya',              'Jimmy',             '2001-06-11', 'Male',   '076345678', 'Bo'),
('Lisa Kadija Abass',       'Wurie',             '2002-08-18', 'Female', '078456789', 'Kenema'),
('Amadu',                   'Jalloh',            '2000-03-27', 'Male',   '076567890', 'Port Loko'),
('Mariama Hawanatu',        'Conteh',            '2002-07-10', 'Female', '078678901', 'Makeni'),
('Gibril',                  'Bangura',           '2001-05-05', 'Male',   '076789012', 'Kabala'),
('Abubakarr',               'Bah',               '2002-09-13', 'Male',   '078890123', 'Kono'),
('Franklin',                'Danner',            '2003-12-01', 'Female', NULL,        'Waterloo'),
('Sabrina',                 'Kandeh',            '2002-11-09', 'Female', '076901234', 'Freetown'),
('Donald',                  'Sheku',             '2001-02-23', 'Other',   '078012345', 'Bo'),
('Alpha Abubakarr',         'Leigh',             '2000-06-16', 'Male',   '076111222', 'Makeni'),
('Alhaji Mawiya',           'Sow',               '2001-01-29', 'Male',   '078222333', 'Kenema'),
('Charles Nyakeh',          'Ensah',             '2002-10-08', 'Male',   '076333444', 'Port Loko'),
('Rayan Martin',            'Turay',             '2003-03-19', 'Male',   '078444555', 'Freetown'),
('Abdul Aziz',              'Sesay',             '2002-05-24', 'Male',   '076555666', 'Makeni'),
('Alfreda Victoria',        'Dumbuya',           '2001-08-30', 'Female', '078666777', 'Bo'),
('Oluwayemisi Zipporah',    'Delanjo-Obiwole',   '2002-12-12', 'Female', '076777888', 'Freetown'),
('Abdul Karim',             'Koroma',            '2003-01-17', 'Male',   NULL,        'Makeni'),
('Sharon Mary Ramatha',     'Koroma',            '2002-04-03', 'Female', '078999000', 'Port Loko'),
('Alhaji Osman', 'Bah', '2002-05-14', 'Male', '076111111', 'Freetown'),
('Andrew Bai', 'Conteh', '2003-08-21', 'Male', '078222222', 'Makeni'),
('Maria', 'Williams', '2002-11-09', 'Female', '076333333', 'Bo'),
('Alice Isatu', 'Bangura', '2001-07-30', 'Female', NULL, 'Kenema'),
('Nylander Franklyna Fatmata', 'Sesay', '2002-04-18', 'Female', NULL, 'Port Loko');



