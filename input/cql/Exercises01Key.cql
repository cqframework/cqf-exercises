/*
Preliminaries

Lexical Elements
Language Constructs
Identifiers
Case-Sensitivity

There are several lexical errors throughout this library. Correct the errors to
obtain a lexically correct library.
*/
library Exercises01Key

// # Lexical Errors

/*
// This is a comment
// Whitespace is all the "invisibles" (spaces, tabs, returns)
*/ // 1) Multi-line comments need a close
// 2) CQL is case-sensitive, so needs to define not DEFINE
define "This is a quoted identifier": // 3) Quoted identifier missing a close quote
  @2021-03-29 + 3 days // 4) DateTime literals use ISO date/time format

define _1MoreIdentifier: // 5) Unquoted identifiers can't begin with numbers
  0.0 'g' // 6) decimal (and quantity) literals must have a leading zero

// # Syntax Errors

define "Inequality Expression": // 7) Missing a colon after the define
  4 != 5 // 8) Inequality symbol is !=, not <>

define "Relative Comparison Expression":
  4 <= 5 // 9) No space between <= operator

define "Quantity Expression":
  5 'g/dL' // 10) Units of a quantity are specified with a string

// # Semantic Errors

define "Reference Expression":
  "Quantity Expression" // 11) Identifiers are case-sensitive

define "String Concatenation":
  '1' + 'John' // 12) Can't add strings and integers

define "Warning Message":
  Message(1, true, '123', 'Warning', 'This is a warning message')

define "Nested Warning Message":
  1 + Message(2, true, '123', 'Warning', 'The value is 2')
