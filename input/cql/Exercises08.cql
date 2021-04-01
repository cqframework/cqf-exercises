/*
Advanced Queries

Multi-Source Queries
Let Clauses
*/
library Exercises08

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

/*
Write a query to return the greatest absolute difference between any pair of blood glucose results
*/

/*
Write a query to return the difference between pairs of quantitative results
for the same test
*/

/*
Write a query to return the average quantitative result for the same test
*/
