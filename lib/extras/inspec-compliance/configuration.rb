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
        f.write(@config.to_json)
      end
    end

    # deletes data
    def destroy
      File.delete(@config_file)
    end
  end
end
