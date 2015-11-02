=====================================================
InSpec Documentation
=====================================================

InSpec a collection of resources and matchers to test the compliance of your nodes. This documentation provides an introduction to this mechanism and shows how to write custom tests.

Introduction
-----------------------------------------------------

At first, we add our tests to the ``test`` folder. Each test file must end with ``_spec.rb``:

.. code-block:: bash

    mkdir test
    touch test/example_spec.rb

We add a control to this file, to check the ``/tmp`` path in our system:

.. code-block:: ruby

  # encoding: utf-8

  control "cis-fs-2.1" do                     # A unique ID for this control
    impact 0.7                                # The criticality, if this control fails.
    title "Create separate /tmp partition"    # A human-readable title
    desc "An optional description..."
    describe file('/tmp') do                  # The actual test
      it { should be_mounted }
    end
  end


Let's add another spec for checking the SSH server configuration:

.. code-block:: bash

    touch test/sshd_spec.rb

It will contain:

.. code-block:: ruby

  # encoding: utf-8

  # Skip all controls, if SSH doesn't exist on the system
  only_if do
    command('sshd').exist?
  end

  control "sshd-11" do
    impact 1.0
    title "Server: Set protocol version to SSHv2"
    desc "
      Set the SSH protocol version to 2. Don't use legacy
      insecure SSHv1 connections anymore.
    "
    describe sshd_config do
      its('Protocol') { should eq('2') }
    end
  end

  control "sshd-7" do
    impact 1.0
    title "Server: Do not permit root-based login with password."
    desc "
      To reduce the potential to gain full privileges
      of a system in the course of an attack (by either misconfiguration
      or vulnerabilities), do not allow login as root with password
    "
    describe sshd_config do
      its('PermitRootLogin') { should match(/no|without-password/) }
    end
  end


Now, we are ready to run the tests locally:

bundle exec bin/inspec exec demo/test/example_spec.rb

.. code-block:: bash

  # run tests individually
  $ inspec exec test/example_spec.rb
  $ inspec exec test/sshd_spec.rb

  # if you want to run all test located within the directory
  $ inspec exec ./test


Stability Index
-----------------------------------------------------

Every available InSpec resource will indicate its stability. As InSpec matures, certain parts are more reliable than others. Brand new features are likely to be redesigned and marked as such.

The stability indices are as follows:

* ``Stability: Deprecated`` - This features will be removed in future versions, because its known for being problematic. Do not rely on it.
* ``Stability: Experimental`` - New features may change or are removed in future versions
* ``Stability: Stable`` - API is well established and proofed. Maintaining compatibility is a high priority
* ``Stability: Locked`` - Only security and performance fixes are allowed
