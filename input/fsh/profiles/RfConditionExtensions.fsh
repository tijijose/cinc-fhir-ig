Extension: RfConditionDiagnosticCertaintyExtension
Id:  rf-condition-diagnosticcertainty
Title: "Certainty of rheumatic fever diagnosis"
Description: "Certainty of rheumatic fever diagnosis"
Context: Condition
* value[x] only Coding
* value[x] from RheumaticFeverConditionDiagnosticCertaintyValueSet (required)


Extension: RfConditionRhdSeverityExtension
Id:  rf-condition-rhdseverity
Title: "Severity of rheumatic heart disease"
Description: "Severity of rheumatic heart disease determines the severity of a patient's rheumatic fever condition."
Context: Condition
* value[x] only Coding
* value[x] from rf-condition-rhdseverity-code (required)