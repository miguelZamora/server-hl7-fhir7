// ==============================================
// TODOS LOS INSERTS PARA MONGODB EN UN SOLO ARCHIVO
// ==============================================

db = db.getSiblingDB('clinica_db');

// ==============================================
// PRIMEROS RECURSOS (Endpoint, HealthcareService, Location, Organization, OrganizationAffiliation, RelatedPerson)
// ==============================================

// 1. Endpoint
db.endpoints.insertOne({
    resourceType: "Endpoint",
    _id: "example",
    status: "active",
    connectionType: { coding: [{ system: "http://terminology.hl7.org/CodeSystem/endpoint-connection-type", code: "hl7-fhir-rest" }] },
    name: "CarePlan repository",
    address: "https://sqlonfhir-dstu2.azurewebsites.net/fhir",
    managingOrganization: { reference: "Organization/1" }
});

// 2. HealthcareService
db.healthcareservices.insertOne({
    resourceType: "HealthcareService",
    _id: "example",
    active: true,
    name: "Consulting psychologists",
    providedBy: { reference: "Organization/f001" },
    comment: "Specialist psychology services"
});

// 3. Location
db.locations.insertOne({
    resourceType: "Location",
    _id: "1",
    status: "active",
    name: "South Wing, second floor",
    address: { line: ["Galapagosweg 91, Building A"], city: "Den Burg" }
});

// 4. Organization
db.organizations.insertOne({
    resourceType: "Organization",
    _id: "hl7",
    name: "Health Level Seven International",
    alias: ["HL7 International"],
    contact: [{
        telecom: [{ system: "phone", value: "(734) 677-7777" }, { system: "email", value: "hq@HL7.org" }],
        address: { line: ["3300 Washtenaw Avenue, Suite 227"], city: "Ann Arbor" }
    }]
});

// 5. OrganizationAffiliation
db.orgaffiliations.insertOne({
    resourceType: "OrganizationAffiliation",
    _id: "example",
    active: true,
    organization: { reference: "Organization/hl7pay" },
    participatingOrganization: { reference: "Organization/f001" },
    code: [{ coding: [{ code: "provider" }] }],
    period: { start: "2012-01-01", end: "2012-03-31" }
});

// 6. RelatedPerson
db.relatedpersons.insertOne({
    resourceType: "RelatedPerson",
    _id: "benedicte",
    patient: { reference: "Patient/example" },
    relationship: [{ coding: [{ code: "WIFE" }] }],
    name: [{ family: "du Marché", given: ["Bénédicte"] }],
    telecom: [{ system: "phone", value: "+33 (237) 998327" }],
    gender: "female",
    address: [{ line: ["43, Place du Marché Sainte Catherine"] }]
});

// ==============================================
// RECURSOS ADICIONALES: BiologicallyDerivedProduct, Device, DeviceMetric, NutritionProduct, Substance
// ==============================================

// 7. BiologicallyDerivedProduct
db.biologicallyderivedproducts.insertOne({
    resourceType: "BiologicallyDerivedProduct",
    _id: "example",
    identifier: [{ value: "A9999E0398A999921123456A00000" }],
    productCode: { coding: [{ code: "E0398" }] },
    division: "A00000",
    productStatus: { code: "available" },
    expirationDate: "2021-08-02T23:59:00-05:00",
    storageTempRequirements: { low: { value: 1, unit: "degrees C" }, high: { value: 6, unit: "degrees C" } },
    property: [
        { type: { coding: [{ code: "ABORhD" }] }, valueCodeableConcept: { coding: [{ code: "62", display: "A RhD Positive" }] } },
        { type: { coding: [{ code: "Donor" }] }, valueCodeableConcept: { coding: [{ code: "V", display: "Volunteer" }] } }
    ],
    processingFacility: [{ reference: "Organization/A9999" }]
});

// 8. Device
db.devices.insertOne({
    resourceType: "Device",
    _id: "and20601bpmonitor",
    manufacturer: "A&D Medical",
    serialNumber: "5091100966",
    name: [{ value: "AND BP UA-767PBT-C", type: "user-friendly-name" }],
    modelNumber: "UA-767PBT-C",
    type: [{ text: "MDC_MOC_VMS_MDS_SIMP: Personal Health Device" }],
    udiCarrier: [{ deviceIdentifier: "39183189818", carrierHRF: "(01)39183189818(21)5091100966", entryType: "unknown" }],
    version: [{ value: "1.0" }]
});

// 9. DeviceMetric
db.devicemetrics.insertOne({
    resourceType: "DeviceMetric",
    _id: "example",
    identifier: [{ value: "345675" }],
    type: { coding: [{ code: "150456", display: "MDC_PULS_OXIM_SAT_O2" }] },
    unit: { coding: [{ code: "262688", display: "MDC_DIM_PERCENT" }] },
    device: { reference: "Device/dev1" },
    operationalStatus: "on",
    color: "blue",
    category: "measurement",
    measurementFrequency: { value: 1, unit: "Hertz", code: "Hz" },
    calibration: [{ type: "two-point", state: "calibrated", time: "2016-12-28T09:03:04-05:00" }]
});

// 10. NutritionProduct
db.nutritionproducts.insertOne({
    resourceType: "NutritionProduct",
    _id: "example",
    code: { coding: [{ system: "http://snomed.info/sct", code: "227507002" }] },
    status: "active",
    category: [{ coding: [{ system: "http://snomed.info/sct", code: "227313005" }] }],
    instance: [{ identifier: [{ system: "http://example.org/foodserials", value: "77239487" }] }]
});

// 11. Substance
db.substances.insertOne({
    resourceType: "Substance",
    _id: "example",
    identifier: [{ value: "1463" }],
    instance: false,
    status: "active",
    category: [{ coding: [{ system: "http://terminology.hl7.org/CodeSystem/substance-category", code: "allergen", display: "Allergen" }] }],
    code: { concept: { text: "apitoxin (Honey Bee Venom)" } }
});

// ==============================================
// RECURSOS: Appointment, AppointmentResponse, Schedule, Slot, Task, Transport, VerificationResult
// ==============================================

// 12. Appointment
db.appointments.insertOne({
    resourceType: "Appointment",
    _id: "example",
    status: "booked",
    start: ISODate("2024-12-01T10:00:00Z"),
    end: ISODate("2024-12-01T10:30:00Z"),
    participant: [
        { actor: { reference: "Patient/example", display: "Peter James Chalmers" }, required: "required", status: "accepted" },
        { actor: { reference: "Practitioner/example", display: "Dr Adam Careful" }, required: "required", status: "accepted" }
    ]
});

// 13. AppointmentResponse
db.appointmentresponses.insertOne({
    resourceType: "AppointmentResponse",
    _id: "example",
    appointment: { reference: "Appointment/example", display: "Brian MRI results discussion" },
    actor: { reference: "Patient/example", display: "Peter James Chalmers" },
    participantStatus: "accepted"
});

// 14. Schedule
db.schedules.insertOne({
    resourceType: "Schedule",
    _id: "example",
    active: true,
    name: "Burgers UMC, South Wing - Immunizations",
    actor: [{ reference: "Location/1", display: "Burgers UMC, South Wing, second floor" }],
    comment: "The slots attached to this schedule should be specialized to cover immunizations"
});

// 15. Slot
db.slots.insertOne({
    resourceType: "Slot",
    _id: "example",
    schedule: { reference: "Schedule/example" },
    status: "free",
    start: ISODate("2013-12-25T09:15:00Z"),
    end: ISODate("2013-12-25T09:30:00Z"),
    comment: "Assessments should be performed before requesting appointments"
});

// 16. Task
db.tasks.insertOne({
    resourceType: "Task",
    _id: "example1",
    identifier: [{ value: "20170201-001" }],
    status: "in-progress",
    intent: "order",
    description: "Create order for getting specimen, Set up inhouse testing",
    for: { reference: "Patient/example", display: "Peter James Chalmers" },
    requester: { reference: "Practitioner/example", display: "Dr Adam Careful" },
    note: [{ text: "This is an example task" }]
});

// 17. Transport
db.transports.insertOne({
    resourceType: "Transport",
    _id: "simpledelivery",
    identifier: [{ value: "Transport1234" }],
    status: "completed",
    intent: "order",
    basedOn: [{ reference: "SupplyRequest/simpleorder" }],
    requestedLocation: { reference: "Transport/location-hospitalLab", display: "Requested location for item at City Hospital Lab" },
    currentLocation: { reference: "Transport/location-labA", display: "Current location for item at Lab A" }
});

// 18. VerificationResult
db.verificationresults.insertOne({
    resourceType: "VerificationResult",
    _id: "example",
    status: "attested"
});

// ==============================================
// DATOS DE PRUEBA ADICIONALES (coherentes y relacionados)
// ==============================================

// Organizations adicionales
db.organizations.insertMany([
    {
        resourceType: "Organization",
        _id: "org_hospital",
        name: "Hospital Clínico San Pablo",
        alias: ["HSP"],
        contact: [{ address: { line: ["Av. Libertador 1234"], city: "Santiago" }, telecom: [{ system: "phone", value: "+56 2 23456789" }] }]
    },
    {
        resourceType: "Organization",
        _id: "org_lab",
        name: "Laboratorio Médico Diagnóstico",
        alias: ["LMD"],
        contact: [{ address: { line: ["Calle Los Cerezos 567"], city: "Santiago" }, telecom: [{ system: "phone", value: "+56 2 29876543" }] }]
    }
]);

// Locations adicionales
db.locations.insertMany([
    { resourceType: "Location", _id: "loc_consulta1", status: "active", name: "Consultorio Médico 101", address: { line: ["Av. Libertador 1234, Piso 1"], city: "Santiago" } },
    { resourceType: "Location", _id: "loc_consulta2", status: "active", name: "Consultorio Médico 102", address: { line: ["Av. Libertador 1234, Piso 1"], city: "Santiago" } },
    { resourceType: "Location", _id: "loc_lab", status: "active", name: "Laboratorio Central", address: { line: ["Calle Los Cerezos 567"], city: "Santiago" } }
]);

// HealthcareServices adicionales
db.healthcareservices.insertMany([
    { resourceType: "HealthcareService", _id: "hs_cardio", active: true, name: "Cardiología", providedBy: { reference: "org_hospital" }, comment: "Especialidad en enfermedades del corazón" },
    { resourceType: "HealthcareService", _id: "hs_pediatria", active: true, name: "Pediatría", providedBy: { reference: "org_hospital" }, comment: "Atención para niños y adolescentes" }
]);

// Devices adicionales
db.devices.insertMany([
    { resourceType: "Device", _id: "dev_glucometer_01", manufacturer: "Roche", serialNumber: "SN87654321", modelNumber: "Accu-Chek Guide", name: [{ value: "Glucómetro", type: "user-friendly-name" }] },
    { resourceType: "Device", _id: "dev_ecg_01", manufacturer: "GE Healthcare", serialNumber: "SN55556666", modelNumber: "MAC 2000", name: [{ value: "Electrocardiógrafo", type: "user-friendly-name" }] }
]);

// DeviceMetrics adicionales
db.devicemetrics.insertMany([
    { resourceType: "DeviceMetric", _id: "dm_bp_presion", identifier: [{ value: "METRIC_BP_001" }], type: { coding: [{ code: "150456" }] }, unit: { coding: [{ code: "262688" }] }, device: { reference: "dev_bp_monitor_01" }, operationalStatus: "on", category: "measurement" },
    { resourceType: "DeviceMetric", _id: "dm_glucosa", identifier: [{ value: "METRIC_GLU_001" }], type: { coding: [{ code: "150458" }] }, unit: { coding: [{ code: "262688" }] }, device: { reference: "dev_glucometer_01" }, operationalStatus: "on", category: "measurement" }
]);

// BiologicallyDerivedProducts adicionales
db.biologicallyderivedproducts.insertMany([
    { resourceType: "BiologicallyDerivedProduct", _id: "bdp_blood_001", identifier: [{ value: "BLOOD2024001" }], productCode: { coding: [{ code: "B0398" }] }, productStatus: { code: "available" }, storageTempRequirements: { low: { value: 2 }, high: { value: 6 } }, property: [{ type: { coding: [{ code: "ABORhD" }] }, valueCodeableConcept: { coding: [{ code: "62" }] } }] },
    { resourceType: "BiologicallyDerivedProduct", _id: "bdp_blood_002", identifier: [{ value: "BLOOD2024002" }], productCode: { coding: [{ code: "B0399" }] }, productStatus: { code: "available" }, storageTempRequirements: { low: { value: 2 }, high: { value: 6 } }, property: [{ type: { coding: [{ code: "ABORhD" }] }, valueCodeableConcept: { coding: [{ code: "68" }] } }] }
]);

// NutritionProducts adicionales
db.nutritionproducts.insertMany([
    { resourceType: "NutritionProduct", _id: "np_suplemento_a", code: { coding: [{ code: "227507002" }] }, status: "active", category: [{ coding: [{ code: "227313005" }] }] },
    { resourceType: "NutritionProduct", _id: "np_formula_infantil", code: { coding: [{ code: "227509004" }] }, status: "active", category: [{ coding: [{ code: "227313007" }] }] }
]);

// Substances adicionales
db.substances.insertMany([
    { resourceType: "Substance", _id: "sub_paracetamol", identifier: [{ value: "SUB001" }], instance: false, status: "active", category: [{ coding: [{ code: "drug" }] }], code: { concept: { text: "Paracetamol" } } },
    { resourceType: "Substance", _id: "sub_ibuprofeno", identifier: [{ value: "SUB002" }], instance: false, status: "active", category: [{ coding: [{ code: "drug" }] }], code: { concept: { text: "Ibuprofeno" } } },
    { resourceType: "Substance", _id: "sub_penicilina", identifier: [{ value: "SUB003" }], instance: false, status: "active", category: [{ coding: [{ code: "allergen" }] }], code: { concept: { text: "Penicilina G" } } }
]);

print("✅ Todos los recursos FHIR han sido insertados correctamente en MongoDB");
print("📊 Colecciones creadas:");
print("   - endpoints, healthcareservices, locations, organizations, orgaffiliations, relatedpersons");
print("   - biologicallyderivedproducts, devices, devicemetrics, nutritionproducts, substances");
print("   - appointments, appointmentresponses, schedules, slots, tasks, transports, verificationresults");




// ==============================================
// INSERTS PARA: Encounter, EncounterHistory, EpisodeOfCare, Flag, Library, List
// ==============================================

// 19. Encounter
db.encounters.insertOne({
    resourceType: "Encounter",
    _id: "example",
    status: "in-progress",
    class: [{ coding: [{ system: "http://terminology.hl7.org/CodeSystem/v3-ActCode", code: "IMP", display: "inpatient encounter" }] }],
    subject: { reference: "Patient/example" },
    subjectStatus: { coding: [{ code: "receiving-care" }] }
});

// 20. EncounterHistory
db.encounterhistories.insertOne({
    resourceType: "EncounterHistory",
    _id: "example",
    encounter: { reference: "Encounter/example" },
    identifier: [{ value: "v2452" }],
    status: "in-progress",
    subject: { reference: "Patient/example" }
});

// 21. EpisodeOfCare
db.episodeofcares.insertOne({
    resourceType: "EpisodeOfCare",
    _id: "example",
    identifier: [{ value: "123" }],
    status: "active",
    patient: { reference: "Patient/example" },
    managingOrganization: { reference: "Organization/hl7" },
    period: { start: "2014-09-01" }
});

// 22. Flag
db.flags.insertOne({
    resourceType: "Flag",
    _id: "example",
    status: "inactive",
    category: [{ coding: [{ system: "http://terminology.hl7.org/CodeSystem/flag-category", code: "safety" }] }],
    code: { coding: [{ code: "bigdog" }], text: "Patient has a big dog at his home" },
    subject: { reference: "Patient/example", display: "Peter Patient" },
    period: { start: "2015-01-17", end: "2016-12-01" },
    author: { reference: "Practitioner/example", display: "Nancy Nurse" }
});

// 23. Library
db.libraries.insertOne({
    resourceType: "Library",
    _id: "example",
    identifier: [{ value: "ChlamydiaScreening_Common" }],
    version: "2.0.0",
    title: "Chlamydia Screening Common Library",
    status: "draft",
    description: "Common Logic for adherence to Chlamydia Screening guidelines",
    type: { coding: [{ code: "logic-library" }] }
});

// 24. List
db.lists.insertOne({
    resourceType: "List",
    _id: "example",
    status: "current",
    mode: "changes",
    subject: [{ reference: "Patient/example" }],
    date: "2012-11-25T22:17:00+11:00",
    entry: [
        { flag: { text: "Deleted due to error" }, deleted: true, item: { reference: "Condition/example" } },
        { flag: { text: "Added" }, item: { reference: "Condition/example2" } }
    ]
});

print("✅ Recursos Encounter, EpisodeOfCare, Flag, Library, List insertados correctamente");