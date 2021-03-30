/*
Types and Values

Type Categories (Simple, Structured, Interval, List, Choice)
Simple Types (Boolean, Integer, Decimal, String, Date, DateTime, Time)
Clinical Structured Types (Quantities, Ratios, Codes, Concepts)
Structured Values and Classes
Missing Information
Conversions
Type Testing and Casting
Choice Types
*/
library Exercises02

define "Boolean True": true
define "Boolean False": false

/*
Fill in the blanks to make the expressions evaluate to true
*/

// # Boolean Values

define "Boolean Not":
  (not true) is _____

define "Boolean And":
  (true and false) is _____

define "Boolean Xor":
  true xor false is _____

// NOTE: Translator Known Issue [#617](https://github.com/cqframework/clinical_quality_language/issues/617)
define "Boolean Implies":
  (false implies true) is _____

// # String Values

define "Simple String":
  'John Doe'

define "String Escapes":
  'John O\'Mally'

define "String Equality":
  ('John Doe' = 'john doe') is _____

define "String Comparisons":
  ('Deer' < 'Doe') is _____

// # Numbers

define "Integer":
  5

define "Decimal":
  5.0

define "Implicit Decimal Conversion":
  5 + 5.0

define "Decimal Comparison Ignores Precision":
  5.0 = 5.00

define "Standard Arithmetic Precedence":
  2 + 5 * 10

define "Use Parentheses to Force Precedence":
  (2 + 5) * 10

define "Division Returns Decimal":
  10 / 2

define "Use Truncated Divide (div) for Integer Division":
  10 div 2

define "Mod returns remainder":
  10 mod 2

// # Quantities

define "Mass Quantity":
  25 'mg'

define "Length Quantity":
  100 'cm2'

define "Respect the Units":
  1 'm' = 100 'cm'

define "Calculate the Units":
  10 'cm' * 10 'cm'

// # Date and Time Values

define "Date Value":
  @2021-03-01

define "DateTime Value":
  @2021-03-01T14:30:14.5

define "DateTime Value With UTC Offset":
  @2021-03-01T14:30:14.5Z

define "DateTime Value With Timezone Offset":
  @2021-03-01T14:30:14.5-07:00

define "Time Value (at midnight)":
  @T12:00:00.0

define "Time Value":
  @T14:30:14.5

define "Partial Date (Year)":
  @2014

define "Partial Date (Year-Month)":
  @2014-01

define "Partial Time (Hour)":
  @T14

define "Partial Time (Hour Minute)":
  @T14:30

define "DateTime Function":
  DateTime(2014, 7, 5)

define "Time Function":
  Time(14, 30)

define "Date From":
  date from @2014-01-25T14:30:14

define "Time From":
  time from @2014-01-25T14:30:14

define "Component From (Year)":
  year from @2014-01-25

define "Now Function":
  Now()

define "Today Function":
  Today()

define "TimeOfDay Function":
  TimeOfDay()

// # Structured Values

define "Simple Info":
  Tuple { name: 'Patrick', dob: @2014-01-01 }

define "Nested Info":
  {
    name: 'Patrick',
    dob: @2014-01-01,
    address: {
      line1: '41 Spinning Ave',
      city: 'Dayton',
      state: 'OH'
    },
    phones: {
      {
        number: '202-413-1234',
        use: 'home'
      }
    }
  }

// # Missing Information

define "Null Comparison":
  1 = null

define "Null Arithmetic":
  1 + null

define "Null Predicate":
  1 is null

define "Not Null Predicate":
  1 is not null

define "3-Valued Logic And":
  false and null

define "3-Valued Logic Or":
  true or null

define "Coalesce Expression":
  Coalesce(null, 1)
