Instance: CarePlanClosed
InstanceOf: RheumaticFeverCarePlan
Usage: #example
Description: "Example of an RF care plan that has gone on-hold, after the first secondary prophylaxis appointment has been attended."

* meta.profile = Canonical(RheumaticFeverCarePlan|1.0.0)
* meta.versionId = "3"
* meta.lastUpdated = "2024-06-12T06:00:00Z"

* identifier[NHI] insert NHIIdentifier(SCF7824)
* identifier[NationalSystem][0] insert SalesforceCarePlanIdentifier(00073693)

* title = "Care plan closed with only one appointment completed"

* insert AddressesConditionExample(SevereRfConditionExample)

* category = $sct#320721000210102 "Rheumatic fever secondary prevention care plan" 

* intent = #plan

* created       = "2023-06-12T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.start  = "2023-08-01T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* period.end    = "2033-07-31T00:00:00Z"    // UTC equivalent of midday NZ time (depend on the season)
* status = #revoked

* activity[0].reference = Reference(PlannedBenzathineMedication)
* activity[+].reference = Reference(SecondaryProphylaxisAppointment-August-Fulfilled)
* activity[+].reference = Reference(SecondaryProphylaxisAppointment-September-Booked)

* insert PatientInstanceReference(subject,MadeleineMeringue)
* author insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* careTeam[0] = Reference(SecondaryProphylaxisCareTeam)

* supportingInfo[0] = Reference(PatientMedicationAllergyQuestionnaireResponse)
* supportingInfo[+] = Reference(MedicationsAndFollowUpGuidanceQuestionnaireResponse)
* supportingInfo[+] = Reference(PatientWhanauGoalsPreferencesQuestionnaireResponse)
* supportingInfo[+] = Reference(RFPatientHealthAssessmentQuestionnaireResponse)       //  *****

* extension[lifelongSecondaryProphylaxis].url = "https://build.fhir.org/ig/tewhatuora/cinc-fhir-ig/StructureDefinition/rf-careplan-lifelongSecondaryProphylaxis"
* extension[lifelongSecondaryProphylaxis].valueBoolean = false

// * extension[0].url = "https://build.fhir.org/ig/tewhatuora/cinc-fhir-ig/StructureDefinition/rf-careplan-onhold-reason"
// * extension[=].valueString = "Patient has gone on big OE"

* extension[closureReason].url = "https://build.fhir.org/ig/tewhatuora/cinc-fhir-ig/StructureDefinition/rf-careplan-closure-reason"
* extension[closureReason].valueString = "Patient has become enlightened and now lives in Nepal"

