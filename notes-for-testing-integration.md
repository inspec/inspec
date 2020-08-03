# Known current state of affairs(note still on checkout)

## Best way forward

It appears working on generic kitchen tests would be preferable. Debug one at a time and get them all up.
Then approach AWS & Azure because the current docs seems very 'localized' whereas the others look like they'd work with a simple `bundle exec kitchen test` etc. (Though it might be nice to break all those out from a CI perspective)

## AWS Integration tests:

(see TESTING_AGAINST_AWS.md)

- Note that some tests will fail for the first day or two after you set up the accounts, due to the tests checking properties such as the last usage time of an access key, for example.
- Additionally, the first time you run the tests, you will need to accept the user agreement in the AWS marketplace for the linux AMIs we use.  You'll need to do it 4 times, once for each of debian and centos on the two accounts.
- I'm not sure how easy these steps are to follow in chef or if I need to spin up my own aws situation to test it manually (i.e. if we have restrictions agains `create-account`, etc.)


## Azure integration tests:


## Generic tests

It seems aws and azure have their own unique flow. But then we have these kitchen tests:

`bundle exec kitchen test` (see below)

Run all with:
`bundle exec kitchen test -c` (parallel)

Run one with:
`bundle exec kitchen test resources-core-ubuntu-1604`

```
Instance                          Driver  Provisioner  Verifier  Transport  Last Action    Last Error
resources-core-amazonlinux        Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-core-amazonlinux-2      Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-core-centos-6           Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-core-centos-7           Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-core-debian-8           Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-core-debian-9           Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-core-debian-10          Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-core-fedora-29          Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-core-oraclelinux-6      Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-core-oraclelinux-7      Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-core-opensuse-leap      Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-core-ubuntu-1604        Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-core-ubuntu-1804        Dokken  Dokken       Inspec    Dokken     Set Up         RuntimeError
resources-database-amazonlinux    Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-database-amazonlinux-2  Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-database-centos-6       Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-database-centos-7       Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-database-debian-8       Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-database-debian-9       Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-database-debian-10      Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-database-fedora-29      Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-database-oraclelinux-6  Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-database-oraclelinux-7  Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-database-opensuse-leap  Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-database-ubuntu-1604    Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-database-ubuntu-1804    Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-unix-amazonlinux        Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-unix-amazonlinux-2      Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-unix-centos-6           Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-unix-centos-7           Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-unix-debian-8           Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-unix-debian-9           Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-unix-debian-10          Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-unix-fedora-29          Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-unix-oraclelinux-6      Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-unix-oraclelinux-7      Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-unix-opensuse-leap      Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-unix-ubuntu-1604        Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-unix-ubuntu-1804        Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-windows-amazonlinux     Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-windows-amazonlinux-2   Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-windows-centos-6        Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-windows-centos-7        Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-windows-debian-8        Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-windows-debian-9        Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-windows-debian-10       Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-windows-fedora-29       Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-windows-oraclelinux-6   Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-windows-oraclelinux-7   Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-windows-opensuse-leap   Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-windows-ubuntu-1604     Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
resources-windows-ubuntu-1804     Dokken  Dokken       Inspec    Dokken     <Not Created>  <None>
```
