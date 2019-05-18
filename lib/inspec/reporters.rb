require 'inspec/reporters/base'
require 'inspec/reporters/cli'
require 'inspec/reporters/json'
require 'inspec/reporters/json_automate'
require 'inspec/reporters/json_min'
require 'inspec/reporters/junit'
require 'inspec/reporters/automate'
require 'inspec/reporters/yaml'

module Inspec::Reporters
  # rubocop:disable Metrics/CyclomaticComplexity
  def self.render(reporter, run_data)
    name, config = reporter.dup
    config[:run_data] = run_data
    case name
    when 'cli'
      reporter = Inspec::Reporters::CLI.new(config)
    when 'json'
      reporter = Inspec::Reporters::Json.new(config)
    # This reporter is only used for Chef internal. We reserve the
    # right to introduce breaking changes to this reporter at any time.
    when 'json-automate'
      reporter = Inspec::Reporters::JsonAutomate.new(config)
    when 'json-min'
      reporter = Inspec::Reporters::JsonMin.new(config)
    when 'junit'
      reporter = Inspec::Reporters::Junit.new(config)
    when 'automate'
      reporter = Inspec::Reporters::Automate.new(config)
    when 'yaml'
      reporter = Inspec::Reporters::Yaml.new(config)
    else
      raise NotImplementedError, "'#{name}' is not a valid reporter type."
    end

    # optional send_report method on reporter
    return reporter.send_report if defined?(reporter.send_report)

    reporter.render
    output = reporter.rendered_output

    if config['file']
      # create destination directory if it does not exist
      dirname = File.dirname(config['file'])
      FileUtils.mkdir_p(dirname) unless File.directory?(dirname)

      File.write(config['file'], output)
    elsif config['stdout'] == true
      print output
      $stdout.flush
    end
  end

  def self.report(reporter, run_data)
    name, config = reporter.dup
    config[:run_data] = run_data
    case name
    when 'json'
      reporter = Inspec::Reporters::Json.new(config)
    when 'json-min'
      reporter = Inspec::Reporters::JsonMin.new(config)
    when 'json-automate'
      reporter = Inspec::Reporters::JsonAutomate.new(config)
    when 'yaml'
      reporter = Inspec::Reporters::Yaml.new(config)
    else
      # use base run_data hash for any other report
      return run_data
    end

    reporter.report
  end
end
