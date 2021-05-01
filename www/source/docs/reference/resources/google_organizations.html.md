---
title: About the google_organizations Resource
platform: gcp
---

# google\_organizations

Use the `google_organizations` InSpec audit resource to test properties of all, or a filtered group of, GCP 
organizations.

<br>

## Syntax

A `google_organizations` resource block collects GCP organizations then tests that group.

    describe google_organizations do
      it { should exist }
    end

Use this InSpec resource to enumerate IDs then test in-depth using `google_organization`.

    google_organizations.names.each do |name|
      describe google_organization(name: name) do
        it { should exist }
        its('lifecycle_state') { should eq "ACTIVE" }
      end
    end

<br>

## Examples

The following examples show how to use this InSpec audit resource.

### Test that there are no more than a specified number of organizations available

    describe google_organizations do
      its('count') { should be <= 100}
    end

### Test that an expected organization name is available

    describe google_organizations do
      its('names') { should include "organization/1234" }
    end

### Test that an expected organization display name is available

    describe google_organizations do
      its('display_names') { should include "google.com" }
    end
    
### Test that all organizations are ACTIVE

    describe google_organizations do
      its('lifecycle_state'){ should eq 'ACTIVE' }
    end    

### Test that a particular subset of ACTIVE organizations with display name 'goog*' exist

    google_organizations.where(display_name: /^goog/, lifecycle_state: 'ACTIVE').names.each do |name|
      describe google_organization(name: name) do
        it { should exist }
      end
    end
    
<br>

## Filter Criteria

This resource supports the following filter criteria:  `name`; `display_name` and `lifecycle_state`. Any of these may be used with `where`, as a block or as a method.

## Properties

*  `names` - an array of google_organization identifier strings
*  `display_names` - an array of google_organization display name strings
*  `lifecycle_state`- an array of google_organization lifecycle state strings

<br>


## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the project.