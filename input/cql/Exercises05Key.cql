/*
Terminology

CodeSystems
ValueSets
Codes
Concepts
Comparison
Membership Testing

NOTE: Test data for these is located under the Exercises05 library, so
copy these examples into that library to run them.
*/
library Exercises05Key

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'

codesystem "LOINC:2.46": 'http://loinc.org' version '2.46'
codesystem "SNOMEDCT:2016-03": 'http://snomed.info/sct'
  version 'http://snomed.info/sct/731000124108/version/20160301'
codesystem "Marital Status Codes": 'http://terminology.hl7.org/CodeSystem/v3-MaritalStatus'

valueset "Encounter Inpatient": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.666.5.307'
valueset "Patient Expired": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.309'
valueset "Psychiatric/Mental Health Diagnosis": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.299'
valueset "Emergency Department Visit": 'http://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113883.3.117.1.7.1.292'
valueset "Marital Status": 'http://hl7.org/fhir/ValueSet/marital-status'

code "Birthdate": '21112-8' from "LOINC:2.46" display 'Birth date'
code "Dead": '419099009' from "SNOMEDCT:2016-03" display 'Dead'
code "Marital Status - Married": 'M' from "Marital Status Codes"

context Patient

/*
Given the following gender definition, write a "Patient Gender is Male" definition
*/
define "Patient Gender": Patient.gender
define "Patient Gender is Male": Patient.gender = 'male'

/*
Given the following marital status definition, write a "Patient is Married" definition
*/
define "Patient Marital Status": Patient.maritalStatus
define "Patient is Married (=)": Patient.maritalStatus = "Marital Status - Married" // Incorrect, uses equality
define "Patient is Married (~)": Patient.maritalStatus ~ "Marital Status - Married" // Correct, uses equivalence

/*
Write a "Married in Martial Status" definition to test whether the
"Marital Status - Married" code is in the "Marital Status" value set
*/
define "Married in Marital Status": "Marital Status - Married" in "Marital Status"
