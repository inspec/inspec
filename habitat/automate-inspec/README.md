# Automate InSpec Habitat Package

## Purpose

This Habitat package is used in Automate 2.  Its installation is mutually exclusive with `chef/inspec`.  It is a package of `inspec`, with the following modifications:

1. The package is released under the Chef Master License and Services Agreement; this permits the use of proprietary (non-free) features.
1. The binstub for inspec is modified to detect whether the license has been accepted.
1. The inspec-scap plugin is installed.
1. To harmonize with Automate, the postgresql library is version-pinned to match that needed by chef/automate-postgresql.

## Testing

From the root of the InSpec source code run the following:

```
hab studio enter
GITHUB_TOKEN='YOUR_USERNAME:YOUR_PERSONAL_ACCESS_TOKEN' build habitat/automate-inspec
MLSA_ACCEPTED='true' hab pkg exec chef/automate-inspec inspec scap
```
