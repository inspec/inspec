InSpec Omnibus project
======================
This project creates full-stack platform-specific packages for
`inspec`!

Installation
------------
You must have a sane Ruby 2.0.0+ environment with Bundler installed. Ensure all
the required gems are installed:

```shell
$ bundle install --binstubs
```

## Usage

### Build

You create a platform-specific package using the `build project` command:

```shell
$ bundle exec omnibus build inspec
```

The platform/architecture type of the package created will match the platform
where the `build project` command is invoked. For example, running this command
on a MacBook Pro will generate a Mac OS X package. After the build completes
packages will be available in the `pkg/` folder.

### Clean

You can clean up all temporary files generated during the build process with
the `clean` command:

```shell
$ bundle exec omnibus clean inspec

Adding the `--purge` purge option removes __ALL__ files generated during the
build including the project install directory (`/opt/inspec`) and
the package cache directory (`/var/cache/omnibus/pkg`):

```shell
$ bundle exec omnibus clean inspec --purge
```

### Publish

Omnibus has a built-in mechanism for releasing to a variety of "backends", such as Amazon S3 and Artifactory. You must set the proper credentials in your `omnibus.rb` config file or specify them via the command line.

```shell
$ bundle exec omnibus publish path/to/*.deb --backend s3
```

### Help

Full help for the Omnibus command line interface can be accessed with the `help` command:

```shell
$ bundle exec omnibus help
```

Version Manifest
----------------

Git-based software definitions may specify branches as their
default_version. In this case, the exact git revision to use will be
determined at build-time unless a project override (see below) or
external version manifest is used.  To generate a version manifest use
the `omnibus manifest` command:

```
omnibus manifest PROJECT -l warn
```

This will output a JSON-formatted manifest containing the resolved
version of every software definition.


Kitchen-based Build Environment
-------------------------------
Every Omnibus project ships will a project-specific
[Berksfile](http://berkshelf.com/) that will allow you to build your omnibus projects on all of the projects listed
in the `.kitchen.yml`. You can add/remove additional platforms as needed by
changing the list found in the `.kitchen.yml` `platforms` YAML stanza.

This build environment is designed to get you up-and-running quickly. However,
there is nothing that restricts you to building on other platforms. Simply use
the [omnibus cookbook](https://github.com/opscode-cookbooks/omnibus) to setup
your desired platform and execute the build steps listed above.

The default build environment requires Test Kitchen and VirtualBox for local
development. Test Kitchen also exposes the ability to provision instances using
various cloud providers like AWS, DigitalOcean, or OpenStack. For more
information, please see the [Test Kitchen documentation](http://kitchen.ci).

Once you have tweaked your `.kitchen.yml` (or `.kitchen.local.yml`) to your
liking, you can bring up an individual build environment using the `kitchen`
command.

```shell
$ bin/kitchen converge ubuntu-1204
```

Then login to the instance and build the project as described in the Usage
section:

```shell
$ bundle exec kitchen login ubuntu-1204
# Now inside the kitchen vm
$ sudo -i
$ export PATH=/opt/omnibus-toolchain/bin:/opt/omnibus-toolchain/embedded/bin:$PATH
$ cd /home/vagrant/inspec/omnibus
$ bundle install
$ bundle exec omnibus build inspec
```

If you are building for Windows, follow these steps:

```
$ bundle exec kitchen converge i386```
# Now inside the kitchen vm, open a cmd/ps shell
$ C:\vagrant\load-omnibus-toolchain.ps1 # (or .bar if you're on cmd)
$ cd C:\vagrant\code\inspec\omnibus
$ bundle config set --local without development
$ bundle install
$ bundle exec omnibus build inspec -l debug

# If you get a 'can't sign this msi because I don't have a key to do so' error
# at the end of it, you have succeeded.  Look for you unsigned MSI in C:\omnibus-ruby\pkg
```
