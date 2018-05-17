# Automate InSpec Habitat Package

## Purpose

This Habitat package is used in Automate 2 and requires the use of additional non open source plugins such as `inspec-scap`.

## Testing

From the root of the InSpec source code run the following:

```
hab studio enter
GITHUB_TOKEN='YOUR_USERNAME:YOUR_PERSONAL_ACCESS_TOKEN' build habitat/automate-inspec
MLSA_ACCEPTED='true' hab pkg exec your_origin/automate-inspec inspec scap
```
