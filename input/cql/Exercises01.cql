/*
Preliminaries

Lexical Elements
Language Constructs
Identifiers
Case-Sensitivity

[CQL Railroad Diagrams](http://build.fhir.org/ig/HL7/cql/19-l-cqlsyntaxdiagrams.html)

There are several lexical, syntactic, and semantic errors throughout this library. Correct the errors to
obtain a lexically correct library.
*/
library Exercises01

// # Lexical Errors

/*
// This is a comment
// Whitespace is all the "invisibles" (spaces, tabs, returns)
Define "This is a quoted identifier:
  @20210329 + 3 days

define _1MoreIdentifier:
  0.0 'g'

// # Syntax Errors

define "Inequality Expression"
  4 != 5

define "Relative Comparison Expression":
  4 <= 5

define "Quantity Expression":
  5 'g/dL'

// # Semantic Errors

define "Reference Expression":
  "Quantity Expression"

define "String Concatenation":
  (1) + 'John'

define "Warning Message":
  Message(1, true, '123', 'Warning', 'This is a warning message')

define "Nested Warning Message":
  1 + Message(2, true, '123', 'Warning', 'The value is 2')
