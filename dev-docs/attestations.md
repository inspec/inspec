# Attestations

## Use Cases

As a compliance officer,
I want to mark skipped controls as manually passed or failed
so that I can manually complete the profile.

As a compliance officer,
I want to set an expiration date and a justification for my attestations
so that I can control their application.

As a compliance officer,
I want flexibility in the file format accepted by the attestations system (XLSX, YAML, CSV, JSON),
so that I can use a familiar file format.

When used with Enhanced Outcomes, this becomes handling `Not Reviewed` controls.

## Mechanism

### CLI option desirable

`inspec exec profilename --attestation-file file.???`

The new option is named like `--waiver-file` - singular, with `-file`. You may provide multiple arguments for the option.

The file can be any of the following formats: `YAML`, `CSV`, or `JSON`.

#### YAML and JSON

An array of Hashes.

#### CSV

CSV is the first sheet in the file.

Both formats assume a header row.

### Fields in the file

#### control_id

_Required_. Matches control ID of the control.

#### justification

_Required_. Free text field, used as an explanation for the control when displayed.

#### evidence_url

_Optional_. URL to some evidence, determined by the user, supports the justification.

#### expiration_date

_Optional_. If present, the attestation expires at the end of the date given.

#### status

_Optional_.

Default `passed`. If the attestation should indicate that the control is a failure, set this to `failed`.

### Implementation

When running, at the **RunData** stage, attestations are handled by the following process:

1. Locate matching controls by matching the control ID.

2. Inject an artificial test result into the control. Use the attestation justification as the result message.

3. If the attestation is expired, set the new test result to Skip.

4. If the attestation is not expired, set the new test result to the status given on the attestation data (default pass).

5. Record a copy of the attestation data structure in the Control RunData structure.

### Compatibility

To support backward compatibility with existing MITRE work, support will be added (but not otherwise documented) for the following fields:

* explanation - the equivalent of justification
* updated (Date) and frequency (string enum) - together, the equivalent of the expiration date.
