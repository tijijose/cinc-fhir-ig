Alias: $nhi-use-code = https://nzhts.digital.health.nz/fhir/ValueSet/nhi-use-code
Profile: RheumaticFeverCarePlan
Parent: CarePlan
Title: "Rheumatic Fever CarePlan"
Description: "Profiles shared care plans used in NZ for provision of rheumatic fever secondary prevention"
Id: cinc-rheumaticfever-careplan

* ^jurisdiction = urn:iso:std:iso:3166#NZ
* ^purpose = "Profiles a secondary prevention care plan for a NZ rheumatic fever patient"

// elements modified from base profile

* author 1..1
* author only Reference(Practitioner or Organization)

* activity.reference only Reference(MedicationRequest or Appointment)

* addresses 1..*
* addresses only Reference(RheumaticFeverCondition)

* category 1..1

// * category from https://nzhts.digital.health.nz/fhir/ValueSet/rheumatic-fever-care-plan-category
// The category code is defined in a ValueSet on NZHTS but there are problems relating to the 
// fact that the code is in a temporary codesystem while we wait for SNOMED NZ edition April 2024 to roll around
// So for now, this profile requires that the canonical ValueSet will be the one defined in this IG
* category from rf-careplan-category-code (required)

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "use"
* identifier ^slicing.rules = #open
* identifier contains NHI 1..1 and NationalSystem 0..*   // We allow here for any 1 or more references to identifiers in external 'national' systems.  This allows for refs to salesforce, Episurv, etc,. 

// SLICE NUMBER ONE - an NHI reference as the OFFICIAL identifier with system properly set
* identifier[NHI] ^short = "This allows a rheumatic fever careplan to link to the corresponding object in salesforce"

* identifier[NHI].use from $nhi-use-code (required)
* identifier[NHI].use = #official
* identifier[NHI].system 1..1
* identifier[NHI].system = "https://standards.digital.health.nz/ns/nhi-id" (exactly)
* identifier[NHI].value 1..1
* identifier[NHI].value insert MakeProfileIdentifierExample([[National Health Index]],[[SCF7824]])
* identifier[NHI].id 0..0       // don't want this kind of thing
* identifier[NHI].extension 0..0       // don't want this kind of thing



// SLICE NUMBER TWO
// This slice allows (0 or more) use=USUAL identifier references to link to external 'national' systems.  

* identifier[NationalSystem] ^short = "This slice lets clients link FHIR rheumatic fever care plans to corresponding records in Salesforce, Episurv etc."

* identifier[NationalSystem].use 1..1
* identifier[NationalSystem].use = #usual

* identifier[NationalSystem].system 0..1        // system Uri may (SHOULD) be specified but it's up to clients to do this.
* identifier[NationalSystem].system insert MakeProfileIdentifierSystemExample([[Uri that defines the type of external identifier]])

// In this slice, clients MUST set a type taken from known external identifier type codes
* identifier[NationalSystem].type 1..1      
* identifier[NationalSystem].type from ExternalSystemIdentifierTypeValueSet

// a value MUST be given and we give an example here
* identifier[NationalSystem].value 1..1
* identifier[NationalSystem].value insert MakeProfileIdentifierExample([[Some Salesforce CarePlan object id]],[[CTM-0000144]])

* identifier[NationalSystem].id 0..0       // don't want this kind of thing
* identifier[NationalSystem].extension 0..0       // don't want this kind of thing

* instantiatesCanonical only Canonical(PlanDefinition)

* period 1..1
* period obeys fhir-hnz-period-utc-1

* subject only Reference(NzPatient)

* title 1..1

// extensions
* extension contains
  RfCarePlanOnHoldReasonExtension named onHoldReason 0..1 and
  RfCarePlanClosureReasonExtension named closureReason 0..1

// elements prohibited
* activity.detail 0..0
* activity.modifierExtension 0..0
* contained 0..0

* partOf 0..0

* implicitRules 0..0
* instantiatesUri 0..0
* language 0..0
* modifierExtension 0..0
