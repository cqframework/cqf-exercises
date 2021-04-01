/*
Advanced Queries

Multi-Source Queries
Let Clauses

NOTE: Test data for these is located under the Exercises08 library, so
copy these examples into that library to run them.
*/
library Exercises08Key

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

// Start by defining Blood Glucose Observations:
define "Blood Glucose Observations":
  [Observation: category in "Laboratory"] O
    where O.status in { 'final', 'amended' }
      and O.value is Quantity
      and O.code ~ "Blood Glucose"

// Next calculate absolute difference between any pairs of observations
define "Difference in Blood Glucose Observations":
  from
    "Blood Glucose Observations" O1,
    "Blood Glucose Observations" O2
  return Abs((O2.value as Quantity) - (O1.value as Quantity))

// Then return the greatest difference
define "Greatest Absolute Difference in Blood Glucose Observations":
  Max("Difference in Blood Glucose Observations")

/*
Write a query to return the difference between pairs of quantitative results
for the same test
*/

define "Quantitative Laboratory Results":
  [Observation: category in "Laboratory"] O
    where O.status in { 'final', 'amended' }
      and O.value is Quantity

define "Difference in Quantitative Tests":
  from
    "Quantitative Laboratory Results" O1,
    "Quantitative Laboratory Results" O2
  where O1.code ~ O2.code
  return { code: O1.code, "difference": Abs((O2.value as Quantity) - (O1.value as Quantity)) }

define "Greatest Difference Per Test":
  ("Difference in Quantitative Tests" D return D.code ) TestCode
    return {
      code: TestCode,
      maxDifference: Max("Difference in Quantitative Tests" D where D.code ~ TestCode return D."difference")
    }

/*
Write a query to return the average quantitative result for the same test
*/

define "Average Quantitative Result Per Test":
  ("Quantitative Laboratory Results" T return T.code) TestCode
    return {
      code: TestCode,
      avg: Avg("Quantitative Laboratory Results" T where T.code ~ TestCode return (T.value as Quantity))
    }
