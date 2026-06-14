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