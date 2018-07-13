module Inspec
  module Plugin
    class Exception < StandardError; end
    class ConfigError < Exception; end
    class LoadError < Exception; end
  end
end

require_relative 'plugin/registry'
require_relative 'plugin/loader'
