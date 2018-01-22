require 'inspec/reporters/base'
require 'inspec/reporters/cli'
require 'inspec/reporters/json'
require 'inspec/reporters/json_min'
require 'inspec/reporters/junit'

module Inspec::Reporters
  def self.render(config)
    case config[:name]
    when 'cli'
      reporter = Inspec::Reporters::CLI.new(config)
    when 'json'
      reporter = Inspec::Reporters::Json.new(config)
    when 'json-min'
      reporter = Inspec::Reporters::JsonMin.new(config)
    when 'junit'
      reporter = Inspec::Reporters::Junit.new(config)
    end

    reporter.render
    output = reporter.rendered_output

    path = config[:path]
    if path.nil? || path.strip == '-'
      puts output
    else
      File.write(path, output)
    end
  end
end
