require 'yaml'

module Secrets
  class YAML < Inspec.secrets(1)
    name 'yaml'

    attr_reader :inputs

    def self.resolve(target)
      unless target.is_a?(String) && File.file?(target) && ['.yml', '.yaml'].include?(File.extname(target).downcase)
        return nil
      end
      new(target)
    end

    # array of yaml file paths
    def initialize(target)
      @inputs = ::YAML.load_file(target)

      if @inputs == false || !@inputs.is_a?(Hash)
        Inspec::Log.warn("#{self.class} unable to parse #{target}: invalid YAML or contents is not a Hash")
        @inputs = nil
      end
    rescue => e
      raise "Error reading InSpec inputs: #{e}"
    end
  end
end
