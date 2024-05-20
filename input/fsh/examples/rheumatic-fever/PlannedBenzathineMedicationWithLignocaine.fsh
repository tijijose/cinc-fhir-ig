Instance: PlannedBenzathineMedicationWithLignocaine
InstanceOf: RheumaticFeverMedicationRequest
Description: "Illustrates planning of benzathine prophylaxis medication with a second embedded MedicationRequest for lignocaine pain relief"
Usage: #example

* meta.profile = Canonical(RheumaticFeverMedicationRequest|1.0.0)
* meta.versionId = "1"
* meta.lastUpdated = "2024-05-17T06:10:00Z" // UTC datetime

* authoredOn = "2023-07-12T04:22:55.965Z"

* basedOn = Reference(CarePlanWithSecondaryProphylaxisPlanned)

* intent = #plan

* medicationReference = Reference(BenzathineMedication)

* performer insert ReferencePractitioner(99ZAAA,[[Isabel Injecta]])

* requester insert ReferenceOrganisation(G0M086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])

* subject insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])

* status = #active

* dosageInstruction.site insert SNOMEDCoding(78333006,[[Structure of gluteus medius muscle (body structure)]])
* dosageInstruction.route insert SNOMEDCoding(78421000,[[Intramuscular route (qualifier value)]])
* dosageInstruction.doseAndRate[0].doseQuantity insert UnitOfMeasureQuantity(25,[[mg]],[[mg]]) 
//* moved to extension below -- dosageInstruction.additionalInstruction insert SNOMEDCoding(1511000175108,[[Every twenty eight days (qualifier value)]]) 

* extension[medicationFrequency].url = Canonical(rf-medicationrequest-medicationfrequency)
* extension[medicationFrequency].valueCoding = $sct#1511000175108 "Every twenty eight days (qualifier value)"

* dispenseRequest.validityPeriod.start = "2023-08-01"
* dispenseRequest.validityPeriod.end = "2026-07-31"

* contained[0] = contained-Lignocaine  // contained resource represents planned lignocaine pain relief

// *************
Instance: contained-Lignocaine
InstanceOf: MedicationRequest
Usage: #inline

* status = #active
* intent = #plan
* subject insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])
* basedOn = Reference(PlannedBenzathineMedicationWithLignocaine)

* medicationCodeableConcept insert NZMTMedicationCoding(10747581000116100,[[lidocaine hydrochloride anhydrous 1% (20 mg/2 mL) injection, ampoule]])
* dosageInstruction.doseAndRate[0].doseQuantity insert UnitOfMeasureQuantity(0.25,[[ml]],[[ml]])
