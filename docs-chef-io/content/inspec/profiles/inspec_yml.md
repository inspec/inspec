+++
title = "inspec.yml File"
draft = false
gh_repo = "inspec"

aliases = ["/inspec/profiles/inspec_yaml"]

[menu]
  [menu.inspec]
    title = "inspec.yml"
    identifier = "inspec/profiles/inspec.yml"
    parent = "inspec/profiles"
    weight = 20
+++

The `inspec.yml` metadata file describes a profile. This file is required.

## Parameters

The `inspec.yml` file defines the following information:

`name`
: A unique name for the profile.

  Required

`title`
: A human-readable name for the profile.

  Optional

`maintainer`
: The profile maintainer.

  Optional

`copyright`
: The copyright holder.

  Optional

`copyright_email`
: The support contact information for the profile, typically an email address.

  Optional

`license`
: The license for the profile.

  Optional

`summary`
: A one line summary for the profile.

  Optional

`description`
: A multiple line description of the profile.

  Optional

`version`
: The profile version.

  Optional

`inspec_version`
: The SemVer version of Chef InSpec that the profile can run under.

  Optional

`supports`
: A list of [supported platform](/inspec/profiles/platforms/) targets.

  Optional

`depends`
: A list of [profile dependencies](/inspec/profiles/depends/).

  Optional

`inputs`
: A list of [inputs](/inspec/profiles/inputs) you can use in your controls.

  Optional

`gem_dependencies`
: A list of profile [gem dependencies](/inspec/profiles/depends/#gem-dependencies) that must be installed for the profile to function correctly.

  Optional

### Example

```yaml
name: ssh
title: Basic SSH
maintainer: Chef Software, Inc.
copyright: Chef Software, Inc.
copyright_email: support@chef.io
license: Proprietary, All rights reserved
summary: Verify that SSH Server and SSH Client are configured securely
version: 1.0.0
supports:
  - platform-family: linux
inputs:
- name: input_name
  required: true
  description: 'Input description.'
  value: 10
  priority: 50
depends:
  - name: profile
    path: ../path/to/profile
gem_dependencies:
  - name: "gem-name"
    version: ">= 2.0.0"
inspec_version: "~> 2.1"
```

### Embedded ERB

The `inspec.yml` also supports embedded ERB.

```yaml
name: dummy
title: InSpec Profile
maintainer: The Authors
copyright: The Authors
copyright_email: you@example.com
license: Apache-2.0
summary: An InSpec Compliance Profile
version: 0.1.0
depends:
- name: inherit
  url: "https://artifactory.com/artifactory/example-repo-local/inspec/0.4.1.tar.gz"
  username: <%= ENV['USERNAME'] %>
  password: <%= ENV['API_KEY'] %>
```
