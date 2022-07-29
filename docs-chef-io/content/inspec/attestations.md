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

Attestation is a mechanism to mark `Not Reviewed (N/R)` controls to `passed` or `failed` manually using an attestation file.An attestation file identifies:

1. which controls needs to be attested.
2. an explanation of why it is manually attested.
3. control status `passed` or `failed` to attest controls.
3. (optionally) an URL pointing to website containing information on control attestation.
4. (optionally) an expiration date of attestation.

## Usage

To use waivers, you must have a correctly formatted attestation file and
invoke `inspec exec` with `--attestation-file [path]`.

```bash
inspec exec path/to/profile --attestation-file attestation.yaml
```

## File Format

Attestation files support YAML, JSON, CSV, XLSX & XLS format.

```yaml
control_id:
  expiration_date: YYYY-MM-DD
  status: passed
  justification: "reason for attesting this control"
  evidence_url: "url pointing to a website containing information on control attestation"
```

OR

```json
{
  "control_id": {
    "expiration_date": "YYYY-MM-DD",
    "status": "passed",
    "justification": "reason for attesting this control",
    "evidence_url": "url pointing to a website containing information on control attestation"
  }
}
```

- `expiration_date` sets the day that the attestation file will expire in YYYY-MM-DD format. Attestation files expire at 00:00 at the local time of the system on the specified date. Attestation files without an expiration date are permanent. `expiration_date` is optional.
- `status` is mandatory. If absent, the control will not be attested. It can only be `passed` or `failed`.
- `justification` is a text containing reason why attestation is required. It might as well as include information who initiated attestation.
- `evidence_url` is an URL of a website containing information on control attestation. It is optional.

### Examples:

Example in YAML:

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

Example in JSON:

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
