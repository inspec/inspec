---
title: InSpec and friends
---

# InSpec and friends

This page looks at projects that are similar to InSpec to explain how they
relate to each other.

## RSpec

RSpec is an awesome framework that is widely used to test Ruby code. It
enables test-driven development (TDD) and helps developers to write
better code every day.

InSpec is built on top of RSpec and uses it as the underlying foundation
to execute tests. It uses the key strengths of RSpec, easily execute
tests and a DSL to write tests, but extends the functionality for use as
compliance audits. InSpec ships with custom audit resources that make it
easy to write audit checks and with the ability to run those checks on
remote servers. These audit resources provided know the differences
between operating systems and help you abstract from the local operating
system, similar to other resources you might use in your Chef recipes.

A complete InSpec rule looks like:

```ruby
control "sshd-11" do
  impact 1.0
  title "Server: Set protocol version to SSHv2"
  desc "Set the SSH protocol version to 2. Don't use legacy
        insecure SSHv1 connections anymore."
  tag security: "level-1"
  tag "openssh-server"
  ref "Server Security Guide v.1.0", url: "http://..."

  describe sshd_config do
    its('Protocol') { should eq('2') }
  end
end
```

## Serverspec

Serverspec is the first extension of RSpec that enabled
users to run RSpec tests on servers to verify deployed artifacts. It was
created in March 2013 by Gosuke Miyashita and has been widely adopted.
It is also one of the core test frameworks within test-kitchen and has
been widely used within the Chef ecosystem. InSpec takes lessons learned
implementing and using Serverspec and builds on them to make auditing
and compliance easier.

Lessons learned from Serverspec include:

* IT, compliance, and security professional require metadata beyond what Serverspec offers, such as criticality, to fully describe controls.
* Setting up and running the same tests across multiple machines must be easy.
* It must be easy to locate, debug, and extend operating system-dependent code.
* It must be easy to extend the language and create custom resources.
* It must run multiple tests simultaneously.
* Support for Windows is a first-class requirement.
* A command line interface (CLI) is required for faster iteration of test code.

You can also watch this [podcast](http://foodfightshow.org/2016/02/inspec.html) to find out more on the relationship of InSpec and Serverspec.

### How is InSpec different from Serverspec

One of the key differences is that InSpec targets more user groups. It
is optimized for DevOps, Security, and Compliance professionals.
Additional metadata, such as impact, title, and description, make it
easier to fully describe the controls which makes it easier to share the
controls with other departments. This enables Security departments to
prioritize rules. DevOps teams use this information to focus on the most
critical issues to remediate.

```ruby
control "sshd-11" do
  impact 1.0
  title "Server: Set protocol version to SSHv2"
  desc "Set the SSH protocol version to 2. Don't use legacy
        insecure SSHv1 connections anymore."
  tag security: "level-1"
  tag "openssh-server"
  ref "Server Security Guide v.1.0" url: "http://..."

  describe sshd_config do
    its('Protocol') { should cmp 2 }
  end
end
```

**Why not fork Serverspec?**

InSpec started as an extension of Serverspec. As the extension grew, it
became clear that a new library was required. Creating and maintaining a
fork was not practical so a new project was born.

**Will InSpec only work on machines managed by Chef?**

No, InSpec can be used on any machine. It doesn’t matter if that machine
was configured by Chef or configured lovingly by the hands of your local
System Administrator.

**Is InSpec a replacement of Serverspec?**

InSpec is intended to be a drop-in replacement of Serverspec. Popular
Serverspec resources have been ported to InSpec. It changed some
behaviour as documented in our migration guide.
