Alias: $coding-test = http://example.org/coding-test

Instance: 294937
InstanceOf: QuestionnaireResponse
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2024-08-01T19:35:44.667-04:00"
* meta.tag.code = #"lformsVersion: 36.3.3"
* status = #completed
* subject = Reference(Patient/459f7755-d833-445e-9e59-c04aaa4e0862) "Lashawnda Tillman"
* authored = "2024-08-01T23:35:43.715Z"
* item.linkId = "root"
* item.text = "Bit of Everything"
* item.item[0].linkId = "Item-string"
* item.item[=].text = "stringBB"
* item.item[=].answer.valueString = "c"
* item.item[+].linkId = "Item-text"
* item.item[=].text = "textCC"
* item.item[=].answer.valueString = "c"
* item.item[+].linkId = "Item-bool"
* item.item[=].text = "booleanDD"
* item.item[=].answer.valueBoolean = false
* item.item[+].linkId = "Item-date"
* item.item[=].text = "dateEE"
* item.item[=].answer.valueDate = "2024-08-06"
* item.item[+].linkId = "Item-datetime"
* item.item[=].text = "datetimeFF"
* item.item[=].answer.valueDateTime = "2024-08-12T01:36:55.936Z"
* item.item[+].linkId = "Item-time"
* item.item[=].text = "timeGG"
* item.item[=].answer.valueTime = "03:37:59"
* item.item[+].linkId = "Item-quantity"
* item.item[=].text = "quantityLL"
* item.item[=].answer.valueQuantity = 6 'm' "meters"
* item.item[+].linkId = "Item-rb-local"
* item.item[=].text = "radiobuttons (answerOptions)MM"
* item.item[=].answer.valueCoding = $coding-test#b "option B"