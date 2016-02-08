# InSpec Extension for Chef Supermarket

To use the CLI, this InSpec add-on adds the following commands:

 * `$ inspec supermarket configure` - configures the supermarket server
 * `$ inspec supermarket search` - searches for a compliance profile on supermarket
 * `$ inspec supermarket exec nathenharvey/tmp-compliance-profile` - extends execute to load the profile

 Compliance profiles from Supermarket can be executed in two mays:

 - via supermarket exec: `inspec supermarket exec nathenharvey/tmp-compliance-profile`
 - via supermarket scheme: `inspec exec supermarket://nathenharvey/tmp-compliance-profile`
