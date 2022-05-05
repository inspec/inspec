+++
title = "Signed InSpec Profiles"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Signed InSpec Profiles"
    identifier = "inspec/reference/signing.md Signed InSpec Profiles"
    parent = "inspec/reference"
    weight = 60
+++

This documents the `inspec sign` command introduced in InSpec 5 and details some of the ways to work with signed profiles.

# Basic Usage

## What is a Signed Profile?

A signed profile, or `.iaf` file, is an InSpec profile along with a digital signature that attests to its authenticity. Starting in 2022, many Progress Chef authored profiles are available as signed profiles.

## How does Profile Signing Work?

Profile signing uses a matched pair of keys. The _signing key_ is secret, and is used to sign the profile. The _validation key_ is widely distributed, and is used to verify the signature in the signed profile.

Keypairs are searched for in the current directory, then in the user's `~/.inspec/keys` directory. Progress Chef validation keys are also distributed in the `etc/keys` directory of the InSpec installation tree. Finally, if a validation key cannot be found, the profile verification system will attempt to download keys from [the InSpec Github repo](https://github.com/inspec/inspec/tree/main/etc/keys).

## How do I execute a signed profile?

You can execute a signed profile just like any other profile.

```bash
[cwolfe@lodi temp]$ inspec exec simple.iaf

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

A signed profile is checked for validity before being executed, and if it cannot be verified, then InSpec exits with code 5 (bad signature).

## How do I know which key was used to sign a profile?

The inspec sign verify command will tell you.

```bash
[cwolfe@lodi temp]$ inspec sign verify --signed-profile simple-0.1.0-v2.iaf
Verifying simple-0.1.0-v2.iaf
Detected format version 'INSPEC-PROFILE-2'
Attempting to verify using key 'cwolfe-03'
Profile is valid.
```

## How do I look inside a signed profile?

Use the `inspec export` command to examine a signed profile's contents. You must be able to verify the profile in order to export the contents.

To view the controls in a signed profile, run:
```bash
[cwolfe@lodi temp]$ inspec export simple-0.1.0.iaf
---
  # TODO - YAML representation by default
```

To read a profile's README, run:

```bash
[cwolfe@lodi temp]$ inspec export --what readme simple-0.1.0.iaf
# Example InSpec Profile

This example shows the implementation of an InSpec profile.

```

To view a signed profile's metadata file (inspec.yml), run:

```bash
[cwolfe@lodi temp]$ inspec export --what metadata simple-0.1.0.iaf
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

# Advanced Usage

## How do I make my own keys?

Most users of signed profiles will not need to make their own keys, unless they wish to create their own signed profiles. To generate keys of your own, use the `inspec sign generate-keys` command:

```bash
[cwolfe@lodi temp]$ inspec sign generate-keys --keyname test-03
Generating keys
Generating signing key in /Users/cwolfe/.inspec/keys/test-03.pem.key
Generating validation key in /Users/cwolfe/.inspec/keys/test-03.pem.pub
[cwolfe@lodi temp]$
```

Keep your signing key secret. You'll need to devise a way of distributing the validation key to users of your profile.

## How do I sign profiles?

If you wish to sign profiles yourself, you will need a signing key. Specify the name of the key and the name of the profile.

```bash
[cwolfe@lodi temp]$ inspec sign profile --keyname test-03 --profile simple
Signing simple with key cwolfe-03
Dependencies for profile simple successfully vendored to /Users/cwolfe/sandbox/inspec/inspec-5/temp/simple/vendor
Successfully generated simple-0.1.0.iaf
[cwolfe@lodi temp]$
```

