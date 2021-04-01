/*
Queries

Query Structure
Filtering with Where
With Relationships
Without Relationships
Shaping Results with Return
Ordering Results with Sort
*/
library Exercises07

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

codesystem "LOINC": 'http://loinc.org'
codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode'
codesystem "MedicationRequestCategory": 'http://terminology.hl7.org/CodeSystem/medicationrequest-category'
codesystem "ObservationCategory": 'http://terminology.hl7.org/CodeSystem/observation-category'

valueset "Community Medication": 'http://example.org/fhir/ValueSet/community-medication'
valueset "Vital Sign": 'http://example.org/fhir/ValueSet/vital-sign'
valueset "Laboratory": 'http://example.org/fhir/ValueSet/laboratory'

code "Blood Glucose": '2339-0' from "LOINC" display 'Glucose Bld-mCnc'

// Act Codes
code "Inpatient Encounter": 'IMP' from "ActCode" display 'Inpatient Encounter'

context Patient

/*
Write a query to return only Laboratory results that are final or
amended and have a quantitative result
*/

/*
Write a query to return encounters that have a quantitative laboratory result
during the encounter
*/

/*
Write a query to return encounters that did not have a procedure performed
during the encounter
*/

/*
Write a query to return the most recent blood glucose observation
*/

/*
Write a definition that returns the difference between the two most recent
blood glucose observations
*/
