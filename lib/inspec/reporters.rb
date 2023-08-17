require "inspec/reporters/base"
require "inspec/reporters/cli"
require "inspec/reporters/json"
require "inspec/reporters/json_automate"
require "inspec/reporters/automate"
require "inspec/reporters/yaml"
require "inspec/feature"

module Inspec::Reporters
  # rubocop:disable Metrics/CyclomaticComplexity
  def self.render(reporter, run_data, enhanced_outcomes = false)
    name, config = reporter.dup
    Inspec.with_feature("inspec-reporter-#{name}") {
      config[:run_data] = run_data
      case name
      when "cli"
        reporter = Inspec::Reporters::CLI.new(config)
      when "json"
        reporter = Inspec::Reporters::Json.new(config)
      # This reporter is only used for Chef internal. We reserve the
      # right to introduce breaking changes to this reporter at any time.
      when "json-automate"
        reporter = Inspec::Reporters::JsonAutomate.new(config)
      when "automate"
        reporter = Inspec::Reporters::Automate.new(config)
      when "yaml"
        reporter = Inspec::Reporters::Yaml.new(config)
      else
        # If we made it here, it must be a plugin, and we know it exists (because we validated it in config.rb)
        activator = Inspec::Plugin::V2::Registry.instance.find_activator(plugin_type: :reporter, activator_name: name.to_sym)
        activator.activate!
        reporter = activator.implementation_class.new(config)
      end

      if enhanced_outcomes
        Inspec.with_feature("inspec-enhanced-outcomes") {
          reporter.enhanced_outcomes = enhanced_outcomes
        }
      else
        reporter.enhanced_outcomes = enhanced_outcomes
      end

      # optional send_report method on reporter
      return reporter.send_report if defined?(reporter.send_report)

      reporter.render
      output = reporter.rendered_output
      config_file = config["file"]
      if config_file
        config_file.gsub!("CHILD_PID", Process.pid.to_s)
        # create destination directory if it does not exist
        dirname = File.dirname(config_file)
        FileUtils.mkdir_p(dirname) unless File.directory?(dirname)

        File.write(config_file, output)
      elsif config["stdout"] == true
        print output
        $stdout.flush
      end
    }
  end

  def self.report(reporter, run_data)
    name, config = reporter.dup
    Inspec.with_feature("inspec-reporter-#{name}") {
      config[:run_data] = run_data
      case name
      when "json"
        reporter = Inspec::Reporters::Json.new(config)
      when "json-automate"
        reporter = Inspec::Reporters::JsonAutomate.new(config)
      when "yaml"
        reporter = Inspec::Reporters::Yaml.new(config)
      else
        # If we made it here, it might be a plugin
        begin
          activator = Inspec::Plugin::V2::Registry.instance.find_activator(plugin_type: :reporter, activator_name: name.to_sym)
          activator.activate!
          reporter = activator.implementation_class.new(config)
          unless reporter.respond_to(:report?)
            return run_data
          end
        rescue Inspec::Plugin::V2::LoadError
          # Must not have been a plugin - just return the run_data
          return run_data
        end
      end

      reporter.report
    }
  end
end
