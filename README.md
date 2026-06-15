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
- [File Structure](#file-structure)
- [Notes](#notes)
- [License](#license)

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
