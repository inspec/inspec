+++
title = "InSpec Profile Platform Support"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Platforms"
    identifier = "inspec/profiles/platforms"
    parent = "inspec/profiles"
    weight = 90
+++

Use the `supports` setting in the [`inspec.yml` file](/inspec/profiles/inspec_yml/) to specify one (or more) platforms for which a profile is targeting. The list of supported platforms may contain the following:

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
