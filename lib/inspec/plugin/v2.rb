module Inspec
  module Plugin
    module V2
      class Exception < StandardError; end
      class ConfigError < RuntimeError; end
      class LoadError < RuntimeError; end
    end
  end
end

require_relative 'v2/registry'
require_relative 'v2/loader'
