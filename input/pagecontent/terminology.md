## Rheumatic Fever API terminology overview

This page provides an overview of the terminology systems that are depended on, or have been created, for use in this FHIR API.

The Rheumatic Fever FHIR resources make use of established SNOMED (International and NZ Editions) and NZMT (New Zealand Medication Terminology) codesystems, and defines new terminology needed to code the certainty of a rheumatic fever diagnosis.


### NZ terminology for rheumatic fever diagnosis

This IG introduces new terminology (CodeSystems and ValueSets) to cover four specific aspects of New Zealand rheumatic fever patient conditions which need to be accurately represented.

1. **summary diagnosis** of a rheumatic fever condition
1. **severity** of rheumatic fever condition
1. **certainty** of rheumatic fever diagnosis
1. **symptomatic status at diagnosis** of rheumatic fever

The new terminology is used in a binding on `Condition.code` and by three *extensions* to `Condition` (see the [Rheumatic Fever Condition structure definition](StructureDefinition-nz-sharedcare-rheumaticfever-condition.html)).

Diagnosis detail data is captured in groups in `Observation` instances (one Observation per diagnosis logical group) and further [ValueSet](ValueSet-rf-observation-diagnosisgroup-code.html) in this IG defines the valid SNOMED codes for this purpose.

### New SNOMED-based ValueSets

SNOMED codes are used in rheumatic fever for:
<!-- markdownlint-disable MD037 -->
1. **severity** of the rheumatic fever condition and of the related rheumatic heart disease condition,
1. **category** of CarePlans and CareTeams,
1. identifying the **medication route** by which secondary prophylaxis medication is taken,
1. identifying the body **site** of secondary prophylaxis medication injection,
1. codifying **roles** of whanau CareTeam participants,
1. codifying medication **substances** a patient is allergic to,
1. codifying the **interval** / **frequency** of medication,

The codes which are valid for these purposes are defined by ValueSets in this Implementation Guide.  

Note that SNOMED codes are taken from the SNOMED CT International Edition wherever possible but a handful of new codes had to be defined where suitable terms were not already available.   These new codes are being introduced in the SNOMED CT **New Zealand Edition** which has a [root concept defined here](https://browser.ihtsdotools.org/?perspective=full&conceptId1=21000210109&edition=MAIN/SNOMEDCT-NZ/2023-10-01&release=&languages=en,mi).

The NZ edition is published only every six months (October and April), and there are also SNOMED licensing restrictions affecting accessibility of NZ edition terms in the [New Zealand Health Terminology Server](https://nzhts.digital.health.nz/fhir/ValueSet) and in the the [FHIR global terminology service](https://tx.fhir.org).  Due to these issues FHIR API clients ValueSets which define SNOMED-based terminology are not usable by FHIR API clients when published at the NZ Health Terminology Server, and so at the present time, the official definitions of rheumatic fever terminology are given by the **ValueSets published in this Implementation Guide**.  

It is anticipated that this situation will ease in the future as the new NZ terms become more accessible to NZ clients through established global terminology services.

### New Zealand Medication Terminology

New Zealand Medication Terminology is [documented here](https://view.nzmt.org.nz/) and its terms can be easily listed by [expanding an NZHTS-published ValueSet](https://nzhts.digital.health.nz/fhir/ValueSet/$expand?url=https://nzhts.digital.health.nz/fhir/ValueSet/rheumatic-fever-Diagnostic-Certainty)

NZMT codes are used in rheumatic fever for:

1.secondary prophylaxis medication **ingredient**

- eg. `#10134211000116105` | benzathine penicillin (as benzathine benzylpenicillin tetrahydrate) [Used in `Medication.ingredient`]

2.secondary prophylaxis medication **brand**

- eg. `#43924201000116108` | Bicillin LA 1.2 million units/2.3 mL (900 mg/2.3 mL) injection: suspension, 1 x 2.3 mL syringe [`Medication.code`]

3.secondary prophylaxis **strength/concentration of lignocaine** pain relief medication 

- eg. `#10747581000116100` | lidocaine hydrochloride anhydrous 1% (20 mg/2 mL) injection, ampoule [`MedicationStatement.medicationCodeableConcept`)]

### Coding of external national system identifier types

Some FHIR resources in this IG need to be capable of holding identifiers to resources in other Te Whatu Ora applications and national applications.  Examples of this class of *national system* identifiers in FHIR include:

- `RheumaticFeverCareplan`s recording a *Salesforce case identifier* (Te Whatu Ora application)

- `RheumaticFeverCondition`s recording a *Salesforce case identifier* and an *EPISurv number* (ESR system)

The convention in this IG that all such external 'national identifiers' will be recorded in a **[*NationalSystem*] slice** on the *identifier* resource element.  This slicing requires FHIR Identifiers to be represented as follows:

```json
"identifier" : [
  {
    "use" : "usual",
    "type" : {
      "coding" : "SHOULD be a code defined by this IG for the type of national identifier"
    },
    "system" : "Url identifying the Naming System of these identifiers, for example https://standards.digital.health.nz/ns/nhi-id",
    "value" : "The actual external identifier value"
  },
  ...
]
```

See the [ValueSet of external identifier types](ValueSet-external-system-identifier-type-code.html) which defines the codes API consumers can give for identifiers which use the [*NationalSystem*] slice.
