-- ==============================================
-- RECURSOS DE INFRAESTRUCTURA FHIR
-- CapabilityStatement, CompartmentDefinition, GraphDefinition, ImplementationGuide,
-- MessageDefinition, OperationDefinition, SearchParameter, StructureDefinition, StructureMap
-- ==============================================

-- 25. CAPABILITYSTATEMENT
CREATE TABLE CapabilityStatement (
    id VARCHAR(50) PRIMARY KEY,
    url VARCHAR(255),
    version VARCHAR(50),
    name VARCHAR(255),
    title VARCHAR(255),
    status VARCHAR(20),
    date DATE,
    description TEXT,
    publisher VARCHAR(255),
    fhir_version VARCHAR(20)
);

INSERT INTO CapabilityStatement (id, url, version, name, title, status, date, description, publisher, fhir_version)
VALUES ('example', 'urn:uuid:68d043b5-9ecf-4559-a57a-396e0d452311', '20130510', 'ACMEEHR', 'ACME EHR capability statement', 'draft', '2012-01-04', 'Main EHR capability statement', 'ACME Corporation', '5.0.0');

-- 26. COMPARTMENTDEFINITION
CREATE TABLE CompartmentDefinition (
    id VARCHAR(50) PRIMARY KEY,
    url VARCHAR(255),
    name VARCHAR(255),
    status VARCHAR(20),
    code VARCHAR(50),
    description TEXT,
    search BOOLEAN
);

INSERT INTO CompartmentDefinition (id, url, name, status, code, description, search)
VALUES ('patient', 'http://hl7.org/fhir/CompartmentDefinition/patient', 'Base FHIR compartment definition for Patient', 'draft', 'Patient', 'There is an instance of the patient compartment for each patient resource', true);

-- 27.GRAPHDEFINITION
CREATE TABLE GraphDefinition (
    id VARCHAR(50) PRIMARY KEY,
    url VARCHAR(255),
    name VARCHAR(255),
    title VARCHAR(255),
    status VARCHAR(20),
    description TEXT,
    start_node VARCHAR(50)
);

INSERT INTO GraphDefinition (id, url, name, title, status, description, start_node)
VALUES ('example', 'http://h7.org/fhir/GraphDefinition/example', 'DocumentGenerationTemplate', 'Document Generation Template', 'draft', 'Specify to include list references', 'comp1');

-- 28. IMPLEMENTATIONGUIDE
CREATE TABLE ImplementationGuide (
    id VARCHAR(50) PRIMARY KEY,
    url VARCHAR(255),
    version VARCHAR(50),
    name VARCHAR(255),
    title VARCHAR(255),
    status VARCHAR(20),
    package_id VARCHAR(100),
    description TEXT
);

INSERT INTO ImplementationGuide (id, url, version, name, title, status, package_id, description)
VALUES ('example', 'http://hl7.org/fhir/us/daf', '0', 'DataAccessFrameworkDAF', 'Data Access Framework (DAF)', 'draft', 'hl7.fhir.us.daf', 'The Data Access Framework (DAF) Initiative');

-- 29. MESSAGEDEFINITION
CREATE TABLE MessageDefinition (
    id VARCHAR(50) PRIMARY KEY,
    url VARCHAR(255),
    name VARCHAR(255),
    title VARCHAR(255),
    status VARCHAR(20),
    event_code VARCHAR(100),
    category VARCHAR(50),
    description TEXT
);

INSERT INTO MessageDefinition (id, url, name, title, status, event_code, category, description)
VALUES ('example', 'http://hl7.org/fhir/MessageDefinition/example', 'EXAMPLE', 'Message definition base example', 'draft', 'admin-notify', 'notification', 'Message definition base example');

-- 30. OPERATIONDEFINITION
CREATE TABLE OperationDefinition (
    id VARCHAR(50) PRIMARY KEY,
    url VARCHAR(255),
    name VARCHAR(255),
    title VARCHAR(255),
    status VARCHAR(20),
    kind VARCHAR(20),
    code VARCHAR(100),
    description TEXT
);

INSERT INTO OperationDefinition (id, url, name, title, status, kind, code, description)
VALUES ('example', 'http://hl7.org/fhir/OperationDefinition/example', 'PopulateQuestionnaire', 'Populate Questionnaire', 'draft', 'operation', 'populate', 'Limited implementation of the Populate Questionnaire');

-- 31. SEARCHPARAMETER
CREATE TABLE SearchParameter (
    id VARCHAR(50) PRIMARY KEY,
    url VARCHAR(255),
    name VARCHAR(255),
    code VARCHAR(100),
    base VARCHAR(50),
    type VARCHAR(20),
    expression VARCHAR(255),
    status VARCHAR(20),
    description TEXT
);

INSERT INTO SearchParameter (id, url, name, code, base, type, expression, status, description)
VALUES ('example', 'http://hl7.org/fhir/SearchParameter/example', 'IDSEARCHPARAMETER', '_id', 'Resource', 'token', 'id', 'draft', 'Search by resource identifier');

-- 32. STRUCTUREDEFINITION
CREATE TABLE StructureDefinition (
    id VARCHAR(50) PRIMARY KEY,
    url VARCHAR(255),
    name VARCHAR(255),
    status VARCHAR(20),
    kind VARCHAR(50),
    abstract BOOLEAN,
    type VARCHAR(100),
    description TEXT
);

INSERT INTO StructureDefinition (id, url, name, status, kind, abstract, type, description)
VALUES ('Element', 'http://hl7.org/fhir/StructureDefinition/Element', 'Element', 'active', 'complex-type', true, 'Element', 'Base definition for all elements in a resource');

-- 33. STRUCTUREMAP
CREATE TABLE StructureMap (
    id VARCHAR(50) PRIMARY KEY,
    url VARCHAR(255),
    name VARCHAR(255),
    title VARCHAR(255),
    status VARCHAR(20),
    description TEXT,
    group_definition TEXT
);

INSERT INTO StructureMap (id, url, name, title, status, description, group_definition)
VALUES ('example', 'http://hl7.org/fhir/StructureMap/example', 'ExampleMap', 'Example Map', 'draft', 'Example Structure Map', 'group Examples(source testSrc, target testTgt)');




-- ==============================================
-- RECURSOS DE TERMINOLOGÍA FHIR
-- CodeSystem, ConceptMap, NamingSystem, TerminologyCapabilities, ValueSet
-- ==============================================

-- 34. CODESYSTEM
CREATE TABLE CodeSystem (
    id VARCHAR(50) PRIMARY KEY,
    url VARCHAR(255),
    name VARCHAR(255),
    title VARCHAR(255),
    version VARCHAR(50),
    status VARCHAR(20),
    content VARCHAR(20),
    description TEXT,
    case_sensitive BOOLEAN,
    concepts TEXT
);

INSERT INTO CodeSystem (id, url, name, title, version, status, content, description, case_sensitive, concepts)
VALUES ('example', 'http://hl7.org/fhir/CodeSystem/example', 'ACMECholCodesBlood', 'ACME Codes for Cholesterol in Serum/Plasma', '5.0.0', 'draft', 'complete', 'ACME codes for serum/plasma cholesterol', true, 'chol-mmol|SChol (mmol/L)|Serum Cholesterol in mmol/L, chol-mass|SChol (mg/L)|Serum Cholesterol in mg/L, chol|SChol|Serum Cholesterol');

-- 35. CONCEPTMAP
CREATE TABLE ConceptMap (
    id VARCHAR(50) PRIMARY KEY,
    url VARCHAR(255),
    name VARCHAR(255),
    title VARCHAR(255),
    status VARCHAR(20),
    description TEXT,
    source_scope VARCHAR(255),
    target_scope VARCHAR(255),
    mappings TEXT
);

INSERT INTO ConceptMap (id, url, name, title, status, description, source_scope, target_scope, mappings)
VALUES ('101', 'http://hl7.org/fhir/ConceptMap/101', 'FHIRv3AddressUse', 'FHIR/v3 Address Use Mapping', 'draft', 'A mapping between FHIR and HL7 v3 AddressUse Code systems', 'http://hl7.org/fhir/ValueSet/address-use', 'http://terminology.hl7.org/ValueSet/v3-AddressUse', 'home|H|equivalent, work|WP|equivalent, temp|TMP|equivalent, old|BAD|not-related-to');

-- 36. NAMINGSYSTEM
CREATE TABLE NamingSystem (
    id VARCHAR(50) PRIMARY KEY,
    url VARCHAR(255),
    name VARCHAR(255),
    title VARCHAR(255),
    status VARCHAR(20),
    kind VARCHAR(20),
    date DATE,
    description TEXT,
    unique_ids TEXT
);

INSERT INTO NamingSystem (id, url, name, title, status, kind, date, description, unique_ids)
VALUES ('example', 'http://hl7.org/fhir/NamingSystem/example', 'SNOMEDCT', 'SNOMED CT', 'active', 'codesystem', '2014-12-13', 'SNOMED CT is a concept-based terminology', 'oid|2.16.840.1.113883.6.96|false, uri|http://snomed.info/sct|true');

-- 37. TERMINOLOGYCAPABILITIES
CREATE TABLE TerminologyCapabilities (
    id VARCHAR(50) PRIMARY KEY,
    url VARCHAR(255),
    name VARCHAR(255),
    title VARCHAR(255),
    version VARCHAR(50),
    status VARCHAR(20),
    date DATE,
    description TEXT,
    software_name VARCHAR(100),
    software_version VARCHAR(50)
);

INSERT INTO TerminologyCapabilities (id, url, name, title, version, status, date, description, software_name, software_version)
VALUES ('example', 'urn:uuid:68d043b5-9ecf-4559-a57a-396e0d452311', 'ACMEEHR', 'ACME EHR capability statement', '20130510', 'draft', '2012-01-04', 'Terminology capabilities for ACME EHR', 'TxServer', '0.1.2');

-- 38. VALUESET
CREATE TABLE ValueSet (
    id VARCHAR(50) PRIMARY KEY,
    url VARCHAR(255),
    name VARCHAR(255),
    title VARCHAR(255),
    version VARCHAR(50),
    status VARCHAR(20),
    date DATE,
    description TEXT,
    copyright TEXT,
    codes TEXT
);

INSERT INTO ValueSet (id, url, name, title, version, status, date, description, copyright, codes)
VALUES ('example', 'http://hl7.org/fhir/ValueSet/example', 'LOINCCodesForCholesterolInSerumPlasma', 'LOINC Codes for Cholesterol in Serum/Plasma', '5.0.0', 'draft', '2015-06-22', 'LOINC codes for serum/plasma cholesterol', 'This content from LOINC is copyright Regenstrief Institute', 'http://loinc.org|14647-2|Cholesterol [Moles/Volume], http://loinc.org|2093-3|Cholesterol [Mass/Volume], http://loinc.org|35200-5|Cholesterol [Mass Or Moles/Volume], http://loinc.org|9342-7|Cholesterol [Percentile]');



-- ==============================================
-- RECURSOS: Provenance, AuditEvent, Consent, Permission
-- ==============================================

-- 39. PROVENANCE
CREATE TABLE Provenance (
    id VARCHAR(50) PRIMARY KEY,
    target_ref VARCHAR(100),
    occurred_start DATE,
    occurred_end DATE,
    recorded TIMESTAMP,
    activity VARCHAR(100),
    agent_type VARCHAR(10),
    agent_who VARCHAR(100),
    location_ref VARCHAR(100),
    policy_url VARCHAR(255)
);

INSERT INTO Provenance (id, target_ref, occurred_start, occurred_end, recorded, activity, agent_type, agent_who, location_ref, policy_url)
VALUES ('example', 'Procedure/example/_history/1', '2015-06-27', '2015-06-28', '2015-06-27 08:39:24', 'Referral', 'AUT', 'Practitioner/xcda-author', 'Location/1', 'http://acme.com/fhir/Consent/25');

-- 40. AUDITEVENT
CREATE TABLE AuditEvent (
    id VARCHAR(50) PRIMARY KEY,
    code VARCHAR(50),
    action VARCHAR(10),
    recorded TIMESTAMP,
    outcome VARCHAR(10),
    agent_id VARCHAR(100),
    requestor BOOLEAN,
    source_observer VARCHAR(255)
);

INSERT INTO AuditEvent (id, code, action, recorded, outcome, agent_id, requestor, source_observer)
VALUES ('example', '110120', 'E', '2012-10-25 22:04:27', '0', 'Grahame', false, 'Grahame''s Laptop');

-- 41. CONSENT
CREATE TABLE Consent (
    id VARCHAR(50) PRIMARY KEY,
    status VARCHAR(20),
    category VARCHAR(50),
    subject_ref VARCHAR(100),
    date DATE,
    controller_ref VARCHAR(100),
    decision VARCHAR(10)
);

INSERT INTO Consent (id, status, category, subject_ref, date, controller_ref, decision)
VALUES ('consent-example-basic', 'active', '59284-0', 'Patient/example', '2018-12-28', 'Organization/f001', 'deny');

-- 42. PERMISSION
CREATE TABLE Permission (
    id VARCHAR(50) PRIMARY KEY,
    status VARCHAR(20),
    combining VARCHAR(30)
);

INSERT INTO Permission (id, status, combining)
VALUES ('example', 'active', 'deny-overrides');





-- ==============================================
-- DOCUMENTREFERENCE
-- ==============================================
CREATE TABLE DocumentReference (
    id VARCHAR(50) PRIMARY KEY,
    identifier VARCHAR(255),
    status VARCHAR(20),
    type_code VARCHAR(100),
    category_code VARCHAR(100),
    subject_ref VARCHAR(100),
    subject_display VARCHAR(255),
    date TIMESTAMP,
    author_refs TEXT,
    description TEXT,
    url TEXT,
    title VARCHAR(255)
);

INSERT INTO DocumentReference (id, identifier, status, type_code, category_code, subject_ref, subject_display, date, author_refs, description, url, title)
VALUES ('xds', 'urn:oid:129.6.58.92.88336', 'current', 'History and Physical', '47039-3', 'Patient/a2', 'DOE, John', '2013-07-01 23:11:33', 'Practitioner/a3, Practitioner/a4', 'Physical', 'http://localhost:9556/svc/fhir/Binary/1e404af3-077f-4bee-b7a6-a9be97e1ce32', 'Physical');

-- ==============================================
-- COMPOSITION
-- ==============================================
CREATE TABLE Composition (
    id VARCHAR(50) PRIMARY KEY,
    identifier VARCHAR(100),
    status VARCHAR(20),
    type_code VARCHAR(50),
    title VARCHAR(255),
    subject_ref VARCHAR(100),
    subject_display VARCHAR(255),
    encounter_ref VARCHAR(100),
    date TIMESTAMP,
    author_ref VARCHAR(100),
    author_display VARCHAR(255),
    custodian_ref VARCHAR(100),
    custodian_display VARCHAR(255),
    description TEXT
);

INSERT INTO Composition (id, identifier, status, type_code, title, subject_ref, subject_display, encounter_ref, date, author_ref, author_display, custodian_ref, custodian_display, description)
VALUES ('example', '1', 'final', '11488-4', 'Consultation Note', 'Patient/xcda', 'Henry Levin the 7th', 'Encounter/xcda', '2012-01-04 09:10:14', 'Practitioner/xcda-author', 'Harold Hippocrates, MD', 'Organization/2.16.840.1.113883.19.5', 'Good Health Clinic', 'Consultation note for Henry Levin the 7th');




-- ==============================================
-- RECURSOS: Bundle, Linkage, MessageHeader, OperationOutcome, Parameters
-- Subscription, SubscriptionStatus, SubscriptionTopic
-- ==============================================

-- 39. BUNDLE
CREATE TABLE Bundle (
    id VARCHAR(50) PRIMARY KEY,
    type VARCHAR(20),
    total INT,
    last_updated TIMESTAMP,
    links TEXT
);

INSERT INTO Bundle (id, type, total, last_updated, links)
VALUES ('bundle-example', 'searchset', 3, '2014-08-18 01:43:30', 'self|https://example.com/base/MedicationRequest?patient=347, next|https://example.com/base/MedicationRequest?page=2');

-- 40. LINKAGE
CREATE TABLE Linkage (
    id VARCHAR(50) PRIMARY KEY,
    author_ref VARCHAR(100),
    items TEXT
);

INSERT INTO Linkage (id, author_ref, items)
VALUES ('example', 'Practitioner/f201', 'source|Condition/example|Severe burn of left ear, alternate|Condition/example-linkage|Severe burn of left ear');

-- 41. MESSAGEHEADER
CREATE TABLE MessageHeader (
    id VARCHAR(50) PRIMARY KEY,
    event_code VARCHAR(100),
    source_url VARCHAR(255),
    source_name VARCHAR(255),
    dest_url VARCHAR(255),
    dest_name VARCHAR(255),
    sender_ref VARCHAR(100),
    author_ref VARCHAR(100),
    reason VARCHAR(100)
);

INSERT INTO MessageHeader (id, event_code, source_url, source_name, dest_url, dest_name, sender_ref, author_ref, reason)
VALUES ('1cbdfb97-5859-48a4-8301-d54eab818d68', 'admin-notify', 'llp:10.11.12.13:5432', 'Acme Central Patient Registry', 'llp:10.11.12.14:5432', 'Acme Message Gateway', 'Organization/1', 'Practitioner/example', 'admit');

-- 42. OPERATIONOUTCOME
CREATE TABLE OperationOutcome (
    id VARCHAR(50) PRIMARY KEY,
    severity VARCHAR(20),
    code VARCHAR(50),
    details TEXT,
    diagnostics TEXT,
    expression VARCHAR(255)
);

INSERT INTO OperationOutcome (id, severity, code, details, diagnostics, expression)
VALUES ('101', 'error', 'code-invalid', 'The code "W" is not known and not legal in this context', 'Acme.Interop.FHIRProcessors.Patient.processGender line 2453', 'Patient.gender');

-- 43. PARAMETERS
CREATE TABLE Parameters (
    id VARCHAR(50) PRIMARY KEY,
    params TEXT
);

INSERT INTO Parameters (id, params)
VALUES ('example', 'exact|boolean|true, property|code|focus');

-- 44. SUBSCRIPTION
CREATE TABLE Subscription (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(255),
    status VARCHAR(20),
    topic VARCHAR(255),
    reason TEXT,
    resource_type VARCHAR(50),
    filter_param VARCHAR(50),
    filter_value VARCHAR(100),
    channel_type VARCHAR(50)
);

INSERT INTO Subscription (id, name, status, topic, reason, resource_type, filter_param, filter_value, channel_type)
VALUES ('example', 'Example', 'active', 'http://example.org/R5/SubscriptionTopic/example', 'Example subscription for example topic', 'Encounter', 'patient', 'Patient/123', 'rest-hook');

-- 45. SUBSCRIPTIONSTATUS
CREATE TABLE SubscriptionStatus (
    id VARCHAR(50) PRIMARY KEY,
    status VARCHAR(20),
    type VARCHAR(30),
    events_since_start INT,
    event_number INT,
    subscription_ref VARCHAR(255),
    topic VARCHAR(255)
);

INSERT INTO SubscriptionStatus (id, status, type, events_since_start, event_number, subscription_ref, topic)
VALUES ('example', 'active', 'event-notification', 1000, 1000, 'http://example.org/FHIR/R5/Subscription/123', 'http://example.org/FHIR/R5/SubscriptionTopic/admission');

-- 46. SUBSCRIPTIONTOPIC
CREATE TABLE SubscriptionTopic (
    id VARCHAR(50) PRIMARY KEY,
    url VARCHAR(255),
    version VARCHAR(50),
    title VARCHAR(255),
    status VARCHAR(20),
    description TEXT,
    resource_trigger VARCHAR(50),
    filters TEXT
);

INSERT INTO SubscriptionTopic (id, url, version, title, status, description, resource_trigger, filters)
VALUES ('example', 'http://example.org/FHIR/R5/SubscriptionTopic/example', '1.0.0-beta.1', 'example', 'draft', 'Example topic for completed encounters', 'Encounter', 'subject|Filter based on subject, _in|Filter based on group membership');



-- ==============================================
-- BINARY
-- ==============================================
CREATE TABLE Binary (
    id VARCHAR(50) PRIMARY KEY,
    content_type VARCHAR(100),
    security_context_ref VARCHAR(100),
    data TEXT,
    data_size INT
);

INSERT INTO Binary (id, content_type, security_context_ref, data, data_size)
VALUES ('example', 'application/pdf', 'DocumentReference/example', 'JVBERi0xLjUNJeLjz9MNCjEwIDAgb2Jq...', 0);

-- ==============================================
-- BASIC
-- ==============================================
CREATE TABLE Basic (
    id VARCHAR(50) PRIMARY KEY,
    identifier VARCHAR(100),
    code VARCHAR(50),
    subject_ref VARCHAR(100),
    subject_display VARCHAR(255),
    created DATE,
    author_ref VARCHAR(100),
    extensions TEXT
);

INSERT INTO Basic (id, identifier, code, subject_ref, subject_display, created, author_ref, extensions)
VALUES ('referral', '19283746', 'referral', 'Patient/f201', 'Roel', '2013-05-14', 'Practitioner/example', 'http://example.org/fhir-extensions/referral#requestingPractitioner|reference|Practitioner/f201|Dokter Bronsig, http://example.org/fhir-extensions/referral#notes|string|The patient had fever peaks over the last couple of days');


