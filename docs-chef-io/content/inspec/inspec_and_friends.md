+++
title = "Chef InSpec and Friends"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Chef InSpec and Friends"
    identifier = "inspec/inspec_and_friends.md Chef InSpec and friends"
    parent = "inspec"
    weight = 40
+++

This page looks at projects that are similar to Chef InSpec to explain how they
relate to each other.

## RSpec

RSpec is an awesome framework that is widely used by software engineers to test
Ruby code. It enables test-driven development (TDD) and helps developers to write
better code every day.

Chef InSpec is built on top of RSpec and uses it as the underlying foundation
to execute tests. It uses the key strengths of RSpec, easily execute
tests and a DSL to write tests, but extends the functionality for use as
compliance audits. Chef InSpec ships with custom audit resources that make it
easy to write audit checks and with the ability to run those checks on
remote servers. These audit resources provided know the differences
between operating systems and help you abstract from the local operating
system, similar to other resources you might use in your Chef recipes.

A complete Chef InSpec rule looks like:

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

That said, Chef InSpec is not RSpec. Some key differences:

- In InSpec, `describe` blocks should not be nested; instead use `control` blocks
  to describe a higher-level grouping of tests.
- The RSpec `shared_example` construct is not supported.  Instead, create a simple
  custom resource that executes repetitious tasks.
- Chef InSpec is aimed at compliance practitioners and infrastructure testers, so
  our focus is providing a few, well-supported, easy-to-use [universal matchers](/inspec/matchers/),
  such as `cmp`. In contrast, RSpec is a tool designed for software engineers.
  It thus supports a very large range of matchers, to enable testing of software
  engineering constructs such as exceptions, Object Oriented Programming relationships,
  and so on.
- While Chef InSpec uses parts of the RSpec project and codebase, it is a
  separate project from InSpec. Rspec's release schedule and feature set are beyond
  the control of the Chef InSpec team. While it is possible to use many of the
  RSpec core features within Chef InSpec profiles, Chef InSpec can only guarantee
  that the features described in the [InSpec documentation](/inspec/) will
  function correctly. Some RSpec core functionality may be removed in future
  versions of Chef InSpec as needed to ensure stability in the Chef InSpec project.
