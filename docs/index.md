# VulcanoSec Specs

VulcanoSec specs is a collection of resources and matchers to test the compliance of your nodes. This documentation provides an introduction to this mechanism and shows how to write custom tests.

### Introduction

All compliance profiles a grouped by `owner/profile`. Let's create an example file profile called `vulcanosec/example`.

    mkdir vulcanosec-example
    cd vulcanosec-example
    touch vmetadata.rb

Information on this profile is stored in `vmetadata.rb`. In our example, it contains:

```ruby
# encoding: utf-8

name "vulcanosec/example"
version "1.0.0"
title "Example Spec profile"
maintainer "Example User"
copyright "Example User"
copyright_email "hello@example.com"
license "Proprietary, All rights reserved"
summary "Verify a small example profile"
description "Full description..."
```

Finally we add our tests to the `spec` folder. Each test file must end with `_spec.rb`:

    mkdir spec
    touch spec/example_spec.rb

We add a rule to this file, to check the `/tmp` path in our system:

```ruby
# encoding: utf-8

rule "cis-fs-2.1" do                        # A unique ID for this rule
  impact 0.7                                # The criticality, if this rule fails.
  title "Create separate /tmp partition"    # A human-readable title
  desc "An optional description..."
  describe file('/tmp') do                  # The actual test
    it { should be_mounted }
  end
end
```

This is just a small test to get started, so let's register this profile with the server. We will use API calls to do so:

    server="http://myserver:2134/api"
    token=$(http post $server/oauth/token -a username:password | jq '.access_token' | tr -d '"')

    # run this command from the folder, where vmetadata.rb is located
    tar -cz . | http -a $token: $server/owners/vulcanosec/compliance/example/tar

You will see a confirming:

    HTTP/1.1 200 OK
    ...

You can take a look at the profile in the web UI.

Let's add another spec for checking the SSH server configuration:

    touch spec/sshd_spec.rb

It will contain:

```ruby
# encoding: utf-8

# Skip all rules, if SSH doesn't exist on the system
only_if do
  command('sshd').exists?
end

# load the configuration file
sshd_conf = SshConf.new('/etc/ssh/sshd_config')

rule "sshd-11" do
  impact 1.0
  title "Server: Set protocol version to SSHv2"
  desc "
    Set the SSH protocol version to 2. Don't use legacy
    insecure SSHv1 connections anymore.
  "
  describe sshd_conf do
    its('Protocol') { should eq('2') }
  end
end

rule "sshd-7" do
  impact 1.0
  title "Server: Do not permit root-based login with password."
  desc "
    To reduce the potential to gain full privileges
    of a system in the course of an attack (by either misconfiguration
    or vulnerabilities), do not allow login as root with password
  "
  describe sshd_conf do
    its('PermitRootLogin') { should match(/no|without-password/) }
  end
end
```

We can upload this file again:

    tar -cz . | http -a $token: post $server/owners/vulcanosec/compliance/example/tar


### Upload a profile

Change into the profile's directory:

    cd my_profile

It should contain the `vmetadata.rb` and all tests in the `spec` folder.

Add this profile to the server. In our example, we add the profile `vulcanosec/example`.

    tar -cz . | http -a $token: post $server/owners/vulcanosec/compliance/example/tar

### Download a profile

To download a profile, follow this simple call to retrieve all data in a `tar.gz` file. To get the `vulcanosec/example` profile, call:

    http -a $token: get $server/owners/vulcanosec/compliance/example/tar > example.tar.gz

Or to directly extract it:

    http -a $token: get $server/owners/vulcanosec/compliance/example/tar | tar xzf -
    cd vulcanosec/example