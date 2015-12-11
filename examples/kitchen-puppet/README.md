# Test-Kitchen - InSpec with Puppet Example

This example demonstrates a complete roundtrip via [Test-Kitchen](http://kitchen.ci/).

```bash
# install all dependencies
$ bundle install
# show all available tests
$ bundle exec kitchen list
Instance             Driver   Provisioner  Verifier  Transport  Last Action
default-centos-71    Vagrant  PuppetApply  Inspec    Ssh        <Not Created>
default-ubuntu-1204  Vagrant  PuppetApply  Inspec    Ssh        <Not Created>
default-ubuntu-1404  Vagrant  PuppetApply  Inspec    Ssh        <Not Created>

# Now we are ready to run a complete test
$ bundle exec kitchen test default-ubuntu-1404
-----> Starting Kitchen (v1.4.2)
-----> Cleaning up any prior instances of <default-ubuntu-1404>
-----> Destroying <default-ubuntu-1404>...
       Finished destroying <default-ubuntu-1404> (0m0.00s).
-----> Testing <default-ubuntu-1404>
-----> Creating <default-ubuntu-1404>...
       Bringing machine 'default' up with 'virtualbox' provider...
       ==> default: Importing base box 'opscode-ubuntu-14.04'...

...

       Vagrant instance <default-ubuntu-1404> created.
       Finished creating <default-ubuntu-1404> (0m33.62s).
-----> Converging <default-ubuntu-1404>...
       Preparing files for transfer

...

       Finished converging <default-ubuntu-1404> (0m48.95s).
-----> Setting up <default-ubuntu-1404>...
       Finished setting up <default-ubuntu-1404> (0m0.00s).
-----> Verifying <default-ubuntu-1404>...
.....

Finished in 0.08278 seconds (files took 1 minute 22.81 seconds to load)
5 examples, 0 failures

       Finished verifying <default-ubuntu-1404> (0m0.22s).
-----> Destroying <default-ubuntu-1404>...
       ==> default: Forcing shutdown of VM...
       ==> default: Destroying VM and associated drives...
       Vagrant instance <default-ubuntu-1404> destroyed.
       Finished destroying <default-ubuntu-1404> (0m3.97s).
       Finished testing <default-ubuntu-1404> (1m26.79s).
-----> Kitchen is finished. (1m27.34s)

```
