## 0.7.0

* complete rewrite of execution backend for ssh and docker
* replace previous command execution layer
* replace previous file transfer mechanism
* rewrite os detection mechanism
* add more resources: apt, bond, bridge, group, host, interface, iptables, kernel_module, kernel_parameter, oneget, package, pip, port, user, script, service, windows_feature
* add unit tests for resources
* add backend tests with docker test infrastructure
* add tests with Chef Delivery
* full rubocop linting
* add vulcano shell feature
* rewrite mysql_conf to use simpleconfig
* improve debug output
* use mixlib-shellout instead of open4
* add basic docs
