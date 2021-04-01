/*
Patterns

Primitives
Choices
Slices
Simple Extensions
Complex Extensions
QI Core Patterns
Negation Patterns
CPG Patterns
*/
library Exercises09

using FHIR version '4.0.1'

codesystem "LOINC": 'http://loinc.org'
codesystem "Marital Status Codes": 'http://terminology.hl7.org/CodeSystem/v3-MaritalStatus'
codesystem "CDC Race and Ethnicity Codes": 'urn:oid:2.16.840.1.113883.6.238'

valueset "Marital Status": 'http://hl7.org/fhir/ValueSet/marital-status'

code "Marital Status - Married": 'M' from "Marital Status Codes"
code "American Indian or Alaska Native": '1002-5' from "CDC Race and Ethnicity Codes" display 'American Indian or Alaska Native'
code "Alaska Native": '1735-0' from "CDC Race and Ethnicity Codes" display 'Alaska Native'
code "Blood pressure": '85354-9' from "LOINC" display 'Blood pressure panel with all children optional'
code "Diastolic blood pressure": '8462-4' from "LOINC" display 'Diastolic blood pressure'
code "Systolic blood pressure": '8480-6' from "LOINC" display 'Systolic blood pressure'

context Patient

/*
Update this library to use FHIRHelpers and simplify the expressions to take advantage of the
implicit conversions in FHIRHelpers

This includes deleting the ToQuantity, ToCode and ToConcept functions at the end
of this library, they are provided implicitly as part of FHIRHelpers and the
conversions.
*/

define TestPrimitives:
  Patient P
    where P.gender.value = 'male'
      and P.active.value is true
      and P.birthDate.value before Today()
      and ToConcept(P.maritalStatus) in "Marital Status"
      and ToConcept(P.maritalStatus) ~ "Marital Status - Married"

define TestChoice:
  Patient P
    where (P.deceased as FHIR.boolean).value is false
      or (P.deceased as FHIR.dateTime).value before Today()

define TestSlices:
  [Observation: "Blood pressure"] BP
    let
      SystolicBP: singleton from (BP.component C where ToConcept(C.code) ~ "Systolic blood pressure"),
      DiastolicBP: singleton from (BP.component C where ToConcept(C.code) ~ "Diastolic blood pressure")
    where ToQuantity(SystolicBP.value as FHIR.Quantity) < 140 'mm[Hg]'
      and ToQuantity(DiastolicBP.value as FHIR.Quantity) < 90 'mm[Hg]'

define TestSimpleExtensions:
  Patient P
    let birthsex: singleton from (
        P.extension E where E.url.value = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-birthsex'
    )
    where (birthsex.value as FHIR.code).value = 'M'

define TestComplexExtensions:
  Patient P
    let
      race: singleton from (
        P.extension E where E.url.value = 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-race'
      ),
      ombCategory: race.extension E where E.url.value = 'ombCategory',
      detailed: race.extension E where E.url.value = 'detailed'
    where (ombCategory O return ToCode(O.value as FHIR.Coding)) contains "American Indian or Alaska Native"
      and (detailed O return ToCode(O.value as FHIR.Coding)) contains "Alaska Native"

define function ToQuantity(quantity FHIR.Quantity):
    if quantity is null then
        null
    else
        System.Quantity { value: quantity.value.value, unit: quantity.code.value }

define function ToCode(coding FHIR.Coding):
    if coding is null then
        null
    else
        System.Code {
          code: coding.code.value,
          system: coding.system.value,
          version: coding.version.value,
          display: coding.display.value
        }

define function ToConcept(concept FHIR.CodeableConcept):
    if concept is null then
        null
    else
        System.Concept {
            codes: concept.coding C return ToCode(C),
            display: concept.text.value
        }
