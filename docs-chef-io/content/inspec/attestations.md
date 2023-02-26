+++
title = "Attestations"
draft = false
gh_repo = "inspec"

[menu]
 [menu.inspec]
   title = "Attestations"
   identifier = "inspec/reference/attestations.md Attestations"
   parent = "inspec/reference"
   weight = 140
+++

Attestations is a mechanism to mark the `Not Reviewed (N/R)` tests as `passed` or `failed` manually using an attestations file.

## Example

A fire alarm needs to be audited, but it cannot be reviewed (N/R) through automation. Hence, to audit the fire alarm using an InSpec profile, the outcome of its working must be marked as `passed` or `failed` in a test through manual intervention. By using attestations and passing the status using an attestations file, we can audit the fire alarm.

### Attestations File to an audit fire alarm

```yaml
fire-alarm-1:
 expiration_date: 2090-10-1
 status: passed
 justification: "Fire alarm 1 was tested manually and it works."
fire-alarm-2:
 expiration_date: 2090-10-1
 status: failed
 justification: "Fire alarm 2 was tested manually and it does not work."
```

### InSpec Test

```ruby
control "fire-alarm-1" do
 only_if("Fire alarm 1 needs to be tested manually") {
   false
 }
end

control "fire-alarm-2" do
 only_if("Fire alarm 2 needs to be tested manually") {
   false
 }
end
```

### Running attestations to an audit fire alarm

```bash
inspec exec path/to/fire-alarm-audit-profile --attestation-file attestation.yaml

Profile:   InSpec Profile (attestation)
Version:   0.1.0
Target:    local://
Target ID: fa3923b9-f806-4cc2-960d-1ddefb4c7654

 ✔  fire-alarm-1: No-op (1 skipped)
    ↺  Skipped control due to only_if condition: Fire alarm 1 needs to be tested manually
    ✔  Control Attested : Fire alarm 1 was tested manually and it works.
 ×  fire-alarm-2: No-op (1 failed) (1 skipped)
    ↺  Skipped control due to only_if condition: Fire alarm 2 needs to be tested manually
    ×  Control Attested : Fire alarm 2 was tested manually and it does not work.


Profile Summary: 1 successful control, 1 control failure, 0 controls not reviewed, 0 controls not applicable, 0 controls have error
Test Summary: 1 successful, 1 failure, 2 skipped
```

## Attestations Fields

An attestations file identifies:

1. the controls need to be attested.
1. an explanation of why it is manually attested.
1. control status `passed` or `failed` to attest controls.
1. (optional) an URL pointing to a website containing information on control attestation.
1. (optional) an expiration date of attestation.

## Usage

To use attestations, you must have a correctly formatted attestations file and
invoke `inspec exec` with `--attestation-file [path]`.

```bash
inspec exec path/to/profile --attestation-file attestation.yaml
```

## File Format

Attestations files support YAML, JSON, and CSV formats.

```yaml
control_id:
 expiration_date: YYYY-MM-DD
 status: passed
 justification: "reason for attesting this control"
 evidence_url: "URL pointing to a website containing information on control attestation"
```

OR

```json
{
 "control_id": {
   "expiration_date": "YYYY-MM-DD",
   "status": "passed",
   "justification": "reason for attesting this control",
   "evidence_url": "URL pointing to a website containing information on control attestation"
 }
}
```

- `status` is mandatory. If absent, the control will not be attested. It can only be `passed` or `failed`.
- `expiration_date` sets the day the attestations file expires in **YYYY-MM-DD** format. Attestations files expire at 00:00 at the local time of the system on the specified date. Attestations files without expiration date are permanent. `expiration_date` is optional.
- `justification` is a text containing the reason why attestations is required. It might as well as include information on who initiated the attestation. If it is absent, it shows a warning message to include justification in the attestations file.
- `evidence_url` is an URL of a website containing information on control attestation. It is optional.

### File Format Examples

#### Example in YAML

```yaml
example-3.0.1:
 justification: "Passed by the auditor manually"
 evidence_url: "https://www.attestation-info-chef-example/"
 expiration_date: 2050-06-01
 status: passed
example-3.0.2:
 justification: "Failed by the auditor manually"
 evidence_url: "https://www.attestation-info-chef-example/"
 expiration_date: 2050-07-01
 status: failed
```

#### Example in JSON

```json
{
 "example-3.0.1": {
   "justification": "Passed by the auditor manually",
   "evidence_url": "https://www.attestation-info-chef-example/",
   "expiration_date": "2050-06-01",
   "status": "passed"
 },
 "example-3.0.2": {
   "justification": "Failed by the auditor manually",
   "evidence_url": "https://www.attestation-info-chef-example/",
   "expiration_date": "2050-07-01",
   "status": "failed"
 }
}
```

#### Example in CSV

These file formats support the following fields in a file:

- `control_id`
   _Required_.
- `justification`
   _Required_.
- `status`
   _Required_.
- `evidence_url`
   _Optional_.
- `expiration_date`
   _Optional_.

![Attestations File Example](/images/inspec/attestations_file_excel.png)

{{< note >}}

How is the Attestations mechanism different than Waivers?

The waivers mechanism skips the controls for various reasons which are required for waiving. Whereas attestations mark the skipped controls which are not reviewed as `passed` or `failed` using the status passed through the attestations file by the auditor.

{{< /note >}}
