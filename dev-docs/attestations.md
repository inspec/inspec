# Attestations

## Use Cases

As a compliance officer
I want to be able to mark skipped controls as manually passed or failed
so that I can manually complete the profile

As a compliance officer
I want to set an expiration date and a justification on my attestations
so that I can control their application

As a compliance officer
I want flexibility in the file format accepted by the attestations system (XLSX, YAML, CSV, JSON)
so that I can use a familiar file format

When used in conjunction with Enhanced Outcomes, this becomes handling Not Reviewed controls.

## Mechanism

### CLI option desirable

`inspec exec profilename --attestation-file file.???`

Option is named like `--waiver-file` - singular, with `-file`. You may provide multiple arguments to the option.

File may be either YAML, XLSX, CSV, or JSON.

#### YAML and JSON

Array of Hashes.

#### XLSX and CSV

XLSX is the first sheet in the file.

Both formats assume a header row.

### Fields in the file

#### control_id

Required. Matches control ID of the control.

#### justification

Required. Free text field, used as explanation for the control when displayed.

#### evidence_url

Optional. URL to some sort of evidence, determined by the user, that supports the justification.

#### expiration_date

Optional. If present, the attestation expires at the end of the date given.

#### status

Optional, default "passed". Either passed or failed. If the attestation should indicate that the control is a failure, set this to "failed".

### Implementation

When running, at the RunData stage, attestations are handled by the following process:

1. Locate matching controls my matching the control ID.

2. Inject an artificial test result into the control. Use the attestation justification as the result message.

3. If the attestation is expired, set the new test result to Skip.

4. If the attestation is not expired, set the new test result to the status given on the attestation data (default pass).

5. Record a copy of the attestation data structure in the Control RunData structure.

### Compatibility

To support backwards compatibility with existing MITRE work, support will be added (but not otherwise documented) for the following fields:

 * explanation - equivalent of justification
 * updated (Date) and frequency (string enum) - together, equivalent of expiration date.
