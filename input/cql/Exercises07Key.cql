/*
Queries

Query Structure
Filtering with Where
With Relationships
Without Relationships
Shaping Results with Return
Ordering Results with Sort

NOTE: Test data for these is located under the Exercises07 library, so
copy these examples into that library to run them.
*/
library Exercises07Key

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
Write a query to return only Laboratory results that are final or
amended and have a quantitative result
*/
define "Final or Amended Quantitative Laboratory Results":
  [Observation: category in "Laboratory"] O
    where O.status in { 'final', 'amended' }
      and O.value is Quantity

/*
Write a query to return encounters that have a quantitative laboratory result
during the encounter
*/
define "Quantitative Laboratory Encounters":
  [Encounter] E
    with [Observation: category in Laboratory] O
      such that O.status in {'final', 'amended' }
        and O.value is Quantity
        and O.effective as dateTime during E.period

// Could also re-use the "Final or Amended Quantitative Laboratory Results" expression from above
define "Quantitative Laboratory Encounters (2)":
  [Encounter] E
    with "Final or Amended Quantitative Laboratory Results" O
      such that O.effective as dateTime during E.period

// A `with` can also be expressed as a `where exists...`
define "Quantitative Laboratory Encounters (3)":
  [Encounter] E
    where exists (
      "Final or Amended Quantitative Laboratory Results" O
        where O.effective as dateTime during E.period
    )

/*
Write a query to return encounters that did not have a procedure performed during the encounter
*/
define "Procedure":
  [Procedure]

define "Encounter Without Procedure":
  [Encounter] E
    without [Procedure] P
      such that P.performed as dateTime during E.period

// A `without` can also be expressed as a `where not exists...`
define "Encounter Without Procedure (2)":
  [Encounter] E
    where not exists (
      [Procedure] P
        where P.performed as dateTime during E.period
    )

/*
Write a query to return the most recent blood glucose observation
*/
define "Blood Glucose Observations":
  [Observation: category in "Laboratory"] O
    where O.status in { 'final', 'amended' }
      and O.value is Quantity
      and O.code ~ "Blood Glucose"
    sort by FHIRHelpers.ToDateTime(effective as dateTime) desc

define "Blood Glucose Observations (2)":
  "Final or Amended Quantitative Laboratory Results" O
    where O.code ~ "Blood Glucose"
    sort by FHIRHelpers.ToDateTime(effective as dateTime) desc

define "Most Recent Blood Glucose":
  First("Blood Glucose Observations")

/*
Write a definition that returns the difference between the two most recent
blood glucose observations
*/
define "Difference Between Two Most Recent Blood Glucose":
  "Most Recent Blood Glucose" MR
    let priorBloodGlucose: (
      First("Blood Glucose Observations" O
        where O.effective as dateTime before ("Most Recent Blood Glucose".effective as dateTime)
      )
    )
    return (MR.value as Quantity) - (priorBloodGlucose.value as Quantity)
