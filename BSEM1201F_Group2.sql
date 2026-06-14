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
    Reason           TEXT NULL,
    Patient_ID       INT          NOT NULL,
    Health_Worker_ID INT          NOT NULL,

    FOREIGN KEY (Patient_ID)       REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Health_Worker_ID) REFERENCES Health_Worker(Health_Worker_ID)
);

CREATE TABLE Diagnoses (
    Diagnoses_ID   INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Appointment_ID INT          NOT NULL,
    Condition_Name VARCHAR(15) NOT NULL,
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
    Treatment_Cost DECIMAL(3,2)  NOT NULL,

    FOREIGN KEY (Diagnoses_ID) REFERENCES Diagnoses(Diagnoses_ID)
);



 2. RENAME A TABLE
    Rename:  Diagnoses  →  Medical_Diagnosis


RENAME TABLE Diagnoses TO Medical_Diagnosis;

SELECT * FROM Medical_Diagnosis;   -- see table after rename (empty for now)


 3. RENAME A COLUMN
    Rename column:  Reason  →  Visit_Reason  in Appointment


ALTER TABLE appointment
CHANGE Reason Visit_Reason TEXT NULL;

SELECT * FROM Appointment         -- see column name change (empty for now)



 4. ADD A CONSTRAINT
    Add a CHECK constraint: Treatment_Cost must be > 0


ALTER TABLE Treatment
ADD CONSTRAINT chk_positive_cost CHECK (Treatment_Cost > 0);

SELECT * FROM Treatment;           -- confirm constraint added (empty for now)



5. INSERT SAMPLE DATA — PATIENTS (20 records)


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

SELECT * FROM Patient;


 6. INSERT SAMPLE DATA — HEALTH WORKERS (10 records)


INSERT INTO Health_Worker (Full_Name, Role, Department)
VALUES
(Sheikh Umar Kanu',      'Doctor', 'General Medicine'),
('Amadu Kamara',          'Doctor', 'Pediatrics'),
('Hawa Kallon',           'Nurse',  'Maternity'),
('Sulaiman Kallokoh',     'Doctor', 'Emergency'),
('Osman Bah',             'Nurse',  'Outpatient'),
('Santigie Foday Kamara', 'Doctor', 'Internal Medicine'),
('Mariama Kamara',        'Nurse',  'Surgery'),
('Dr. Ibrahim Sesay',     'Doctor', 'Cardiology'),
('Nurse Fatmata Conteh',  'Nurse',  'Family Planning'),
('Dr. Mohamed Bangura',   'Doctor', 'Dermatology');

SELECT * FROM Health_Worker;


 7. INSERT SAMPLE DATA — APPOINTMENTS (20 records)

INSERT INTO Appointment (Visit_Date, Visit_Reason, Patient_ID, Health_Worker_ID)
VALUES
('', 'Fever and headache',          1,  1),
('2026-02-03', 'Routine medical check-up',    2,  2),
('2026-02-05', 'Persistent cough',            3,  4),
('2026-02-07', 'Antenatal consultation',      4,  3),
('2026-02-09', 'Stomach pain',                5,  6),
('2026-02-11', 'Child immunization',          6,  2),
('2026-02-13', 'General body weakness',       7,  1),
('2026-02-15', 'Skin rash examination',       8,  10),
('2026-02-17', 'Blood pressure monitoring',   9,  8),
('2026-02-19', 'Annual health screening',     10, 5),
('2026-02-21', 'Malaria symptoms',            11, 1),
('2026-02-23', 'Chest pain assessment',       12, 8),
('2026-02-25', 'Post-surgery review',         13, 7),
('2026-02-27', 'Family planning consultation',14, 9),
('2026-03-01', 'Typhoid symptoms',            15, 6),
('2026-03-03', 'Severe headache',             16, 4),
('2026-03-05', 'Pregnancy follow-up',         17, 3),
('2026-03-07', 'Diabetes monitoring',         18, 8),
('2026-03-09', 'Back pain treatment',         19, 5),
('2026-03-11', 'Eye irritation',              20, 2);

SELECT * FROM Appointment;



 8. UPDATE & DELETE EXAMPLES — APPOINTMENT


 UPDATE
UPDATE Appointment
SET Visit_Reason = 'High fever and headache'
WHERE Appointment_ID = 1;

SELECT * FROM Appointment;

UPDATE Appointment
SET Visit_Reason = 'High fever, headache and chills'
WHERE Appointment_ID = 1;

SELECT * FROM Appointment;

 --INSERT then DELETE (done twice to demonstrate)
INSERT INTO Appointment (Visit_Date, Visit_Reason, Patient_ID, Health_Worker_ID)
VALUES ('2026-07-10', 'General Check-up', 1, 1);

SELECT * FROM Appointment;

DELETE FROM Appointment
WHERE Visit_Reason = 'General Check-up';

SELECT * FROM Appointment;


INSERT INTO Appointment (Visit_Date, Visit_Reason, Patient_ID, Health_Worker_ID)
VALUES ('2026-07-15', 'Test Visit', 2, 2);

SELECT * FROM Appointment;

DELETE FROM Appointment
WHERE Visit_Reason = 'Test Visit';

SELECT * FROM Appointment;



 9. INSERT SAMPLE DATA — MEDICAL_DIAGNOSIS (20 records)

INSERT INTO Medical_Diagnosis (Appointment_ID, Condition_Name, Notes)
VALUES
(1,  'Malaria',                      'Patient presented with high fever and chills.'),
(2,  'Routine Check-up',             'No significant abnormalities detected.'),
(3,  'Upper Respiratory Tract Infection', 'Persistent cough for one week.'),
(4,  'Pregnancy Monitoring',         'Routine antenatal examination completed.'),
(5,  'Gastritis',                    'Complaints of stomach discomfort after meals.'),
(6,  'Immunization Follow-up',       'Child vaccination schedule updated.'),
(7,  'Malaria',                      'Rapid diagnostic test returned positive.'),
(8,  'Dermatitis',                   'Patient advised to avoid skin irritants.'),
(9,  'Hypertension',                 'Blood pressure slightly elevated.'),
(10, 'General Medical Examination',  'Patient declared medically fit.'),
(11, 'Malaria',                      'Symptoms include headache and fever.'),
(12, 'Chest Infection',              'Further investigations recommended.'),
(13, 'Post-Surgical Recovery',       'Healing progressing normally.'),
(14, 'Family Planning Consultation', 'Counselling provided.'),
(15, 'Typhoid Fever',                'Widal test recommended.'),
(16, 'Migraine',                     'Recurring severe headaches reported.'),
(17, 'Pregnancy Follow-up',          'Mother and fetus stable.'),
(18, 'Diabetes Mellitus',            'Blood sugar monitoring advised.'),
(19, 'Muscle Strain',                'Pain relief medication prescribed.'),
(20, 'Conjunctivitis',               'Eye drops prescribed.');

SELECT * FROM Medical_Diagnosis;


 10. UPDATE & DELETE EXAMPLES — MEDICAL_DIAGNOSIS

-- UPDATE
UPDATE Medical_Diagnosis
SET Notes = 'Patient presented with severe fever and body weakness.'
WHERE Diagnoses_ID = 1;

SELECT * FROM Medical_Diagnosis;

UPDATE Medical_Diagnosis
SET Notes = 'Patient presented with severe fever, body weakness and chills.'
WHERE Diagnoses_ID = 1;

SELECT * FROM Medical_Diagnosis;

-- INSERT then DELETE
INSERT INTO Medical_Diagnosis (Appointment_ID, Condition_Name, Notes)
VALUES (1, 'Test Diagnosis', 'Temporary record');

SELECT * FROM Medical_Diagnosis;

DELETE FROM Medical_Diagnosis
WHERE Condition_Name = 'Test Diagnosis';

SELECT * FROM Medical_Diagnosis;

INSERT INTO Medical_Diagnosis (Appointment_ID, Condition_Name, Notes)
VALUES (2, 'Sample Diagnosis', 'Another temporary record');

SELECT * FROM Medical_Diagnosis;

DELETE FROM Medical_Diagnosis
WHERE Condition_Name = 'Sample Diagnosis';

SELECT * FROM Medical_Diagnosis;


 11. INSERT SAMPLE DATA — TREATMENT (20 records)

INSERT INTO Treatment (Diagnoses_ID, Medicine_Name, Dosage, Start_Date, End_Date, Treatment_Cost)
VALUES
(1,  'Artemether-Lumefantrine',   '4 tablets twice daily',      '2026-02-01', '2026-02-04', 250.00),
(2,  'Multivitamin Tablets',      '1 tablet daily',             '2026-02-03', '2026-02-09', 120.00),
(3,  'Amoxicillin',               '500mg three times daily',    '2026-02-05', '2026-02-12', 180.00),
(4,  'Folic Acid',                '1 tablet daily',             '2026-02-07', '2026-03-07', 150.00),
(5,  'Omeprazole',                '20mg once daily',            '2026-02-09', '2026-02-16', 140.00),
(6,  'Vitamin A',                 'Single dose',                '2026-02-11', '2026-02-11',  80.00),
(7,  'Artesunate',                '200mg daily',                '2026-02-13', '2026-02-16', 220.00),
(8,  'Hydrocortisone Cream',      'Apply twice daily',          '2026-02-15', '2026-02-22', 160.00),
(9,  'Amlodipine',                '5mg once daily',             '2026-02-17', '2026-03-17', 300.00),
(10, 'Paracetamol',               '500mg every 8 hours',        '2026-02-19', '2026-02-24',  90.00),
(11, 'Coartem',                   '4 tablets twice daily',      '2026-02-21', '2026-02-24', 240.00),
(12, 'Azithromycin',              '500mg once daily',           '2026-02-23', '2026-02-28', 260.00),
(13, 'Ibuprofen',                 '400mg three times daily',    '2026-02-25', '2026-03-04', 110.00),
(14, 'Depo-Provera',              'One injection',              '2026-02-27', '2026-05-27', 350.00),
(15, 'Ciprofloxacin',             '500mg twice daily',          '2026-03-01', '2026-03-07', 280.00),
(16, 'Sumatriptan',               '50mg when needed',           '2026-03-03', '2026-03-10', 320.00),
(17, 'Iron Supplements',          '1 tablet daily',             '2026-03-05', '2026-04-05', 170.00),
(18, 'Metformin',                 '500mg twice daily',          '2026-03-07', '2026-04-07', 290.00),
(19, 'Diclofenac',                '50mg twice daily',           '2026-03-09', '2026-03-16', 130.00),
(20, 'Chloramphenicol Eye Drops', '2 drops four times daily',   '2026-03-11', '2026-03-18',  95.00);

SELECT * FROM Treatment;


 12. UPDATE & DELETE EXAMPLES — TREATMENT


-- UPDATE
UPDATE Treatment
SET End_Date = '2026-04-14'
WHERE Treatment_ID = 18;

SELECT * FROM Treatment;

UPDATE Treatment
SET End_Date = '2026-04-21'
WHERE Treatment_ID = 18;

SELECT * FROM Treatment;

-- INSERT then DELETE
INSERT INTO Treatment (Diagnoses_ID, Medicine_Name, Dosage, Start_Date, End_Date, Treatment_Cost)
VALUES (1, 'Test Medicine', '1 tablet daily', '2026-03-20', '2026-03-22', 50.00);

SELECT * FROM Treatment;

DELETE FROM Treatment
WHERE Medicine_Name = 'Test Medicine';

SELECT * FROM Treatment;


INSERT INTO Treatment (Diagnoses_ID, Medicine_Name, Dosage, Start_Date, End_Date, Treatment_Cost)
VALUES (2, 'Sample Medicine', '2 tablets daily', '2026-03-25', '2026-03-27', 75.00);

SELECT * FROM Treatment;

DELETE FROM Treatment
WHERE Medicine_Name = 'Sample Medicine';

SELECT * FROM Treatment;


13. HOW TO SEARCH FOR DATA IN A TABLE
    (Retrieve all records from a table)

SELECT * FROM Patient;

SELECT * FROM Treatment;



 14. HOW TO RETRIEVE DATA FROM A SPECIFIC COLUMN

 one column
SELECT First_Name FROM Patient;

 multiple columns
SELECT Medicine_Name, Dosage FROM Treatment;



15. HOW TO SEARCH FOR A SPECIFIC RECORD
SELECT * FROM Patient
WHERE Patient_ID = 5;


SELECT * FROM Treatment
WHERE Treatment_ID = 9;



16. HOW TO SEARCH USING ONE CONDITION

SELECT * FROM Patient
WHERE Gender = 'Female';

SELECT * FROM Treatment
WHERE Treatment_Cost > 200.00;



17. HOW TO SEARCH USING MULTIPLE CONDITIONS


SELECT * FROM Patient
WHERE Gender = 'Female'
AND Address = 'Freetown';

SELECT * FROM Treatment
WHERE Treatment_Cost > 200.00
AND Start_Date >= '2026-02-20';


-- 18. LOGICAL OPERATORS

-- OR operator
SELECT * FROM Patient
WHERE Address = 'Freetown'
OR Address = 'Makeni';

-- OR operator
SELECT * FROM Treatment
WHERE Medicine_Name = 'Malaria'
OR Treatment_Cost < 100.00;

-- AND operator
SELECT * FROM Appointment
WHERE Health_Worker_ID = 1
AND Visit_Date >= '2026-02-01';

-- AND operator
SELECT * FROM Treatment
WHERE Treatment_Cost >= 200.00
AND Treatment_Cost <= 300.00;

-- BETWEEN operator
SELECT * FROM Appointment
WHERE Visit_Date
BETWEEN '2026-02-01' AND '2026-02-28';

-- BETWEEN operator
SELECT * FROM Treatment
WHERE Treatment_Cost
BETWEEN 100.00 AND 250.00;

 19. LIKE OPERATOR — 3 PATTERNS


 Pattern 1: Starts with a value  (%)
SELECT * FROM Patient
WHERE First_Name LIKE 'A%';


SELECT * FROM Treatment
WHERE Medicine_Name LIKE 'A%';

 Pattern 2: Ends with a value  (%)

SELECT * FROM Patient
WHERE Last_Name LIKE '%a';

SELECT * FROM Treatment
WHERE Medicine_Name LIKE '%in';

 Pattern 3: Contains a value  (%value%)
SELECT * FROM Patient
WHERE Address LIKE '%town%';


SELECT * FROM Medical_Diagnosis
WHERE Notes LIKE '%fever%';



 20. SEARCH FOR A RECORD IN A LIST — IN OPERATOR



SELECT * FROM Patient
WHERE Address IN ('Freetown', 'Makeni', 'Bo');


SELECT * FROM Treatment
WHERE Medicine_Name IN ('Paracetamol', 'Ibuprofen', 'Coartem');



21. SEARCH FOR NULL VALUES — IS NULL / IS NOT NULL

SELECT * FROM Patient
WHERE Phone_Number IS NULL;

SELECT * FROM Medical_Diagnosis
WHERE Notes IS NULL;

SELECT * FROM Patient
WHERE Phone_Number IS NOT NULL;

SELECT * FROM Medical_Diagnosis
WHERE Notes IS NOT NULL;

 22. LIMIT CLAUSE — LIMIT SPECIFIC RECORDS

SELECT * FROM Treatment
ORDER BY Treatment_Cost DESC
LIMIT 5;

SELECT * FROM Patient
LIMIT 10;

 23. ORDER BY — SORT RESULTS


 Ascending (first time)
SELECT * FROM Treatment
ORDER BY Treatment_Cost ASC;

 Ascending (second time)
SELECT * FROM Patient
ORDER BY Last_Name ASC;

 Descending (first time)
SELECT * FROM Treatment
ORDER BY Treatment_Cost DESC;

 Descending (second time)
SELECT * FROM Appointment
ORDER BY Visit_Date DESC;


24. AGGREGATE FUNCTIONS


SELECT COUNT(*) AS Total_Patients FROM Patient;

SELECT COUNT(*) AS Total_Treatments FROM Treatment;

SELECT AVG(Treatment_Cost) AS Average_Treatment_Cost FROM Treatment;

SELECT AVG(Treatment_Cost) AS Average_Cost_February
FROM Treatment
WHERE Start_Date BETWEEN '2026-02-01' AND '2026-02-28';

SELECT SUM(Treatment_Cost) AS Total_Treatment_Cost FROM Treatment;

SELECT SUM(Treatment_Cost) AS Total_Cost_March
FROM Treatment
WHERE Start_Date BETWEEN '2026-03-01' AND '2026-03-31';

SELECT MAX(Treatment_Cost) AS Highest_Treatment_Cost FROM Treatment;

SELECT MAX(Treatment_Cost) AS Highest_Cost_Per_Medicine,
       Medicine_Name
FROM Treatment
GROUP BY Medicine_Name
ORDER BY Highest_Cost_Per_Medicine DESC;

SELECT MIN(Treatment_Cost) AS Lowest_Treatment_Cost FROM Treatment;

SELECT MIN(Treatment_Cost) AS Lowest_Cost_Per_Medicine,
       Medicine_Name
FROM Treatment
GROUP BY Medicine_Name
ORDER BY Lowest_Cost_Per_Medicine ASC;

-- GROUP BY — Gender count
SELECT Gender, COUNT(*) AS Total
FROM Patient
GROUP BY Gender;

-- GROUP BY — Department count
SELECT Department, COUNT(*) AS Total_Workers
FROM Health_Worker
GROUP BY Department;