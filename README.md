# Train - Transport Interface

Train lets you talk to your local or remote operating systems with a unified interface.

It allows you to:

* execute commands via `run_command`
* interact with files via `file`
* identify the target operating system via `os`

Train supports:

* Local execution
* SSH
* WinRM
* Docker
* Mock (for testing and debugging)

# Examples

* Using [local execution](examples/loca.rb)
* Using [SSH](examples/ssh.rb)
* Using [WinRM](examples/winrm.rb)

# Kudos and Contribors

Train is heavily based on the work of:

* [test-kitchen](https://github.com/test-kitchen/test-kitchen)  

  by Fletcher Nichol
	and [all contributors](https://github.com/test-kitchen/test-kitchen/graphs/contributors)  

* [ohai](https://github.com/chef/ohai)

  by Adam Jacob, Chef Software Inc.
	and [all contributors](https://github.com/chef/ohai/graphs/contributors)

  
## Contributing

	1. Fork it
	1. Create your feature branch (git checkout -b my-new-feature)
	1. Commit your changes (git commit -am 'Add some feature')
	1. Push to the branch (git push origin my-new-feature)
	1. Create new Pull Request


Copyright 2015 Chef Software Inc. All rights reserved.
Copyright 2015 Vulcano Security GmbH. All rights reserved.
Copyright 2015 Dominik Richter. All rights reserved.

