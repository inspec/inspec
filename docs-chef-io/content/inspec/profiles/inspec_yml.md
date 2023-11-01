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
: A list of [supported platform](#platform-support) targets.

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

## Platform support

Use the `supports` setting in the `inspec.yml` file to specify one (or more) platforms for which a profile is targeting. The list of supported platforms may contain the following:

- Use `platform-family` to restrict to a specific platform family.
- Use `platform-name` to restrict on a specific platform name. `platform-name` supports asterisk (`*`) wildcard use.
- Use `release` to restrict to a specific platform version, and use together with `platform-name`. `release` supports asterisk (`*`) wildcard use.
- Use `platform` to restrict on either platform-name or platform-family.

To get a list of all valid values for `platform-name` and `platform-family`, run `inspec schema platforms`, which returns the supported list in JSON format.

For compatibility we support `os-name` and `os-family`. We recommend all users
to change `os-name` to `platform-name` and `os-family` to `platform-family`.

With Chef InSpec 2.0, we introduced new families to help distinguish the cloud
platforms. The new families can restrict the platform family to `os`, `aws`, `azure` or `gcp`.

For example, to target anything running Debian Linux, use:

```yaml
name: ssh
supports:
  - platform-name: debian
```

To target only Ubuntu version 20.04, use:

```yaml
name: ssh
supports:
  - platform-name: ubuntu
    release: 20.04
```

To target the entire release of Ubuntu version 20.x, use:

```yaml
name: ssh
supports:
  - platform-name: ubuntu
    release: 20.*
```

To target the Red Hat and derivative platforms such as CentOS and Oracle Linux, use:

```yaml
name: ssh
supports:
  - platform-family: redhat
```

To target the entire Windows 2019 platform family, including Datacenter and Core Servers, use:

```yaml
name: ssh
supports:
  - platform-name: windows_server_2019*
```

To target anything running on Amazon AWS, use:

```yaml
name: ssh
supports:
  - platform: aws
```

To target all of these examples in a single `inspec.yml` file, use:

```yaml
name: ssh
supports:
  - platform-name: debian
  - platform-name: ubuntu
    release: 20.04
  - platform-family: redhat
  - platform: aws
```
