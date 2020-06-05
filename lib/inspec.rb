# copyright: 2015, Dominik Richter

libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require_relative "inspec/version"
require_relative "inspec/exceptions"
require_relative "inspec/utils/deprecation"
require_relative "inspec/profile"
require_relative "inspec/rule"
require_relative "matchers/matchers"
require_relative "inspec/runner"
require_relative "inspec/shell"
require_relative "inspec/formatters"
require_relative "inspec/reporters"
require_relative "inspec/input_registry"
require_relative "inspec/rspec_extensions"
require_relative "inspec/globals"
require_relative "inspec/impact"
require_relative "inspec/utils/telemetry"
require_relative "inspec/utils/telemetry/global_methods"

require_relative "inspec/plugin/v2"
require_relative "inspec/plugin/v1"

# all utils that may be required by legacy plugins
require_relative "inspec/base_cli"
require_relative "inspec/fetcher"
require_relative "inspec/source_reader"
require_relative "inspec/resource"
