=====================================================
InSpec Profiles
=====================================================

InSpec is a test and audit framework and enables you to quickly write rules. Just creating a simple `test.rb` is enough to run the test on a local or remove machine.

.. code-block:: ruby

  describe port(80) do
    it { should_not be_listening }
  end

To run the test locally, just execute:

.. code-block:: bash

  $ inspec exec test.rb

While this approach is very handy for quick tests, it has its limitation for a collection of tests. Once the amount of tests grows, we need mechanisms to organize our code and re-use existing rules.

**Include rules of existing profile**

The `include_controls` keyword allows you to import all rules from an existing profile. This can be easily extended with additional rules.

.. code-block:: bash

  include_controls 'cis-level-1' do

    control "cis-fs-2.7" do
      impact 1.0
    ...

  end

**Inherit from a profile, but skip some rules**

Sometimes, not all requirements can be fullfiled for a legacy application. To manage the derivation, you can skip certain controls with `skip_control`.

.. code-block:: bash

  include_controls 'cis-level-1' do

    skip_control "cis-fs-2.1"
    skip_control "cis-fs-2.2"

  end

**Load specific controls from another profile**

.. code-block:: bash

  require_controls 'cis-level-1' do
    control "cis-fs-2.1"
    control "cis-fs-2.2"
  end


InSpec Profile Structure
-----------------------------------------------------

To use a profile and their mechanisms, just place the files according to the following structure:

.. code-block:: bash

  $ tree examples/profile
  examples/profile
  ├── README.md
  ├── controls
  │   ├── example_spec.rb
  │   └── gordon_spec.rb
  ├── libraries
  │   └── gordon_config.rb
  └── inspec.yml


 * `inspec.yml` - includes the profile description (required)
 * `controls` - the directory includes all tests (required)
 * `libraries` - is an optional feature to load custom InSpec resource extensions (optional)
 * `README.md` - its best-practice to add a readme to each profile to explain its scope


InSpec Profile Manifest
-----------------------------------------------------

Each profile has a manifest file `inspec.yml`. It looks as follows

.. code-block:: yaml

  name: base/ssh
  title: Basic SSH
  maintainer: Chef Software, Inc.
  copyright: Chef Software, Inc.
  copyright_email: support@chef.io
  license: Proprietary, All rights reserved
  summary: Verify that SSH Server and SSH Client are configured securely
  version: 1.0.0
  supports:
    - linux


A manifest description may contain the following values:

 * `name` - Identifier of the profile (required)
 * `title` - Human-readable name of the profile (optional)
 * `maintainer` - Name of the profile maintainer (optional)
 * `copyright` - Copyright holder (optional)
 * `copyright_email` - Support contact for profile (optional)
 * `license` - License of the profile (optional)
 * `summary` - One-line summary of the profile (optional)
 * `description` - Description of the profile (optional)
 * `version` - Version of the profile (optional)


InSpec Profile Verification
-----------------------------------------------------

InSpec ships with a verification command that verifies the implementation of a profile

$ inspec check examples/profile


InSpec Profile Archive
-----------------------------------------------------

Profiles are composed of multiple files. This hinders easy distribution of a profile. InSpec solves the problem by offering to collect all files in one archive.

The InSpec profile archive format aims for flexibility and reuse of standard and common technologies:

 * tar and gzip (default)
 * zip
 * HTTP

This should enable third-parties to easily build InSpec profile archives:

 * InSpec archives MUST be named with the stanard suffix
 * InSpec archives MUST be a tar.gz or zip formatted file
 * InSpec archives MUST have no duplicate entries
 * All files in the archive MUST maintain all of their original properties (like timestamps, Unix modes, and extended attributes (xattrs))
 * InSpec archives MAY be compressed with gzip, bzip2, or xz.

InSpec allows you to generating a profile archive for you. By default it generates a tarbal on Unix and zip on Windows and Mac.

.. code-block:: bash

  # will generate a example-profile.tar.gz
  $ inspec archive examples/profile

  # will generate a example-profile.zip
  $ inspec archive examples/profile -zip
