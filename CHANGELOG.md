# Changelog

## 0.9.2

* #219 bugfix: fix add_content to make `inspec shell` work again
* #218 add version to resource declaration
* #217 specify gemspec files directly (without git)
* #216 update gemfile grouped dependencies
* #214 fix legacy `should contain` in docs
* #213 fix typos in readme
* #212 add test-kitchen example to readme
* #208 improved readme

## 0.8.0

* #105 add to_s methods to resources, fixes #98
* #106 Improve unit tests
* #110 make default rake tasks test+lint
* #111 Train
* #112 take care of ruby warnings
* #115 Fixes
* #116 test: group resource tests
* #117 Add support for `expect`
* #119 delivery: select build node on new fqdn
* #118 add first round of audit resource docs
* #122 move markdown docs to rst
* #114 simplify yum implementation
* #123 add resources, sync matcher patterns
* #124 fix the header structure
* #126 add test-kitchen example
* #127 add more usage headers
* #128 more CentOS support

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
