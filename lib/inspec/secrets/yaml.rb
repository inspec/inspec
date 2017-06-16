# encoding: utf-8

require 'yaml'

module Secrets
  class YAML < Inspec.secrets(1)
    name 'yaml'

    attr_reader :attributes

    def self.resolve(target)
      unless target.is_a?(String) && File.file?(target) && ['.yml', '.yaml'].include?(File.extname(target).downcase)
        return nil
      end
      new(target)
    end

    # array of yaml file paths
    def initialize(target)
      @attributes = ::YAML.load_file(target)

      if @attributes == false || !@attributes.is_a?(Hash)
        Inspec::Log.warn("#{self.class} unable to parse #{target}: invalid YAML or contents is not a Hash")
        @attributes = nil
      end
    rescue => e
      raise "Error reading Inspec attributes: #{e}"
    end
  end
end
