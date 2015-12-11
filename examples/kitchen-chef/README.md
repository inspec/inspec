# Test-Kitchen - InSpec with Chef Example

This example demonstrates a complete roundtrip via [Test-Kitchen](http://kitchen.ci/).

```bash
# install all dependencies
$ bundle install
# show all available tests
$ bundle exec kitchen list
Instance             Driver   Provisioner  Verifier  Transport  Last Action
default-centos-71    Vagrant  ChefSolo     InSpec    Ssh        <Not Created>
default-ubuntu-1204  Vagrant  ChefSolo     InSpec    Ssh        <Not Created>
default-ubuntu-1404  Vagrant  ChefSolo     InSpec    Ssh        <Not Created>

# Now we are ready to run a complete test
$ bundle exec kitchen test default-ubuntu-1404
-----> Starting Kitchen (v1.4.2)
-----> Verifying <default-ubuntu-1404>...

...

Finished in 0.03241 seconds (files took 0.22475 seconds to load)
5 examples, 0 failures

       Finished verifying <default-ubuntu-1404> (0m0.16s).
-----> Kitchen is finished. (0m0.82s)
```
