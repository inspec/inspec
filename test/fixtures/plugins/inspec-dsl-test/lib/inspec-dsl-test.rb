lib = File.expand_path("../../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require_relative "inspec-dsl-test/version"
require_relative "inspec-dsl-test/plugin"
