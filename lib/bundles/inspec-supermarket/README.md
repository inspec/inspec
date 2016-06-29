# InSpec Extension for Chef Supermarket

To use the CLI, this InSpec add-on adds the following commands:

 * `$ inspec supermarket configure` - configures the supermarket server
 * `$ inspec supermarket search` - searches for a compliance profile on supermarket
 * `$ inspec supermarket exec nathenharvey/tmp-compliance-profile` - extends execute to load the profile

 Compliance profiles from Supermarket can be executed in two mays:

 - via supermarket exec: `inspec supermarket exec nathenharvey/tmp-compliance-profile`
 - via supermarket scheme: `inspec exec supermarket://nathenharvey/tmp-compliance-profile`

## Usage

```
$ inspec supermarket
Commands:
  inspec supermarket exec PROFILE    # execute a Supermarket profile
  inspec supermarket help [COMMAND]  # Describe subcommands or one specific subcommand
  inspec supermarket info PROFILE    # display Supermarket profile details
  inspec supermarket profiles        # list all available profiles in Chef Supermarket

$ inspec supermarket profiles
Available profiles:
-------------------
 * nathenharvey/tmp-compliance-profile
 * hardening/os-hardening
 * hardening/ssh-hardening

$ inspec supermarket info hardening/os-hardening
name:   os-hardening
owner:  hardening
url:    https://github.com/dev-sec/tests-os-hardening

description:   Base Linux Compliance profile, used for Security + DevOps. More Information is available at http://dev-sec.io/

$ inspec exec supermarket://hardening/os-hardening
........F.F.................F......FFF.....FFFF.F........FF....FFFFFFF...FF.FFFFFF.FFFFFFFFFFF.F...

...

Finished in 3.81 seconds (files took 5.69 seconds to load)
99 examples, 40 failures
```
