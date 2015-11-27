# encoding: utf-8

require 'yaml'

class GordonConfig < Inspec.resource(1)
  name 'gordon_config'
  def initialize(conf_path = nil)
    @path = conf_path || File.join(File.dirname(__FILE__),'/config.yaml')
    @config = inspec.file(@path).content
    @params = YAML.load(@config)
  end

  def method_missing(name)
    @params[name.to_s]
  end

  def to_s
    'Gordon Config'
  end
end
