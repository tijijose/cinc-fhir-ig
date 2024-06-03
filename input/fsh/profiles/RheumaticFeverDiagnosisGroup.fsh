Profile: RheumaticFeverDiagnosisGroup
Parent: Observation
Title: "Rheumatic Fever Diagnosis Group"
Description: "This profile constrains the codes valid on an Observation so it can represent groups of rheumatic fever diagnosis data."
Id: nz-sharedcare-rheumaticfever-diagnosisgroup

* ^version = "1.0.0"
* ^jurisdiction = urn:iso:std:iso:3166#NZ
* ^purpose = "Constraints coding of a standard FHIR Observation for use in RF diagnosis representation"
* insert metaContactDetail([[David Grainger]],[[david.grainger@middleware.co.nz]])

// bind to the permissible SNOMED codes for NZ RF diagnosis groups.
* code 1..1
* code ^short = "For rheumatic fever data, must be one of the diagnosis group codes"
* code from rf-observation-diagnosisgroup-code (required)   // see ValueSet

* component.code ^short = "Code must uniquely identify the component within this group (Observation instance)"

* hasMember 0..1
* hasMember only Reference(Observation)

// remove standard Observation elements not needed
* value[x] 0..0
* contained 0..0
* specimen 0..0
* device 0..0
* referenceRange 0..0
