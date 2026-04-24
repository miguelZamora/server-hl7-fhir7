-- ==============================================
-- TODOS LOS RECURSOS FHIR - DATOS DE PRUEBA COHERENTES
-- ==============================================

-- ==============================================
-- 1. ORGANIZATION (Organizaciones)
-- ==============================================
CREATE TABLE Organization (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(255),
    alias VARCHAR(255),
    address_line TEXT,
    city VARCHAR(100),
    phone VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO Organization (id, name, alias, address_line, city, phone, email) VALUES
('org_hospital', 'Hospital Clínico San Pablo', 'HSP', 'Av. Libertador 1234', 'Santiago', '+56 2 23456789', 'contacto@sanpablo.cl'),
('org_lab', 'Laboratorio Médico Diagnóstico', 'LMD', 'Calle Los Cerezos 567', 'Santiago', '+56 2 29876543', 'resultados@lmd.cl'),
('org_aseguradora', 'SaludSeguro S.A.', 'SSA', 'Av. Providencia 890', 'Santiago', '+56 2 24567890', 'atencion@saludseguro.cl'),
('org_farmacia', 'Farmacias Cruz Verde', 'FCV', 'Boulevard Oriente 345', 'Santiago', '+56 2 25678901', 'ventas@cruzverde.cl');

-- ==============================================
-- 2. LOCATION (Ubicaciones)
-- ==============================================
CREATE TABLE Location (
    id VARCHAR(50) PRIMARY KEY,
    status VARCHAR(20),
    name VARCHAR(255),
    address_line TEXT,
    city VARCHAR(100)
);

INSERT INTO Location (id, status, name, address_line, city) VALUES
('loc_consulta1', 'active', 'Consultorio Médico 101', 'Av. Libertador 1234, Piso 1', 'Santiago'),
('loc_consulta2', 'active', 'Consultorio Médico 102', 'Av. Libertador 1234, Piso 1', 'Santiago'),
('loc_lab', 'active', 'Laboratorio Central', 'Calle Los Cerezos 567', 'Santiago'),
('loc_urgencias', 'active', 'Unidad de Urgencias', 'Av. Libertador 1234, Piso 0', 'Santiago'),
('loc_farmacia', 'active', 'Farmacia Interna', 'Av. Libertador 1234, Piso 0', 'Santiago');

-- ==============================================
-- 3. HEALTHCARESERVICE (Servicios de salud)
-- ==============================================
CREATE TABLE HealthcareService (
    id VARCHAR(50) PRIMARY KEY,
    active BOOLEAN,
    name VARCHAR(255),
    provided_by VARCHAR(100),
    comment TEXT
);

INSERT INTO HealthcareService (id, active, name, provided_by, comment) VALUES
('hs_medicina_general', true, 'Medicina General', 'org_hospital', 'Atención primaria y consultas generales'),
('hs_cardio', true, 'Cardiología', 'org_hospital', 'Especialidad en enfermedades del corazón'),
('hs_pediatria', true, 'Pediatría', 'org_hospital', 'Atención para niños y adolescentes'),
('hs_lab_clinico', true, 'Laboratorio Clínico', 'org_lab', 'Análisis de sangre, orina y otros'),
('hs_urgencias', true, 'Urgencias 24/7', 'org_hospital', 'Atención de emergencias las 24 horas');

-- ==============================================
-- 4. ENDPOINT (Puntos de conexión)
-- ==============================================
CREATE TABLE Endpoint (
    id VARCHAR(50) PRIMARY KEY,
    status VARCHAR(20),
    connection_type VARCHAR(100),
    name VARCHAR(255),
    address TEXT,
    organization_ref VARCHAR(100)
);

INSERT INTO Endpoint (id, status, connection_type, name, address, organization_ref) VALUES
('endpoint_fhir', 'active', 'hl7-fhir-rest', 'API FHIR Hospital', 'https://api.sanpablo.cl/fhir', 'org_hospital'),
('endpoint_lab', 'active', 'hl7-fhir-rest', 'API Laboratorio', 'https://api.lmd.cl/fhir', 'org_lab'),
('endpoint_secure', 'active', 'secure-email', 'Notificaciones Seguras', 'mailto:notificaciones@sanpablo.cl', 'org_hospital');

-- ==============================================
-- 5. ORGANIZATIONAFFILIATION (Afiliaciones)
-- ==============================================
CREATE TABLE OrganizationAffiliation (
    id VARCHAR(50) PRIMARY KEY,
    active BOOLEAN,
    organization_ref VARCHAR(100),
    participating_ref VARCHAR(100),
    code VARCHAR(50),
    period_start DATE,
    period_end DATE
);

INSERT INTO OrganizationAffiliation (id, active, organization_ref, participating_ref, code, period_start, period_end) VALUES
('aff_lab_hospital', true, 'org_hospital', 'org_lab', 'provider', '2023-01-01', NULL),
('aff_aseguradora', true, 'org_hospital', 'org_aseguradora', 'insurance', '2023-06-01', NULL),
('aff_farmacia', true, 'org_hospital', 'org_farmacia', 'pharmacy', '2023-03-01', NULL);

-- ==============================================
-- 6. RELATEDPERSON (Familiares / Contactos)
-- ==============================================
CREATE TABLE RelatedPerson (
    id VARCHAR(50) PRIMARY KEY,
    patient_ref VARCHAR(100),
    relationship VARCHAR(50),
    family_name VARCHAR(100),
    given_name VARCHAR(100),
    phone VARCHAR(50),
    gender VARCHAR(20),
    address_line TEXT
);

INSERT INTO RelatedPerson (id, patient_ref, relationship, family_name, given_name, phone, gender, address_line) VALUES
('rp_maria', 'Patient/pat_001', 'WIFE', 'González', 'María', '+56 9 12345678', 'female', 'Av. Los Alamos 456, Santiago'),
('rp_carlos', 'Patient/pat_002', 'HUSBAND', 'Rodríguez', 'Carlos', '+56 9 87654321', 'male', 'Calle Las Acacias 789, Santiago'),
('rp_ana', 'Patient/pat_001', 'DAUGHTER', 'González', 'Ana', '+56 9 11223344', 'female', 'Av. Los Alamos 456, Santiago'),
('rp_juan', 'Patient/pat_003', 'SON', 'Pérez', 'Juan', '+56 9 44332211', 'male', 'Pasaje Los Naranjos 123, Santiago');

-- ==============================================
-- 7. DEVICE (Dispositivos médicos)
-- ==============================================
CREATE TABLE Device (
    id VARCHAR(50) PRIMARY KEY,
    manufacturer VARCHAR(255),
    serial_number VARCHAR(100),
    model_number VARCHAR(100),
    name VARCHAR(255),
    type TEXT,
    udi_device_id VARCHAR(50),
    udi_carrier VARCHAR(255),
    version VARCHAR(50)
);

INSERT INTO Device (id, manufacturer, serial_number, model_number, name, type, udi_device_id, udi_carrier, version) VALUES
('dev_bp_monitor_01', 'A&D Medical', 'SN12345678', 'UA-767PBT-C', 'Monitor de Presión Arterial', 'Dispositivo de medición', '39183189818', '(01)39183189818(21)SN12345678', '1.0'),
('dev_glucometer_01', 'Roche', 'SN87654321', 'Accu-Chek Guide', 'Glucómetro', 'Dispositivo de medición', '76123456789', '(01)76123456789(21)SN87654321', '2.0'),
('dev_ecg_01', 'GE Healthcare', 'SN55556666', 'MAC 2000', 'Electrocardiógrafo', 'Equipo diagnóstico', '81234567890', '(01)81234567890(21)SN55556666', '1.5'),
('dev_ventilador_01', 'Philips', 'SN99998888', 'Respironics V60', 'Ventilador Mecánico', 'Equipo de soporte vital', '73456789012', '(01)73456789012(21)SN99998888', '3.0');

-- ==============================================
-- 8. DEVICEMETRIC (Métricas de dispositivos)
-- ==============================================
CREATE TABLE DeviceMetric (
    id VARCHAR(50) PRIMARY KEY,
    identifier VARCHAR(100),
    type_code VARCHAR(100),
    unit_code VARCHAR(100),
    device_ref VARCHAR(100),
    operational_status VARCHAR(20),
    color VARCHAR(20),
    category VARCHAR(20),
    measurement_frequency DECIMAL(10,2),
    calibration_type VARCHAR(20),
    calibration_state VARCHAR(20),
    calibration_time TIMESTAMP
);

INSERT INTO DeviceMetric (id, identifier, type_code, unit_code, device_ref, operational_status, color, category, measurement_frequency, calibration_type, calibration_state, calibration_time) VALUES
('dm_bp_presion', 'METRIC_BP_001', '150456', '262688', 'dev_bp_monitor_01', 'on', 'blue', 'measurement', 0.5, 'two-point', 'calibrated', '2024-01-15 08:00:00'),
('dm_bp_pulso', 'METRIC_BP_002', '150457', '262690', 'dev_bp_monitor_01', 'on', 'green', 'measurement', 0.5, 'one-point', 'calibrated', '2024-01-15 08:00:00'),
('dm_glucosa', 'METRIC_GLU_001', '150458', '262688', 'dev_glucometer_01', 'on', 'blue', 'measurement', 1.0, 'two-point', 'calibrated', '2024-02-01 10:00:00');

-- ==============================================
-- 9. BIOLOGICALLYDERIVEDPRODUCT (Productos biológicos)
-- ==============================================
CREATE TABLE BiologicallyDerivedProduct (
    id VARCHAR(50) PRIMARY KEY,
    identifier VARCHAR(100),
    product_code VARCHAR(50),
    division VARCHAR(50),
    product_status VARCHAR(20),
    expiration_date TIMESTAMP,
    temp_low DECIMAL(5,2),
    temp_high DECIMAL(5,2),
    blood_type VARCHAR(10),
    donor_type VARCHAR(10),
    processing_facility VARCHAR(100)
);

INSERT INTO BiologicallyDerivedProduct (id, identifier, product_code, division, product_status, expiration_date, temp_low, temp_high, blood_type, donor_type, processing_facility) VALUES
('bdp_blood_001', 'BLOOD2024001', 'B0398', 'DIV_A', 'available', '2025-12-31 23:59:00', 2, 6, '62', 'V', 'org_lab'),
('bdp_blood_002', 'BLOOD2024002', 'B0399', 'DIV_A', 'available', '2025-12-31 23:59:00', 2, 6, '68', 'V', 'org_lab'),
('bdp_plasma_001', 'PLASMA2024001', 'P0400', 'DIV_B', 'available', '2025-10-31 23:59:00', -20, -15, NULL, 'V', 'org_lab');

-- ==============================================
-- 10. NUTRITIONPRODUCT (Productos nutricionales)
-- ==============================================
CREATE TABLE NutritionProduct (
    id VARCHAR(50) PRIMARY KEY,
    snomed_code VARCHAR(50),
    status VARCHAR(20),
    category_code VARCHAR(50),
    instance_identifier VARCHAR(100)
);

INSERT INTO NutritionProduct (id, snomed_code, status, category_code, instance_identifier) VALUES
('np_suplemento_a', '227507002', 'active', '227313005', 'SUP001-2024'),
('np_leche_materna', '227508003', 'active', '227313006', 'LM001-2024'),
('np_formula_infantil', '227509004', 'active', '227313007', 'INF001-2024'),
('np_nutricion_enteral', '227510005', 'active', '227313008', 'ENT001-2024');

-- ==============================================
-- 11. SUBSTANCE (Sustancias)
-- ==============================================
CREATE TABLE Substance (
    id VARCHAR(50) PRIMARY KEY,
    identifier VARCHAR(100),
    name VARCHAR(255),
    category VARCHAR(50),
    status VARCHAR(20),
    is_instance BOOLEAN
);

INSERT INTO Substance (id, identifier, name, category, status, is_instance) VALUES
('sub_paracetamol', 'SUB001', 'Paracetamol', 'drug', 'active', false),
('sub_ibuprofeno', 'SUB002', 'Ibuprofeno', 'drug', 'active', false),
('sub_penicilina', 'SUB003', 'Penicilina G', 'allergen', 'active', false),
('sub_insulina', 'SUB004', 'Insulina Glargina', 'drug', 'active', false),
('sub_heparina', 'SUB005', 'Heparina Sódica', 'drug', 'active', false);




-- ==============================================
-- RECURSOS: Appointment, AppointmentResponse, Schedule, Slot, Task, Transport, VerificationResult
-- ==============================================

-- 12. APPOINTMENT
CREATE TABLE Appointment (
    id VARCHAR(50) PRIMARY KEY,
    status VARCHAR(20),
    reason TEXT,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    patient_ref VARCHAR(100),
    practitioner_ref VARCHAR(100)
);

INSERT INTO Appointment (id, status, reason, start_time, end_time, patient_ref, practitioner_ref)
VALUES ('example', 'booked', 'Consulta de control', '2024-12-01 10:00:00', '2024-12-01 10:30:00', 'Patient/example', 'Practitioner/example');

-- 13. APPOINTMENTRESPONSE
CREATE TABLE AppointmentResponse (
    id VARCHAR(50) PRIMARY KEY,
    appointment_ref VARCHAR(100),
    appointment_display VARCHAR(255),
    actor_ref VARCHAR(100),
    actor_display VARCHAR(255),
    participant_status VARCHAR(20)
);

INSERT INTO AppointmentResponse (id, appointment_ref, appointment_display, actor_ref, actor_display, participant_status)
VALUES ('example', 'Appointment/example', 'Brian MRI results discussion', 'Patient/example', 'Peter James Chalmers', 'accepted');

-- 14. SCHEDULE
CREATE TABLE Schedule (
    id VARCHAR(50) PRIMARY KEY,
    active BOOLEAN,
    name VARCHAR(255),
    actor_ref VARCHAR(100),
    actor_display VARCHAR(255),
    comment TEXT
);

INSERT INTO Schedule (id, active, name, actor_ref, actor_display, comment)
VALUES ('example', true, 'Burgers UMC, South Wing - Immunizations', 'Location/1', 'Burgers UMC, South Wing, second floor', 'The slots attached to this schedule should be specialized to cover immunizations');

-- 15. SLOT
CREATE TABLE Slot (
    id VARCHAR(50) PRIMARY KEY,
    schedule_ref VARCHAR(100),
    status VARCHAR(20),
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    comment TEXT
);

INSERT INTO Slot (id, schedule_ref, status, start_time, end_time, comment)
VALUES ('example', 'Schedule/example', 'free', '2013-12-25 09:15:00', '2013-12-25 09:30:00', 'Assessments should be performed before requesting appointments');

-- 16. TASK
CREATE TABLE Task (
    id VARCHAR(50) PRIMARY KEY,
    identifier VARCHAR(100),
    status VARCHAR(20),
    intent VARCHAR(50),
    description TEXT,
    patient_ref VARCHAR(100),
    requester_ref VARCHAR(100),
    note TEXT
);

INSERT INTO Task (id, identifier, status, intent, description, patient_ref, requester_ref, note)
VALUES ('example1', '20170201-001', 'in-progress', 'order', 'Create order for getting specimen, Set up inhouse testing', 'Patient/example', 'Practitioner/example', 'This is an example task');

-- 17. TRANSPORT
CREATE TABLE Transport (
    id VARCHAR(50) PRIMARY KEY,
    identifier VARCHAR(100),
    status VARCHAR(20),
    intent VARCHAR(50),
    based_on_ref VARCHAR(100),
    requested_location_ref VARCHAR(100),
    current_location_ref VARCHAR(100)
);

INSERT INTO Transport (id, identifier, status, intent, based_on_ref, requested_location_ref, current_location_ref)
VALUES ('simpledelivery', 'Transport1234', 'completed', 'order', 'SupplyRequest/simpleorder', 'Transport/location-hospitalLab', 'Transport/location-labA');

-- 18. VERIFICATIONRESULT
CREATE TABLE VerificationResult (
    id VARCHAR(50) PRIMARY KEY,
    status VARCHAR(50)
);

INSERT INTO VerificationResult (id, status)
VALUES ('example', 'attested');




-- ==============================================
-- RECURSOS: Encounter, EncounterHistory, EpisodeOfCare, Flag, Library, List
-- ==============================================

-- 19. ENCOUNTER
CREATE TABLE Encounter (
    id VARCHAR(50) PRIMARY KEY,
    status VARCHAR(20),
    class VARCHAR(20),
    subject_ref VARCHAR(100),
    subject_status VARCHAR(50)
);

INSERT INTO Encounter (id, status, class, subject_ref, subject_status)
VALUES ('example', 'in-progress', 'IMP', 'Patient/example', 'receiving-care');

-- 20. ENCOUNTERHISTORY
CREATE TABLE EncounterHistory (
    id VARCHAR(50) PRIMARY KEY,
    encounter_ref VARCHAR(100),
    identifier VARCHAR(100),
    status VARCHAR(20),
    subject_ref VARCHAR(100)
);

INSERT INTO EncounterHistory (id, encounter_ref, identifier, status, subject_ref)
VALUES ('example', 'Encounter/example', 'v2452', 'in-progress', 'Patient/example');

-- 21. EPISODEOFCARE
CREATE TABLE EpisodeOfCare (
    id VARCHAR(50) PRIMARY KEY,
    status VARCHAR(20),
    patient_ref VARCHAR(100),
    managing_org_ref VARCHAR(100),
    period_start DATE,
    period_end DATE
);

INSERT INTO EpisodeOfCare (id, status, patient_ref, managing_org_ref, period_start, period_end)
VALUES ('example', 'active', 'Patient/example', 'Organization/hl7', '2014-09-01', NULL);

-- 22. FLAG
CREATE TABLE Flag (
    id VARCHAR(50) PRIMARY KEY,
    status VARCHAR(20),
    category VARCHAR(50),
    code VARCHAR(50),
    code_text TEXT,
    subject_ref VARCHAR(100),
    period_start DATE,
    period_end DATE,
    author_ref VARCHAR(100)
);

INSERT INTO Flag (id, status, category, code, code_text, subject_ref, period_start, period_end, author_ref)
VALUES ('example', 'inactive', 'safety', 'bigdog', 'Patient has a big dog at his home', 'Patient/example', '2015-01-17', '2016-12-01', 'Practitioner/example');

-- 23. LIBRARY
CREATE TABLE Library (
    id VARCHAR(50) PRIMARY KEY,
    identifier VARCHAR(100),
    version VARCHAR(20),
    title VARCHAR(255),
    status VARCHAR(20),
    description TEXT,
    type_code VARCHAR(50)
);

INSERT INTO Library (id, identifier, version, title, status, description, type_code)
VALUES ('example', 'ChlamydiaScreening_Common', '2.0.0', 'Chlamydia Screening Common Library', 'draft', 'Common Logic for adherence to Chlamydia Screening guidelines', 'logic-library');

-- 24. LIST
CREATE TABLE List (
    id VARCHAR(50) PRIMARY KEY,
    status VARCHAR(20),
    mode VARCHAR(20),
    subject_ref VARCHAR(100),
    date TIMESTAMP,
    items TEXT
);

INSERT INTO List (id, status, mode, subject_ref, date, items)
VALUES ('example', 'current', 'changes', 'Patient/example', '2012-11-25 22:17:00', 'Condition/example, Condition/example2');




