// ==============================================
// INSERTS PARA RECURSOS DE INFRAESTRUCTURA FHIR
// ==============================================

// 25. CapabilityStatement
db.capabilitystatements.insertOne({
    resourceType: "CapabilityStatement",
    _id: "example",
    url: "urn:uuid:68d043b5-9ecf-4559-a57a-396e0d452311",
    version: "20130510",
    name: "ACMEEHR",
    title: "ACME EHR capability statement",
    status: "draft",
    date: "2012-01-04",
    description: "Main EHR capability statement",
    publisher: "ACME Corporation",
    kind: "instance",
    fhirVersion: "5.0.0",
    format: ["json", "xml"]
});

// 26. CompartmentDefinition
db.compartmentdefinitions.insertOne({
    resourceType: "CompartmentDefinition",
    _id: "patient",
    url: "http://hl7.org/fhir/CompartmentDefinition/patient",
    name: "Base FHIR compartment definition for Patient",
    status: "draft",
    code: "Patient",
    description: "There is an instance of the patient compartment for each patient resource",
    search: true,
    resource: []
});

// 27. GraphDefinition
db.graphdefinitions.insertOne({
    resourceType: "GraphDefinition",
    _id: "example",
    url: "http://h7.org/fhir/GraphDefinition/example",
    name: "DocumentGenerationTemplate",
    title: "Document Generation Template",
    status: "draft",
    description: "Specify to include list references when generating a document",
    start: "comp1",
    node: [
        { nodeId: "comp1", description: "The base composition", type: "Composition" },
        { nodeId: "list1", description: "A list resource", type: "List" }
    ]
});

// 28. ImplementationGuide
db.implementationguides.insertOne({
    resourceType: "ImplementationGuide",
    _id: "example",
    url: "http://hl7.org/fhir/us/daf",
    version: "0",
    name: "DataAccessFrameworkDAF",
    title: "Data Access Framework (DAF)",
    status: "draft",
    packageId: "hl7.fhir.us.daf",
    description: "The Data Access Framework (DAF) Initiative",
    fhirVersion: ["5.0.0"]
});

// 29. MessageDefinition
db.messagedefinitions.insertOne({
    resourceType: "MessageDefinition",
    _id: "example",
    url: "http://hl7.org/fhir/MessageDefinition/example",
    name: "EXAMPLE",
    title: "Message definition base example",
    status: "draft",
    eventCoding: { code: "admin-notify" },
    category: "notification",
    description: "Message definition base example"
});

// 30. OperationDefinition
db.operationdefinitions.insertOne({
    resourceType: "OperationDefinition",
    _id: "example",
    url: "http://hl7.org/fhir/OperationDefinition/example",
    name: "PopulateQuestionnaire",
    title: "Populate Questionnaire",
    status: "draft",
    kind: "operation",
    code: "populate",
    description: "Limited implementation of the Populate Questionnaire",
    system: false,
    type: false,
    instance: true,
    parameter: [
        { name: "subject", use: "in", min: 1, max: "1", type: "Reference" },
        { name: "return", use: "out", min: 1, max: "1", type: "QuestionnaireResponse" }
    ]
});

// 31. SearchParameter
db.searchparameters.insertOne({
    resourceType: "SearchParameter",
    _id: "example",
    url: "http://hl7.org/fhir/SearchParameter/example",
    name: "IDSEARCHPARAMETER",
    code: "_id",
    base: ["Resource"],
    type: "token",
    expression: "id",
    status: "draft",
    description: "Search by resource identifier"
});

// 32. StructureDefinition
db.structured


// ==============================================
// INSERTS PARA RECURSOS DE TERMINOLOGÍA FHIR
// ==============================================

// 34. CodeSystem
db.codesystems.insertOne({
    resourceType: "CodeSystem",
    _id: "example",
    url: "http://hl7.org/fhir/CodeSystem/example",
    name: "ACMECholCodesBlood",
    title: "ACME Codes for Cholesterol in Serum/Plasma",
    version: "5.0.0",
    status: "draft",
    content: "complete",
    description: "ACME codes for serum/plasma cholesterol",
    caseSensitive: true,
    concept: [
        { code: "chol-mmol", display: "SChol (mmol/L)", definition: "Serum Cholesterol in mmol/L" },
        { code: "chol-mass", display: "SChol (mg/L)", definition: "Serum Cholesterol in mg/L" },
        { code: "chol", display: "SChol", definition: "Serum Cholesterol" }
    ]
});

// 35. ConceptMap
db.conceptmaps.insertOne({
    resourceType: "ConceptMap",
    _id: "101",
    url: "http://hl7.org/fhir/ConceptMap/101",
    name: "FHIRv3AddressUse",
    title: "FHIR/v3 Address Use Mapping",
    status: "draft",
    description: "A mapping between FHIR and HL7 v3 AddressUse Code systems",
    sourceScopeUri: "http://hl7.org/fhir/ValueSet/address-use",
    targetScopeUri: "http://terminology.hl7.org/ValueSet/v3-AddressUse",
    group: [{
        source: "http://hl7.org/fhir/address-use",
        target: "http://terminology.hl7.org/CodeSystem/v3-AddressUse",
        element: [
            { code: "home", target: [{ code: "H", relationship: "equivalent" }] },
            { code: "work", target: [{ code: "WP", relationship: "equivalent" }] },
            { code: "temp", target: [{ code: "TMP", relationship: "equivalent" }] },
            { code: "old", target: [{ code: "BAD", relationship: "not-related-to", comment: "HL7 v3 AD handles old via usablePeriod" }] }
        ]
    }]
});

// 36. NamingSystem
db.namingsystems.insertOne({
    resourceType: "NamingSystem",
    _id: "example",
    url: "http://hl7.org/fhir/NamingSystem/example",
    name: "SNOMEDCT",
    title: "SNOMED CT",
    status: "active",
    kind: "codesystem",
    date: "2014-12-13",
    description: "SNOMED CT is a concept-based terminology",
    uniqueId: [
        { type: "oid", value: "2.16.840.1.113883.6.96" },
        { type: "uri", value: "http://snomed.info/sct", preferred: true }
    ]
});

// 37. TerminologyCapabilities
db.terminologycapabilities.insertOne({
    resourceType: "TerminologyCapabilities",
    _id: "example",
    url: "urn:uuid:68d043b5-9ecf-4559-a57a-396e0d452311",
    name: "ACMEEHR",
    title: "ACME EHR capability statement",
    version: "20130510",
    status: "draft",
    date: "2012-01-04",
    description: "Terminology capabilities for ACME EHR",
    software: { name: "TxServer", version: "0.1.2" },
    codeSearch: "in-compose-or-expansion"
});

// 38. ValueSet
db.valuesets.insertOne({
    resourceType: "ValueSet",
    _id: "example",
    url: "http://hl7.org/fhir/ValueSet/example",
    name: "LOINCCodesForCholesterolInSerumPlasma",
    title: "LOINC Codes for Cholesterol in Serum/Plasma",
    version: "5.0.0",
    status: "draft",
    date: "2015-06-22",
    description: "LOINC codes for serum/plasma cholesterol",
    copyright: "This content from LOINC is copyright Regenstrief Institute",
    compose: {
        include: [
            { system: "http://loinc.org", concept: [{ code: "14647-2", display: "Cholesterol [Moles/Volume]" }] },
            { system: "http://loinc.org", concept: [{ code: "2093-3", display: "Cholesterol [Mass/Volume]" }] },
            { system: "http://loinc.org", concept: [{ code: "35200-5", display: "Cholesterol [Mass Or Moles/Volume]" }] },
            { system: "http://loinc.org", concept: [{ code: "9342-7", display: "Cholesterol [Percentile]" }] }
        ]
    }
});

print("✅ Recursos de terminología FHIR insertados correctamente");






// ==============================================
// INSERTS PARA: Provenance, AuditEvent, Consent, Permission
// ==============================================

// 39. Provenance
db.provenances.insertOne({
    resourceType: "Provenance",
    _id: "example",
    target: [{ reference: "Procedure/example/_history/1" }],
    occurredPeriod: { start: "2015-06-27", end: "2015-06-28" },
    recorded: "2015-06-27T08:39:24+10:00",
    activity: { coding: [{ system: "http://snomed.info/sct", code: "3457005", display: "Referral" }] },
    agent: [
        { type: { coding: [{ code: "AUT" }] }, who: { reference: "Practitioner/xcda-author" } },
        { type: { coding: [{ code: "DEV" }] }, who: { display: "Device/software" } }
    ],
    location: { reference: "Location/1" },
    policy: ["http://acme.com/fhir/Consent/25"],
    entity: [{ role: "source", what: { reference: "DocumentReference/example" } }]
});

// 40. AuditEvent
db.auditevents.insertOne({
    resourceType: "AuditEvent",
    _id: "example",
    category: [{ coding: [{ system: "http://dicom.nema.org/resources/ontology/DCM", code: "110100", display: "Application Activity" }] }],
    code: { coding: [{ code: "110120", display: "Application Start" }] },
    action: "E",
    recorded: "2012-10-25T22:04:27+11:00",
    outcome: { code: { code: "0", display: "Success" } },
    agent: [
        { role: [{ text: "Service User (Logon)" }], who: { identifier: { value: "Grahame" } }, requestor: false },
        { who: { identifier: { system: "urn:oid:2.16.840.1.113883.4.2", value: "2.16.840.1.113883.4.2" } }, requestor: false, networkString: "Workstation1.ehr.familyclinic.com" }
    ],
    source: { observer: { display: "Grahame's Laptop" }, type: [{ coding: [{ code: "110122", display: "Login" }] }] }
});

// 41. Consent
db.consents.insertOne({
    resourceType: "Consent",
    _id: "consent-example-basic",
    status: "active",
    category: [{ coding: [{ system: "http://loinc.org", code: "59284-0" }] }],
    subject: { reference: "Patient/example", display: "Peter James Chalmers" },
    date: "2018-12-28",
    controller: [{ reference: "Organization/f001" }],
    decision: "deny"
});

// 42. Permission
db.permissions.insertOne({
    resourceType: "Permission",
    _id: "example",
    status: "active",
    combining: "deny-overrides"
});

print("✅ Recursos Provenance, AuditEvent, Consent, Permission insertados correctamente");




// ==============================================
// DOCUMENTREFERENCE
// ==============================================
db.documentreferences.insertOne({
    resourceType: "DocumentReference",
    _id: "xds",
    identifier: [{ system: "urn:ietf:rfc:3986", value: "urn:oid:129.6.58.92.88336" }],
    status: "current",
    type: { coding: [{ system: "http://ihe.net/connectathon/classCodes", code: "History and Physical" }] },
    category: [{ coding: [{ system: "http://loinc.org", code: "47039-3" }] }],
    subject: { reference: "Patient/a2", display: "DOE, John" },
    date: "2013-07-01T23:11:33+10:00",
    author: [{ reference: "Practitioner/a3" }, { reference: "Practitioner/a4" }],
    description: "Physical",
    content: [{ attachment: { url: "http://localhost:9556/svc/fhir/Binary/1e404af3-077f-4bee-b7a6-a9be97e1ce32", title: "Physical" } }]
});

// ==============================================
// COMPOSITION
// ==============================================
db.compositions.insertOne({
    resourceType: "Composition",
    _id: "example",
    identifier: [{ value: "1" }],
    status: "final",
    type: { coding: [{ system: "http://loinc.org", code: "11488-4", display: "Consult note" }] },
    subject: [{ reference: "Patient/xcda", display: "Henry Levin the 7th" }],
    encounter: { reference: "Encounter/xcda" },
    date: "2012-01-04T09:10:14Z",
    author: [{ reference: "Practitioner/xcda-author", display: "Harold Hippocrates, MD" }],
    title: "Consultation Note",
    custodian: { reference: "Organization/2.16.840.1.113883.19.5", display: "Good Health Clinic" },
    section: [{
        title: "History of present illness",
        code: { coding: [{ system: "http://loinc.org", code: "11348-0" }] },
        entry: [{ reference: "Condition/stroke" }, { reference: "Condition/example" }]
    }]
});

print("✅ DocumentReference y Composition insertados correctamente");



// ==============================================
// INSERTS PARA: Bundle, Linkage, MessageHeader, OperationOutcome, Parameters
// Subscription, SubscriptionStatus, SubscriptionTopic
// ==============================================

// 39. Bundle
db.bundles.insertOne({
    resourceType: "Bundle",
    _id: "bundle-example",
    type: "searchset",
    total: 3,
    meta: { lastUpdated: "2014-08-18T01:43:30Z" },
    link: [
        { relation: "self", url: "https://example.com/base/MedicationRequest?patient=347" },
        { relation: "next", url: "https://example.com/base/MedicationRequest?page=2" }
    ],
    entry: [
        { fullUrl: "https://example.com/base/MedicationRequest/3123", resource: { resourceType: "MedicationRequest", id: "3123" } }
    ]
});

// 40. Linkage
db.linkages.insertOne({
    resourceType: "Linkage",
    _id: "example",
    author: { reference: "Practitioner/f201" },
    item: [
        { type: "source", resource: { reference: "Condition/example", display: "Severe burn of left ear" } },
        { type: "alternate", resource: { reference: "Condition/example-linkage", display: "Severe burn of left ear" } }
    ]
});

// 41. MessageHeader
db.messageheaders.insertOne({
    resourceType: "MessageHeader",
    _id: "1cbdfb97-5859-48a4-8301-d54eab818d68",
    eventCoding: { code: "admin-notify" },
    source: { endpointUrl: "llp:10.11.12.13:5432", name: "Acme Central Patient Registry", software: "FooBar Patient Manager", version: "3.1.45.AABB" },
    destination: [{ endpointUrl: "llp:10.11.12.14:5432", name: "Acme Message Gateway" }],
    sender: { reference: "Organization/1" },
    author: { reference: "Practitioner/example" },
    reason: { coding: [{ code: "admit" }] },
    focus: [{ reference: "Patient/example" }]
});

// 42. OperationOutcome
db.operationoutcomes.insertOne({
    resourceType: "OperationOutcome",
    _id: "101",
    issue: [{
        severity: "error",
        code: "code-invalid",
        details: { text: "The code \"W\" is not known and not legal in this context" },
        diagnostics: "Acme.Interop.FHIRProcessors.Patient.processGender line 2453",
        expression: ["Patient.gender"]
    }]
});

// 43. Parameters
db.parameters.insertOne({
    resourceType: "Parameters",
    _id: "example",
    parameter: [
        { name: "exact", valueBoolean: true },
        { name: "property", part: [{ name: "code", valueCode: "focus" }, { name: "value", valueCode: "top" }] }
    ]
});

// 44. Subscription
db.subscriptions.insertOne({
    resourceType: "Subscription",
    _id: "example",
    name: "Example",
    status: "active",
    topic: "http://example.org/R5/SubscriptionTopic/example",
    reason: "Example subscription for example topic",
    filterBy: [{ resourceType: "Encounter", filterParameter: "patient", value: "Patient/123" }],
    channelType: { code: "rest-hook" }
});

// 45. SubscriptionStatus
db.subscriptionstatus.insertOne({
    resourceType: "SubscriptionStatus",
    _id: "example",
    status: "active",
    type: "event-notification",
    eventsSinceSubscriptionStart: "1000",
    notificationEvent: [{ eventNumber: "1000" }],
    subscription: { reference: "http://example.org/FHIR/R5/Subscription/123" },
    topic: "http://example.org/FHIR/R5/SubscriptionTopic/admission"
});

// 46. SubscriptionTopic
db.subscriptiontopics.insertOne({
    resourceType: "SubscriptionTopic",
    _id: "example",
    url: "http://example.org/FHIR/R5/SubscriptionTopic/example",
    version: "1.0.0-beta.1",
    title: "example",
    status: "draft",
    description: "Example topic for completed encounters",
    resourceTrigger: [{
        resource: "Encounter",
        supportedInteraction: ["update"],
        queryCriteria: { previous: "status:not=completed", current: "status=completed", requireBoth: true }
    }],
    canFilterBy: [
        { description: "Filter based on the subject of an encounter.", resource: "Encounter", filterParameter: "subject" },
        { description: "Filter based on the group membership.", resource: "Encounter", filterParameter: "_in" }
    ]
});

print("✅ Recursos Bundle, Linkage, MessageHeader, OperationOutcome, Parameters, Subscription, SubscriptionStatus, SubscriptionTopic insertados correctamente");


// ==============================================
// BINARY
// ==============================================
db.binaries.insertOne({
    resourceType: "Binary",
    _id: "example",
    contentType: "application/pdf",
    securityContext: { reference: "DocumentReference/example" },
    data: "JVBERi0xLjUNJeLjz9MNCjEwIDAgb2JqDTw8L0xpbmVhcml6ZWQgMS9MID"
});

// ==============================================
// BASIC
// ==============================================
db.basics.insertOne({
    resourceType: "Basic",
    _id: "referral",
    identifier: [{ value: "19283746" }],
    code: { coding: [{ code: "referral" }] },
    subject: { reference: "Patient/f201", display: "Roel" },
    created: "2013-05-14",
    author: { reference: "Practitioner/example" },
    extension: [
        { url: "http://example.org/fhir-extensions/referral#requestingPractitioner", valueReference: { reference: "Practitioner/f201", display: "Dokter Bronsig" } },
        { url: "http://example.org/fhir-extensions/referral#notes", valueString: "The patient had fever peaks over the last couple of days. He is worried about these peaks." }
    ]
});

print("✅ Binary y Basic insertados correctamente");


