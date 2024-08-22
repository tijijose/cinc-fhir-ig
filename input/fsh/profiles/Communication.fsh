Alias: $communication-status = http://hl7.org/fhir/event-status
Alias: $communication-category = http://hl7.org/fhir/communication-category
Alias: $communication-medium = http://terminology.hl7.org/CodeSystem/v3-ParticipationMode


Profile: CommunicationFromCPIR
Parent: Communication
Id: CommunicationFromCPIR
Title: "SMS and EmailCommunicationFromCPIR"
Description: "A communication Resource used to record the communication  performed by CPIR"
* ^version = "0.0.1"
* ^purpose = "Record all the communication  performed by CPIR"
* ^status = #draft
* ^jurisdiction = urn:iso:std:iso:3166#NZ
//* insert metaContactDetail([[HNZ Integration Team]],[[digitalserviceshub@tewhatuora.govt.nz]])
//Rules
* identifier 1..
* identifier.use 1..1
* identifier.use = http://hl7.org/fhir/identifier-use#usual
* identifier.value 1..1
* status 1..  //status
* status from  http://hl7.org/fhir/event-status
* subject only Reference(Patient) //nhi
* topic  0.. //Campaign_name &campaign_id
* recipient only Reference(Patient or Practitioner)
* category from http://hl7.org/fhir/communication-category
* sender only Reference(Organization or Device or HealthcareService)   //sender
* medium 1..
* medium  from  http://terminology.hl7.org/CodeSystem/v3-ParticipationMode
* sent 1..1  //event_datetime
* sent ^short = "Must be in UTC timezone on the FHIR server"
* payload 0..* 
* payload.content[x] only  string or Attachment
