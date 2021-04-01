/*
Data Access

Unqualified Retrieve
Retrieve w/ Default Primary Code Path
Retrieve w/ Specified Code Path
Retrieve w/ Code
Retrieve w/ ValueSet
Retrieve w/ SearchPath

NOTE: Test data for these is located under the Exercises06 library, so
copy these examples into that library to run them.
*/
library Exercises06Key

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

codesystem "ActCode": 'http://terminology.hl7.org/CodeSystem/v3-ActCode'
codesystem "MedicationRequestCategory": 'http://terminology.hl7.org/CodeSystem/medicationrequest-category'
codesystem "ObservationCategory": 'http://terminology.hl7.org/CodeSystem/observation-category'

valueset "Community Medication": 'http://example.org/fhir/ValueSet/community-medication'
valueset "Vital Sign": 'http://example.org/fhir/ValueSet/vital-sign'
valueset "Laboratory": 'http://example.org/fhir/ValueSet/laboratory'

// Act Codes
code "Inpatient Encounter": 'IMP' from "ActCode" display 'Inpatient Encounter'

context Patient

/*
Write a definition to retrieve Encounters
Use the FHIR [Encounter](http://hl7.org/fhir/encounter.html)
*/
define "Encounters":
  [Encounter]

/*
Write a definition to retrieve Inpatient Encounters
Use the FHIR [Encounter](http://hl7.org/fhir/encounter.html)
*/
define "Inpatient Encounters":
  [Encounter: class ~ "Inpatient Encounter"]


/*
Write a definition to retrieve Medication Requests
Use the FHIR [MedicationRequest](http://hl7.org/fhir/medicationrequest.html)
*/
define "Medication Requests":
  [MedicationRequest]

/*
Write a definition to retrieve Community Medication Requests
Use the FHIR [MedicationRequest](http://hl7.org/fhir/medicationrequest.html)
*/
define "Community Medication Requests":
  [MedicationRequest: category in "Community Medication"]

/*
Write a definition to retrieve all Observations
Use the FHIR [Observation](http://hl7.org/fhir/observation.html)
*/
define "Observations":
  [Observation]

/*
Write a definition to retrieve all vital signs
Use the FHIR [Observation](http://hl7.org/fhir/observation.html)
*/
define "Vital Signs":
  [Observation: category in "Vital Sign"]

/*
Write a definition to retrieve all laboratory results
Use the FHIR [Observation](http://hl7.org/fhir/observation.html)
*/
define "Laboratory Results":
  [Observation: category in "Laboratory"]
