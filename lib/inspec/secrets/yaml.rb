# encoding: utf-8

require 'yaml'

module Secrets
  class YAML < Inspec.secrets(1)
    name 'yaml'

    attr_reader :attributes

    def self.resolve(target)
      unless target.is_a?(String) && File.file?(target) && target.end_with?('.yml')
        return nil
      end
      new(target)
    end

    # array of yaml file paths
    def initialize(target)
      @attributes = ::YAML.load_file(target)
    end
  end
end
