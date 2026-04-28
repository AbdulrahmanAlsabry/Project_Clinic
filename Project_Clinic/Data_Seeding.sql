
/*
============================================================================
Project: Clinic Management System - Full Database Seeding
Description: This script populates the entire database with sample data, 
             including 20 Patients, 5 Doctors, and related medical records.
============================================================================
*/

USE ClinicDB;
GO

-- 1. POPULATING THE 'Persons' TABLE
-- Inserting 25 records (20 for Patients + 5 for Doctors)
INSERT INTO Persons (Name, DateOfBirth, Gendor, PhoneNumber, Email, Address)
VALUES 
-- Potential Doctors
('Dr. Salim Al-Haddad', '1975-03-12', 'M', '+967-711000111', 's.haddad@clinic.com', 'Sana''a, Al-Sabeen'),
('Dr. Nadia Mansour', '1980-06-25', 'F', '+967-711000222', 'n.mansour@clinic.com', 'Sana''a, Hadda'),
('Dr. Faisal Qassim', '1982-11-10', 'M', '+967-711000333', 'f.qassim@clinic.com', 'Aden, Crater'),
('Dr. Arwa Al-Maktari', '1985-01-05', 'F', '+967-711000444', 'a.maktari@clinic.com', 'Taiz, Al-Masha''a'),
('Dr. Khalid Al-Amri', '1978-09-15', 'M', '+967-711000555', 'k.amri@clinic.com', 'Sana''a, 60th St.'),
-- Potential Patients
('Ahmed Al-Raymi', '1990-05-12', 'M', '+967-771000001', 'ahmed@email.com', 'Sana''a'),
('Mona Al-Sabri', '1995-08-20', 'F', '+967-771000002', 'mona@email.com', 'Taiz'),
('Ali Al-Iryani', '1988-01-15', 'M', '+967-771000003', 'ali@email.com', 'Ibb'),
('Huda Al-Faqih', '2000-03-10', 'F', '+967-771000004', 'huda@email.com', 'Sana''a'),
('Omar Al-Wasabi', '1972-12-30', 'M', '+967-771000005', 'omar@email.com', 'Dhamar'),
('Laila Al-Saidi', '1992-04-14', 'F', '+967-771000006', 'laila@email.com', 'Aden'),
('Yasser Al-Baadani', '1985-07-22', 'M', '+967-771000007', 'yasser@email.com', 'Sana''a'),
('Sara Al-Kibsi', '1998-10-12', 'F', '+967-771000008', 'sara@email.com', 'Sana''a'),
('Zaid Al-Mutawakel', '1983-05-05', 'M', '+967-771000009', 'zaid@email.com', 'Sana''a'),
('Amal Al-Ansi', '1994-02-01', 'F', '+967-771000010', 'amal@email.com', 'Sana''a'),
('Saeed Al-Ghaithi', '1970-11-20', 'M', '+967-771000011', 'saeed@email.com', 'Marib'),
('Noura Al-Hubaishi', '1999-09-15', 'F', '+967-771000012', 'noura@email.com', 'Taiz'),
('Hamza Al-Dailami', '1991-04-30', 'M', '+967-771000013', 'hamza@email.com', 'Sana''a'),
('Zainab Al-Kohlani', '1986-12-12', 'F', '+967-771000014', 'zainab@email.com', 'Sana''a'),
('Adel Al-Asri', '1979-08-08', 'M', '+967-771000015', 'adel@email.com', 'Aden'),
('Salma Al-Sharabi', '1997-06-18', 'F', '+967-771000016', 'salma@email.com', 'Taiz'),
('Fahd Al-Rawdani', '1982-10-10', 'M', '+967-771000017', 'fahd@email.com', 'Sana''a'),
('Rania Al-Ahdal', '1993-02-28', 'F', '+967-771000018', 'rania@email.com', 'Hodeidah'),
('Bassem Al-Wadei', '1987-07-07', 'M', '+967-771000019', 'bassem@email.com', 'Amran'),
('Hana Al-Shami', '2001-01-15', 'F', '+967-771000020', 'hana@email.com', 'Sana''a');

-- 2. POPULATING THE 'Doctors' TABLE (Using first 5 PersonIDs)
INSERT INTO Doctors (PersonID, Specialization)
VALUES (1, 'Cardiology'), (2, 'Pediatrics'), (3, 'Dermatology'), (4, 'Internal Medicine'), (5, 'Orthopedics');

-- 3. POPULATING THE 'Patients' TABLE (Using PersonIDs 6 to 25)
INSERT INTO Patients (PersonID)
SELECT PersonID FROM Persons WHERE PersonID > 5;

-- 4. POPULATING THE 'MedicalRecords' TABLE
INSERT INTO MedicalRecords (VisitDescription, Diagnosis, AdditionalNotes)
VALUES 
('Routine checkup', 'Healthy', 'No issues found'),
('Severe headache and fever', 'Common Flu', 'Prescribed rest'),
('Chronic back pain', 'Muscle Strain', 'Physical therapy recommended'),
('Skin rash examination', 'Contact Dermatitis', 'Avoid allergens'),
('Annual pediatric screening', 'Normal Growth', 'Up to date with vaccines');

-- 5. POPULATING THE 'Appointments' TABLE
-- Linking Patients, Doctors, and Medical Records
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDateTime, AppointmentStatus, MedicalRecordID)
VALUES 
(1, 1, '2026-04-20 09:00', 3, 1),
(2, 2, '2026-04-20 10:30', 3, 2),
(3, 5, '2026-04-21 11:00', 3, 3),
(4, 3, '2026-04-21 13:00', 3, 4),
(5, 4, '2026-04-22 08:30', 3, 5),
(6, 1, '2026-04-23 10:00', 1, NULL), -- Scheduled (Not completed)
(7, 2, '2026-04-23 11:00', 1, NULL);

-- 6. POPULATING THE 'Prescriptions' TABLE
INSERT INTO Prescriptions (MedicalRecordID, MedicationName, Dosage, Frequency, Instruction)
VALUES 
(2, 'Paracetamol', '500mg', '3 times daily', 'After meals'),
(3, 'Ibuprofen', '400mg', 'Twice daily', 'When in pain'),
(4, 'Hydrocortisone Cream', '1%', 'Twice daily', 'Apply to affected area');

-- 7. POPULATING THE 'Payments' TABLE
INSERT INTO Payments (AppointmentID, PaymentDate, PaymentMethod, AmountPaid)
VALUES 
(1, '2026-04-20', 'Cash', 50.00),
(2, '2026-04-20', 'Credit Card', 45.00),
(3, '2026-04-21', 'Cash', 60.00),
(4, '2026-04-21', 'Insurance', 40.00),
(5, '2026-04-22', 'Cash', 35.00);
