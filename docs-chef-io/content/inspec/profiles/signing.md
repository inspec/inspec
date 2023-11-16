+++
title = "Signed InSpec Profiles"
draft = false
gh_repo = "inspec"

aliases = ['/inspec/signing/']

[menu]
  [menu.inspec]
    title = "Signed Profiles"
    identifier = "inspec/profiles/Signed profiles"
    parent = "inspec/profiles"
    weight = 100
+++

This page documents how to make and use signed InSpec profiles.

A signed profile, or `.iaf` file, is an InSpec profile with a digital signature that attests to its authenticity.
Progress Chef-authored profiles are available as signed profiles starting in 2022.

IAF files are not human-readable, but you can view them using `inspec export`. Support for IAF v2.0 was added to InSpec 5.

## How does profile signing work?

Profile signing uses a matched pair of keys. The _signing key_ is secret and is used to sign the profile. The _validation key_ is widely distributed and verifies the signed profile signature.

Keypairs are first searched for in the current directory and then in the user's `~/.inspec/keys` directory.
Progress Chef validation keys are also distributed in the `etc/keys` directory of the InSpec installation tree.
Finally, if a validation key is not found, the profile verification system attempts to download keys from the [InSpec Github](https://github.com/inspec/inspec/tree/main/etc/keys) repository.

## Execute a signed profile

You can execute a signed profile like any other profile.

```bash
$ inspec exec simple.iaf

Profile:   InSpec Profile (simple)
Version:   0.1.0
Target:    local://
Target ID: 46f308fc-7ad8-4230-8dd0-f2582227e164

  ✔  tmp-1.0: Create /tmp directory
     ✔  File /tmp is expected to be directory

  File /tmp
     ✔  is expected to be directory

Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
Test Summary: 2 successful, 0 failures, 0 skipped
```

A signed profile is checked for validity before it's executed. If the profile cannot be verified, then InSpec exits with `code 5` (bad signature).

## Identify key used to sign profile

The `inspec sign verify` command displays which key is used to sign a profile.

```bash
$ inspec sign verify simple-0.1.0-v2.iaf
Verifying simple-0.1.0-v2.iaf
Detected format version 'INSPEC-PROFILE-2'
Attempting to verify using key 'cwolfe-03'
Profile is valid.
```

## See contents of signed profile

Use the `inspec export` command to examine a signed profile's contents. You must be able to verify the profile in order to export the contents. By default, the `export` command dumps a profile summary in a human-readable YAML format, including most of the metadata and the control IDs, control source code, inputs, and other profile information.

- To view a **signed profile**, run:

  ```bash
  $ inspec export simple-0.1.0.iaf
  ---
  :name: simple
  :title: InSpec Profile
  :maintainer: The Authors
  :copyright: The Authors
  :copyright_email: you@example.com
  :license: Apache-2.0
  :summary: An InSpec Compliance Profile
  :version: 0.1.0
  :supports:
  - :platform: os
  :controls:
  - :title:
    :desc:
    :descriptions: {}
    :impact: 0.5
    :refs: []
    :tags: {}
    :code: ''
    :source_location:
      :ref: "/Users/cwolfe/sandbox/inspec/inspec-5/lib/inspec/control_eval_context.rb"
      :line: 92
    :id: "(generated from example.rb:6 7007cd4757c4892cc89977e9847c1051)"
  - :title: Create /tmp directory
    :desc: An optional description...
    :descriptions:
      :default: An optional description...
    :impact: 0.7
    :refs: []
    :tags: {}
    :code: |
      control "tmp-1.0" do                        # A unique ID for this control
        impact 0.7                                # The criticality, if this control fails.
        title "Create /tmp directory"             # A human-readable title
        desc "An optional description..."
        describe file("/tmp") do                  # The actual test
          it { should be_directory }
        end
      end
    :source_location:
      :ref: controls/example.rb
      :line: 11
    :id: tmp-1.0
  :groups:
  - :title: sample section
    :controls:
    - "(generated from example.rb:6 7007cd4757c4892cc89977e9847c1051)"
    - tmp-1.0
    :id: controls/example.rb
  :inputs: []
  :sha256: c1a5298d56f028386edf4c52573264ca38d476ce6156a053a2c412991fb0b646
  :status_message: ''
  :status: loaded
  :generator:
    :name: inspec
    :version: 5.14.5
  ```

- To view a profile's **README**, run:

  ```bash
  $ inspec export --what readme simple-0.1.0.iaf
  # Example InSpec Profile

  This example shows the implementation of an InSpec profile.

  ```

- To view a **signed profile's metadata file (inspec.yml)**, run:

  ```bash
  $ inspec export --what metadata simple-0.1.0.iaf
  name: simple
  title: InSpec Profile
  maintainer: The Authors
  copyright: The Authors
  copyright_email: you@example.com
  license: Apache-2.0
  summary: An InSpec Compliance Profile
  version: 0.1.0
  supports:
    platform: os
  ```

## Mandatory profile signing

**Chef InSpec 6** and above has an optional setting that requires that all profiles are signed.
If mandatory profile signing is enabled, InSpec will not execute functions with an un-signed profile and exits with exit code 6.

To enable mandatory profile signing, set the environment variable `CHEF_PREVIEW_MANDATORY_PROFILE_SIGNING` to any non-empty value.

If you need to bypass mandatory profile signing, use the `--allow-unsigned-profiles` CLI option or set the `CHEF_ALLOW_UNSIGNED_PROFILES` environment variable.

## Advanced Usage

### Create a signing and validation keys

Most users of signed profiles need not create keys of their own unless they wish to sign and distribute profiles themselves.
To generate keys of your own, use the `inspec sign generate-keys` command:

```bash
$ inspec sign generate-keys --keyname test-03
Generating keys
Generating signing key in /Users/cwolfe/.inspec/keys/test-03.pem.key
Generating validation key in /Users/cwolfe/.inspec/keys/test-03.pem.pub
```

Keep your signing key secret. You must devise a way of distributing the validation key to your profile users; they will be unable to use your signed IAF files unless they have the validation key.

### Sign profile

You will need a signing key to sign profiles. Specify the path of profile and the name of the key.

```bash
$ inspec sign profile simple --keyname test-03
Signing simple with key cwolfe-03
Dependencies for profile simple successfully vendored to /Users/cwolfe/sandbox/inspec/inspec-5/temp/simple/vendor
Successfully generated simple-0.1.0.iaf
```
