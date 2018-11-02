require 'json'

module Inspec::Plugin::V2
  # Represents the config file on disk.
  class ConfigFile

    attr_reader :path
    def initialize(path = nil)
      @path = path || self.class.default_path
    end

    def self.default_path
      File.join(Inspec.config_dir, 'plugins.json')
    end
  end
end