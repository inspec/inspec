require 'inspec/reporters/base'
require 'inspec/reporters/cli'
require 'inspec/reporters/json'
require 'inspec/reporters/json_min'
require 'inspec/reporters/junit'

module Inspec::Reporters
  def self.render(reporter, run_data)
    name, config = reporter
    config[:run_data] = run_data
    case name
    when 'cli'
      reporter = Inspec::Reporters::CLI.new(config)
    when 'json'
      reporter = Inspec::Reporters::Json.new(config)
    when 'json-min'
      reporter = Inspec::Reporters::JsonMin.new(config)
    when 'junit'
      reporter = Inspec::Reporters::Junit.new(config)
    else
      raise NotImplementedError, "'#{name}' is not a valid reporter type."
    end

    reporter.render
    output = reporter.rendered_output

    if config['file']
      File.write(config['file'], output)
    elsif config['stdout'] == true
      puts output
    end
  end
end
