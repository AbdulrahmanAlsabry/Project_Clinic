/*
============================================================================
Project Name: Clinic Management System Database
Description: This script creates the relational schema for a clinic 
             management system, including tables for persons, patients, 
             doctors, medical records, appointments, prescriptions, and payments.
RDBMS: Microsoft SQL Server
============================================================================
*/

-- 1. Database Creation and Selection
CREATE DATABASE ClinicDB;
GO
USE ClinicDB;
GO

-- 2. Table Creation with Professional Documentation

/* Table: Persons
   Description: Stores shared demographic information for both Patients and Doctors 
   to implement a clean data inheritance model and reduce redundancy.
*/
CREATE TABLE Persons (
    PersonID INT PRIMARY KEY IDENTITY(1,1), -- Unique identifier for each person
    Name NVARCHAR(200) NOT NULL,            -- Full name of the individual
    DateOfBirth DATE,                       -- Date of birth
    Gendor NVARCHAR(1),                     -- Gender representation (e.g., 'M', 'F')
    PhoneNumber NVARCHAR(30),               -- Contact phone number
    Email NVARCHAR(100),                    -- Email address for correspondence
    Address NVARCHAR(200)                   -- Residential address
);

/* Table: Patients
   Description: Represents the clinic's clients. It maintains a 1-to-1 relationship 
   with the Persons table for personal details.
*/
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY IDENTITY(1,1), -- Unique patient identifier
    PersonID INT NOT NULL,                   -- Foreign key linking to Persons table
    CONSTRAINT FK_Patients_Persons FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

/* Table: Doctors
   Description: Stores professional information for clinic physicians, linked 
   to the Persons table for demographic data.
*/
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY IDENTITY(1,1), -- Unique doctor identifier
    PersonID INT NOT NULL,                  -- Foreign key linking to Persons table
    Specialization NVARCHAR(100),           -- Area of medical expertise
    CONSTRAINT FK_Doctors_Persons FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

/* Table: MedicalRecords
   Description: Acts as a central repository for clinical documentation, 
   storing diagnoses and treatment notes.
*/
CREATE TABLE MedicalRecords (
    MedicalRecordID INT PRIMARY KEY IDENTITY(1,1), -- Unique record identifier
    VisitDescription NVARCHAR(200),                -- Summary of the clinical visit
    Diagnosis NVARCHAR(200),                       -- Final medical diagnosis
    AdditionalNotes NVARCHAR(200)                  -- Supplementary clinical observations
);

/* Table: Appointments
   Description: Manages the scheduling of clinic visits, linking patients and 
   doctors while associating them with a specific medical record.
*/
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY IDENTITY(1,1), -- Unique appointment identifier
    PatientID INT NOT NULL,                      -- Foreign key linking to Patients
    DoctorID INT NOT NULL,                       -- Foreign key linking to Doctors
    AppointmentDateTime DATETIME NOT NULL,       -- Scheduled date and time
    AppointmentStatus TINYINT,                   -- Status code (e.g., 1:Scheduled, 2:Cancelled, 3:Completed)
    MedicalRecordID INT,                         -- Foreign key linking to MedicalRecords (nullable until visit completion)
    CONSTRAINT FK_Appointments_Patients FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    CONSTRAINT FK_Appointments_Doctors FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    CONSTRAINT FK_Appointments_MedicalRecords FOREIGN KEY (MedicalRecordID) REFERENCES MedicalRecords(MedicalRecordID)
);

/* Table: Prescriptions
   Description: Details the medications prescribed to a patient during a 
   specific medical visit recorded in MedicalRecords.
*/
CREATE TABLE Prescriptions (
    PrescriptionID INT PRIMARY KEY IDENTITY(1,1), -- Unique prescription identifier
    MedicalRecordID INT NOT NULL,                 -- Foreign key linking to MedicalRecords
    MedicationName NVARCHAR(100),                 -- Name of the prescribed drug
    Dosage NVARCHAR(50),                          -- Prescribed dosage (e.g., 500mg)
    Frequency NVARCHAR(50),                       -- Intake frequency (e.g., twice daily)
    Instruction NVARCHAR(200),                    -- Additional administration instructions
    CONSTRAINT FK_Prescriptions_MedicalRecords FOREIGN KEY (MedicalRecordID) REFERENCES MedicalRecords(MedicalRecordID)
);

/* Table: Payments
   Description: Tracks all financial transactions related to appointments, 
   ensuring accurate billing and revenue records.
*/
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1), -- Unique payment identifier
    AppointmentID INT NOT NULL,              -- Foreign key linking to Appointments
    PaymentDate DATE NOT NULL,               -- Date of transaction
    PaymentMethod NVARCHAR(50),              -- Payment mode (e.g., Cash, Credit Card)
    AmountPaid DECIMAL(18, 2) NOT NULL,      -- Exact amount paid
    CONSTRAINT FK_Payments_Appointments FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

