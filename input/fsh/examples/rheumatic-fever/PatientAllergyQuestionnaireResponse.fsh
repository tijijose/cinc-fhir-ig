Instance: PatientMedicationAllergyQuestionnaireResponse
InstanceOf: QuestionnaireResponse
Description: "Example payload demonstrating data collected about a patient's allergies to RF medication."
Usage: #example
* status = #completed
* authored = "2023-10-10T03:08:00.504Z"
* questionnaire = Canonical(PatientMedicationAllergyQuestionnaire)

* subject insert NHIPatientRef(SCF7824,[[Madeleine Meringue]])
* author insert ReferenceOrganisation(GOM086-B,[[Te Tai Tokerau Rheumatic Fever Secondary Prevention Service]])
* basedOn = Reference(DraftCarePlan)

// NOTE: item numbering does not have to match the Questionnaire because answers relate to questions through link_id

* item[0] insert answerItem(MedicationAllergies,[[Medication allergies? (Yes/No/Unknown)]])
* item[=].answer.valueString = "Yes"

* item[+] insert answerItem(AllergyDetails,[[If yes, select which substances apply]])
* item[=].answer.valueCoding = $sct#22005007 "Ethyl chloride"
