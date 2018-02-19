---
title: About InSpec Profile Attributes and Files
---
# Profile Attributes

Attributes may be used in profiles to define secrets, such as user names and passwords, that should not otherwise be stored in plain-text in a cookbook. First specify a variable in the control for each secret, then add the secret to a Yaml file located on the local machine, and then run `inspec exec` and specify the path to that Yaml file using the `--attrs` attribute.

For example, a control:

    # define these attributes on the top-level of your file and re-use them across all tests!
    val_user = attribute('user', default: 'alice', description: 'An identification for the user')
    val_password = attribute('password', description: 'A value for the password')

    control 'system-users' do
      impact 0.8
      desc '
        This test assures that the user "Bob" has a user installed on the system, along with a
        specified password.
      '

      describe val_user do
        it { should eq 'bob' }
      end

      describe val_password do
        it { should eq 'secret' }
      end
    end

And a Yaml file named `profile-attribute.yml`:

    user: bob
    password: secret

The following command runs the tests and applies the secrets specified in `profile-attribute.yml`:

    $ inspec exec examples/profile-attribute --attrs examples/profile-attribute.yml

See the full example in the InSpec open source repository: https://github.com/chef/inspec/tree/master/examples/profile-attribute

# Profile files

An InSpec profile may contain additional files that can be accessed during tests. This covers use-cases where e.g. a list of ports is provided to be tested.

To access these files, they must be stored in the `files` directory at the root of a profile. They are accessed by their name relative to this folder with `inspec.profile.file(...)`.

Here is an example for reading and testing a list of ports. The folder structure is:

    examples/profile
    ├── controls
    │   ├── example.rb
    |── files
    │   └── services.yml
    └── inspec.yml

With `services.yml` containing:

    - service_name: httpd-alpha
      port: 80
    - service_name: httpd-beta
      port: 8080

The tests in `example.rb` can now access this file:

    my_services = yaml(content: inspec.profile.file('services.yml')).params

    my_services.each do |s|
      describe service(s['service_name']) do
        it { should be_running }
      end

      describe port(s['port']) do
        it { should be_listening }
      end
    end

# "should" vs. "expect" syntax

Users familiar with the RSpec testing framework may know that there are two ways to write test statements: `should` and `expect`. The RSpec community decided that `expect` is the preferred syntax. However, InSpec recommends the `should` syntax as it tends to read more easily to those users who are not as technical.

InSpec will continue to support both methods of writing tests. Consider this `file` test:

    describe file('/tmp/test.txt') do
      it { should be_file }
    end

This can be re-written with `expect` syntax

    describe file('/tmp/test.txt') do
      it 'should be a file' do
        expect(subject).to(be_file)
      end
    end

The output of both of the above examples looks like this:

    File /tmp/test.txt
       ✔  should be a file

In addition, you can make use of the `subject` keyword to further control your output if you choose:

    describe 'test file' do
      subject { file('/tmp/test.txt') }
      it 'should be a file' do
        expect(subject).to(be_file)
      end
    end

... which will render the following output:

    test file
      ✔  should be a file