Alias: $communication-RequestStatus =  http://hl7.org/fhir/request-status
Alias: $communication-statusReason = http://terminology.hl7.org/CodeSystem/communication-not-done-reason
Alias: $communication-category = http://hl7.org/fhir/communication-category
Alias: $communication-cmedium = http://terminology.hl7.org/CodeSystem/v3-ParticipationMode

Profile: CommunicationRequestFromCPIR
Parent: CommunicationRequest
Id: CommunicationRequestFromCPIR
Title: "SMS and EmailCommunicationRequestFromCPIR"
Description: "A communication Resource used to record the communication request performed by CPIR"
* ^version = "0.0.1"
* ^purpose = "Record all the communication request performed by CPIR"
* ^jurisdiction = urn:iso:std:iso:3166#NZ
//* insert metaContactDetail([[HNZ Integration Team]],[[digitalserviceshub@tewhatuora.govt.nz]])
//Rules
* identifier 1..
* identifier.use 1..1
* identifier.use = http://hl7.org/fhir/identifier-use#usual
* identifier.value 1..1
* basedOn only Reference(Communication) 
* status 1..  //status
* status from  http://hl7.org/fhir/request-status
* statusReason 1..
* statusReason from http://terminology.hl7.org/CodeSystem/communication-not-done-reason (extensible)
* category from http://hl7.org/fhir/communication-category
* subject only Reference(Patient) //nhi
* recipient only Reference(Patient or Practitioner)
* sender only Reference(Organization or Device or HealthcareService) //sender
* medium 1..
* medium  from  http://terminology.hl7.org/CodeSystem/v3-ParticipationMode
* payload 0..
* payload.content[x] only string or Attachment
* occurrence[x] only dateTime
* occurrence[x] 1..
