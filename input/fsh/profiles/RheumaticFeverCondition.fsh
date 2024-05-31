Profile: RheumaticFeverCondition
Parent: NzCondition
Title: "Rheumatic Fever Condition"
Description: "This profile contains diagnosis code and adds rheumatic heart disease severity and diagnosis certainty extensions to the base NzCondition resource."
Id: nz-sharedcare-rheumaticfever-condition

* ^version = "1.0.0"
* ^jurisdiction = urn:iso:std:iso:3166#NZ
* ^purpose = "Profiles a condition to add severity and diagnostic certainty classifiers and an extra assessment date for capture of NZ rheumatic fever case registration data"
* insert metaContactDetail([[David Grainger]],[[david.grainger@middleware.co.nz]])

// elements modified
* subject only Reference(Patient)
* recordedDate ^short = "Date and time (UTC) of diagnosis" 
* onset[x] only dateTime
* onsetDateTime ^short = "Date and time (UTC) of onset of rheumatic fever"
* recorder only Reference(Practitioner)

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains NationalSystem 0..*

// This slice allows (0 or more) use=USUAL identifier references for linking to external 'national' systems.  

* identifier[NationalSystem] ^short = "This slice link a rheumatic fever condition instance to its record in the corresponding national system eg. RFCCS"

* identifier[NationalSystem].use 1..1
* identifier[NationalSystem].use = #usual

* identifier[NationalSystem].system 0..1        // system Uri may (SHOULD) be specified but it's up to clients to do this.
* identifier[NationalSystem].system insert MakeProfileIdentifierSystemExample([[Uri that defines the type of external identifier]])

// In this slice, clients MUST set a type taken from known external identifier type codes
* identifier[NationalSystem].type 1..1      
* identifier[NationalSystem].type from ExternalSystemIdentifierTypeValueSet

// a value MUST be given and we give an example here
* identifier[NationalSystem].value 1..1
* identifier[NationalSystem].value insert MakeProfileIdentifierExample([[Salesforce object id]],[[CON-0206]])

* identifier[NationalSystem].id 0..0       // don't want this kind of thing
* identifier[NationalSystem].extension 0..0       // don't want this kind of thing

// bind to the permissible SNOMED codes for NZ RF diagnosis.
* code 1..1
* code ^short = "Must be one of the diagnosis codes"
* code from rf-condition-diagnosis-code (required)

* stage 0..0      // don't need this as there are no formal stage conventions in RF diagnosis

* evidence 0..3
* evidence ^short = "A maximum of 3 Observation instances are expected to represent RF diagnosis"
* evidence.code from rf-observation-diagnosisgroup-code (required)
* evidence.code ^short = "This code identifiers the GROUP of diagnosis data represented by the linked Observation"
* evidence.detail only Reference(Observation)

* severity 0..1

// extensions
* extension contains
  RfConditionRhdSeverityExtension named rhdSeverity 0..1 
    and
  RfConditionDiagnosticCertaintyExtension named diagnosticCertainty 0..1
    and
  RfConditionAssessmentDateExtension named assessmentDate 0..1
    and
  RfConditionSymptomaticAtDiagnosisExtension named symptomStatusAtDiagnosis 0..1

* extension[assessmentDate] ^short = "date (UTC) of RHD severity assessment"
* extension[diagnosticCertainty] ^short = "This certainty code value must be interpreted in conjunction with the patient's diagnosis in Condition.code"

// elements prohibited
* implicitRules 0..0
* language 0..0