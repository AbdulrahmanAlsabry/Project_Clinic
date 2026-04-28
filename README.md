# Clinic Management System Database 🏥

A professional relational database schema designed for managing clinic operations, including patient records, doctor schedules, medical history, prescriptions, and financial transactions. This project is built using **Microsoft SQL Server (T-SQL)**.

## 📌 Project Overview

This project provides a robust backend structure for a healthcare facility. It focuses on data integrity, reducing redundancy through a shared inheritance model for persons, and providing a clear relational mapping for complex medical workflows.

## 🏗️ Database Architecture

The system is built on a relational model with the following key entities:

* **Persons:** A base table for demographic data shared by both patients and doctors.
* **Patients & Doctors:** Specialized tables linked to the Persons table.
* **Medical Records:** Tracks patient visits, symptoms, and diagnoses.
* **Appointments:** Manages scheduling between patients and doctors with status tracking.
* **Prescriptions:** Detailed medication instructions linked to medical visits.
* **Payments:** Financial tracking for all clinic services.

## 🚀 Getting Started

### Prerequisites
* Microsoft SQL Server 2019 or later.
* SQL Server Management Studio (SSMS) or Azure Data Studio.

### Installation & Setup

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/clinic-management-db.git
    ```

2.  **Create the Schema:**
    Open and execute `Schema_Creation.sql` to generate the database and tables.
    
3.  **Seed Initial Data:**
    Execute `Data_Seeding.sql` to populate the database with professional sample data (20+ patients and 5 doctors).

4.  **Restore Backup (Optional):**
    You can also use the `ClinicDB.bak` file to restore the full database state directly into SQL Server.

## 🛠️ Key SQL Features Used

* **Relational Integrity:** Implemented via Foreign Keys and Constraints.
* **Identity Columns:** For automated Primary Key management.
* **Data Types:** Optimized use of `NVARCHAR`, `DECIMAL`, and `DATE/DATETIME`.
* **Documentation:** All scripts are heavily commented for clarity and maintenance.

## 📂 Project Structure

* `Schema_Creation.sql`: Script for database structure and table creation.
* `Data_Seeding.sql`: Script containing sample data for testing.
* `ClinicDB.bak`: Full database backup file.
* `Project_Clinic.png`: ER Diagram/Schema visualization.

---
*Created by [Abdulrahman Faisal]*
