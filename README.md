# 🏥 Public Health Clinic Records System

A complete MySQL database solution for managing public health clinic operations – patients, health workers, appointments, diagnoses, and treatments. This project demonstrates database design, data integrity, CRUD operations, and advanced SQL queries.

## 👥 Authors
- **Rayan Martin Turay**
- **Abdul Karim Koroma**
- **Foday Kamara**

---

## 📚 Table of Contents
- [Project Overview](#project-overview)
- [Database Schema](#database-schema)
- [Features](#features)
- [Setup & Installation](#setup--installation)
- [Sample Queries](#sample-queries)
- [Notes](#notes)

---

## Project Overview

This system models a real‑world public health clinic. It tracks:
- **Patients** – personal details, contact info, address.
- **Health Workers** – doctors/nurses and their departments.
- **Appointments** – visit dates, reasons, linked to patients and staff.
- **Medical Diagnoses** – conditions and clinical notes per appointment.
- **Treatments** – prescribed medicines, dosage, duration, and cost.

The SQL script (`BSEM1201F_Group2.sql`) creates the database, tables, constraints, sample data (20+ records each), and demonstrates a wide range of SQL operations.

---

## Database Schema

| Table | Primary Key | Foreign Key(s) | Description |
|-------|-------------|----------------|-------------|
| `Patient` | `Patient_ID` | – | Demographics and contact |
| `Health_Worker` | `Health_Worker_ID` | – | Staff roles and departments |
| `Appointment` | `Appointment_ID` | `Patient_ID`, `Health_Worker_ID` | Patient visits |
| `Medical_Diagnosis` | `Diagnoses_ID` | `Appointment_ID` | Diagnoses & notes |
| `Treatment` | `Treatment_ID` | `Diagnoses_ID` | Prescriptions and costs |

### 🔒 Constraints
- `Gender` ENUM(`'Male'`, `'Female'`, `'Other'`)
- `Role` ENUM(`'Doctor'`, `'Nurse'`)
- `Treatment_Cost` > 0 (CHECK constraint)
- All foreign keys enforce referential integrity

---

## Features

The script covers **essential SQL concepts**:

### Data Definition (DDL)
- `CREATE DATABASE` & `CREATE TABLE`
- `RENAME TABLE` (`Diagnoses` → `Medical_Diagnosis`)
- `ALTER TABLE … CHANGE` (rename column `Reason` → `Visit_Reason`)
- `ALTER TABLE … ADD CONSTRAINT` (CHECK constraint)

### Data Manipulation (DML)
- `INSERT` – 20+ realistic sample records per table
- `UPDATE` – modify existing records
- `DELETE` – remove temporary test records

### Data Querying (DQL)
- Basic `SELECT` (all columns / specific columns)
- Filtering with `WHERE` (single & multiple conditions)
- Logical operators `AND`, `OR`
- Range search `BETWEEN`
- Pattern matching `LIKE` (`%value%`, `value%`, `%value`)
- Set membership `IN`
- `NULL` handling (`IS NULL` / `IS NOT NULL`)
- Sorting `ORDER BY` (ASC / DESC)
- Limiting results `LIMIT`
- Aggregate functions (`COUNT`, `AVG`, `SUM`, `MAX`, `MIN`)
- Grouping `GROUP BY`

---

## Setup & Installation

### Prerequisites
- MySQL 5.7+ or MariaDB 10.2+ (or any compatible SQL database)

### Steps

1. **Download** the `BSEM1201F_Group2.sql` file.

2. **Run the script** using your MySQL client:
   ```bash
   mysql -u your_username -p

## Sample Queries

1. Female patients in Freetown
   ```sql
   SELECT First_Name, Last_Name, Phone_Number
   FROM Patient
   WHERE Gender = 'Female' AND Address = 'Freetown';

2. Total treatment cost per diagnosis
   ```sql
   SELECT d.Condition_Name, SUM(t.Treatment_Cost) AS Total_Cost
   FROM Medical_Diagnosis d
   JOIN Treatment t ON d.Diagnoses_ID = t.Diagnoses_ID
   GROUP BY d.Condition_Name
   ORDER BY Total_Cost DESC;

3. Appointments in February 2026 with cost > $200
   ```sql
   SELECT a.Visit_Date, p.First_Name, p.Last_Name, t.Treatment_Cost
   FROM Appointment a
   JOIN Patient p ON a.Patient_ID = p.Patient_ID
   JOIN Medical_Diagnosis d ON a.Appointment_ID = d.Appointment_ID
   JOIN Treatment t ON d.Diagnoses_ID = t.Diagnoses_ID
   WHERE a.Visit_Date BETWEEN '2026-02-01' AND '2026-02-28'
   AND t.Treatment_Cost > 200;

4. Patients missing phone numbers
   ```sql
   SELECT COUNT(*) AS Missing_Phone_Number
   FROM Patient
   WHERE Phone_Number IS NULL;

5. Average cost of treatments started in March 2026
   ```sql
   SELECT AVG(Treatment_Cost) AS Avg_March_Cost
   FROM Treatment
   WHERE Start_Date BETWEEN '2026-03-01' AND '2026-03-31';


## Notes

Dates – Sample data uses 2026 to remain future‑proof.

CHECK constraint – Requires MySQL 8.0.16+ for full enforcement. Older versions ignore it but the script still runs.

Foreign key order – Inserts respect dependency order: Patient → Health_Worker → Appointment → Medical_Diagnosis → Treatment.

Renames – The original Diagnoses table is renamed to Medical_Diagnosis and Reason column to Visit_Reason for clarity.

Realistic data – Patient names and addresses reflect Sierra Leonean cities (Freetown, Makeni, Bo, etc.). Medications are commonly used in public health.
