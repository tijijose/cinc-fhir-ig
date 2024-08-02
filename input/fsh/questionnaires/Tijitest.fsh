Alias: $usage-context-type = http://terminology.hl7.org/CodeSystem/usage-context-type
Alias: $unitsofmeasure = http://unitsofmeasure.org
Alias: $coding-test = http://example.org/coding-test
Alias: $questionnaire-item-control = http://hl7.org/fhir/questionnaire-item-control

Instance: bit-of-everything
InstanceOf: Questionnaire
Usage: #definition
* meta.versionId = "20"
* meta.lastUpdated = "2024-05-09T22:24:58.5544106+00:00"
* language = #en-NZ
* url = "http://fhir.forms-lab.com/Questionnaire/bit-of-everything"
* version = "0.1"
* name = "BitOfEverything"
* title = "Bit of everything test"
* date = "2024-05-10T08:24:02.091+10:00"
* publisher = "Tiji&Swapna&Naz Test"
* description = "A Demonstraton form that contains one of each of the item controls (except group)"
* useContext.code = $usage-context-type#user "User Type"
* useContext.valueCodeableConcept = #demo "Demonstration"
* status = #active
* item.extension.url = "http://hl7.org/fhir/StructureDefinition/terminology-server"
* item.extension.valueUrl = "https://sqlonfhir-r4.azurewebsites.net/fhir"
* item.linkId = "root"
* item.text = "Bit of Everything"

* item.type = #group
* item.item[0].linkId = "Item-label"
* item.item[=].text = "display labelAA"
* item.item[=].type = #display

* item.item[+].linkId = "Item-string"
* item.item[=].text = "stringBB"
* item.item[=].type = #string

* item.item[+].extension.url = "http://standards.healthconnex.com.au/fhir/StructureDefinition/Questionnaire-TextArea-Row"
* item.item[=].extension.valueInteger = 10
* item.item[=].linkId = "Item-text"
* item.item[=].text = "textCC"
* item.item[=].type = #text

* item.item[+].linkId = "Item-bool"
* item.item[=].code.code = #true
* item.item[=].text = "booleanDD"
* item.item[=].type = #boolean

* item.item[+].linkId = "Item-date"
* item.item[=].text = "dateEE"
* item.item[=].type = #date

* item.item[+].linkId = "Item-datetime"
* item.item[=].text = "datetimeFF"
* item.item[=].type = #dateTime

* item.item[+].linkId = "Item-time"
* item.item[=].text = "timeGG"
* item.item[=].type = #time

* item.item[+].linkId = "Item-integer"
* item.item[=].text = "integerHH"
* item.item[=].type = #integer

* item.item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
* item.item[=].extension.valueCoding = $unitsofmeasure#m "meters"
* item.item[=].linkId = "Item-decimal"
* item.item[=].text = "decimalH"
* item.item[=].type = #decimal

* item.item[+].linkId = "Item-url"
* item.item[=].text = "urlI"
* item.item[=].type = #url

* item.item[+].linkId = "Item-reference"
* item.item[=].text = "referenceJJ"
* item.item[=].type = #reference

* item.item[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/mimeType"
* item.item[=].extension[=].valueCode = #image/png
* item.item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/mimeType"
* item.item[=].extension[=].valueCode = #image/jpeg
* item.item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/mimeType"
* item.item[=].extension[=].valueCode = #application/json
* item.item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/mimeType"
* item.item[=].extension[=].valueCode = #application/pdf

* item.item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/maxSize"
* item.item[=].extension[=].valueDecimal = 1000000
* item.item[=].linkId = "Item-attachment"
* item.item[=].text = "attachmentKK"
* item.item[=].type = #attachment

* item.item[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption"
* item.item[=].extension[=].valueCoding = $unitsofmeasure#m "meters"
* item.item[=].extension[+].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption"
* item.item[=].extension[=].valueCoding = $unitsofmeasure#cm "centimeters"
* item.item[=].linkId = "Item-quantity"
* item.item[=].text = "quantityLL"
* item.item[=].type = #quantity



* item.item[+].linkId = "Item-rb-local"
* item.item[=].text = "radiobuttons (answerOptions)MM"
* item.item[=].type = #choice
* item.item[=].repeats = false
* item.item[=].answerOption[0].valueCoding = $coding-test#a "option A"
* item.item[=].answerOption[+].valueCoding = $coding-test#b "option B"

* item.item[+].linkId = "Item-rb"
* item.item[=].text = "radiobuttons (answerValueSet)NN"
* item.item[=].type = #choice
* item.item[=].repeats = false
* item.item[=].answerValueSet = "http://fhir.telstrahealth.com.au/tcm/ValueSet/ARE"

* item.item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].extension.valueCodeableConcept = $questionnaire-item-control#drop-down
* item.item[=].linkId = "Item10"
* item.item[=].text = "drop-down (answerValueSet)OO"
* item.item[=].type = #choice
* item.item[=].repeats = false
* item.item[=].answerValueSet = "http://fhir.telstrahealth.com.au/tcm/ValueSet/ARE"

* item.item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].extension.valueCodeableConcept = $questionnaire-item-control#autocomplete
* item.item[=].linkId = "Item11"
* item.item[=].text = "autocomplete (countries)PP"
* item.item[=].type = #choice
* item.item[=].repeats = false
* item.item[=].answerValueSet = "http://fhir.telstrahealth.com.au/tcm/ValueSet/COU"

* item.item[+].extension.url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
* item.item[=].extension.valueCodeableConcept = $questionnaire-item-control#autocomplete
* item.item[=].linkId = "Item12"
* item.item[=].text = "open-choice (countries)QQ"
* item.item[=].type = #open-choice
* item.item[=].repeats = false
* item.item[=].answerValueSet = "http://fhir.telstrahealth.com.au/tcm/ValueSet/COU"