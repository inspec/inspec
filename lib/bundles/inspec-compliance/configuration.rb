# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

module Compliance
  # stores configuration on local filesystem
  class Configuration
    def initialize
      @config_path = File.join(Dir.home, '.inspec', 'compliance')
      # ensure the directory is available
      unless File.directory?(@config_path)
        FileUtils.mkdir_p(@config_path)
      end
      # set config file path
      @config_file = File.join(@config_path, '/config.json')
      @config = {}

      # load the data
      get
    end

    # direct access to config
    def [](key)
      @config[key]
    end

    def []=(key, value)
      @config[key] = value
    end

    def clean
      @config = {}
    end

    # return the json data
    def get
      if File.exist?(@config_file)
        file = File.read(@config_file)
        @config = JSON.parse(file)
      end
      @config
    end

    # stores a hash to json
    def store
      File.open(@config_file, 'w') do |f|
        f.chmod(0600)
        f.write(@config.to_json)
      end
    end

    # deletes data
    def destroy
      if File.exist?(@config_file)
        File.delete(@config_file)
      else
        true
      end
    end

    # return if the (stored) api version does not support a certain feature
    def supported?(feature)
      sup = version_with_support(feature)

      # we do not know the version, therefore we do not know if its possible to use the feature
      return if self['version'].nil? || self['version']['version'].nil?

      if sup.is_a?(Array)
        Gem::Version.new(self['version']['version']) >= sup[0] &&
          Gem::Version.new(self['version']['version']) < sup[1]
      else
        Gem::Version.new(self['version']['version']) >= sup
      end
    end

    # exit 1 if the version of compliance that we're working with doesn't support odic
    def legacy_check!(feature)
      if !supported?(feature)
        puts "This feature (#{feature}) is not available for legacy installations."
        puts 'Please upgrade to a recent version of Chef Compliance.'
        exit 1
      end
    end

    private

    # for a feature, returns either:
    #  - a version v0:                      v supports v0       iff v0 <= v
    #  - an array [v0, v1] of two versions: v supports [v0, v1] iff v0 <= v < v1
    def version_with_support(feature)
      case feature.to_sym
      when :oidc
        Gem::Version.new('0.16.19')
      else
        Gem::Version.new('0.0.0')
      end
    end
  end
end
