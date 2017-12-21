require 'inspec/reporters/base'
require 'inspec/reporters/cli'
require 'inspec/reporters/json'
require 'inspec/reporters/json_min'
require 'inspec/reporters/junit'

module Inspec::Reporters
  def self.render(config)
    case config[:name]
    when 'cli'
      output = Inspec::Reporters::CLI.new(config).render
    when 'json'
      output = Inspec::Reporters::Json.new(config).render
    when 'json-min'
      output = Inspec::Reporters::JsonMin.new(config).render
    when 'junit'
      output = Inspec::Reporters::Junit.new(config).render
    end

    path = config[:path]
    if path.nil? or path.strip == '-'
      puts output
    else
      File.write(path, output)
    end
  end
end
