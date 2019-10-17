# copyright: 2015, Dominik Richter

libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require "inspec/version"
require "inspec/exceptions"
require "inspec/utils/deprecation"
require "inspec/profile"
require "inspec/rule"
require "matchers/matchers"
require "inspec/runner"
require "inspec/shell"
require "inspec/formatters"
require "inspec/reporters"
require "inspec/input_registry"
require "inspec/rspec_extensions"
require "inspec/globals"
require "inspec/impact"
require "inspec/utils/telemetry"
require "inspec/utils/telemetry/global_methods"

require "inspec/plugin/v2"
require "inspec/plugin/v1"

# all utils that may be required by legacy plugins
require "inspec/base_cli"
require "inspec/fetcher"
require "inspec/source_reader"
require "inspec/resource"
