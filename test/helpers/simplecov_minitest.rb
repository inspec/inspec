# frozen_string_literal: true

# Load default formatter gem
require "pathname"
require "simplecov_json_formatter"
require "simplecov/profiles/root_filter"
require "simplecov/profiles/test_frameworks"
require "simplecov/profiles/bundler_filter"
require "simplecov/profiles/rails"

# Default configuration
SimpleCov.configure do
  formatter SimpleCov::Formatter::JSONFormatter
  load_profile "bundler_filter"
  # Exclude files outside of SimpleCov.root
  load_profile "root_filter"

  # We don't actually tolerate anything this low, we just don't want a nonizero exit under any cirumstances
  minimum_coverage 50
end

# Gotta stash this a-s-a-p, see the CommandGuesser class and i.e. #110 for further info
SimpleCov::CommandGuesser.original_run_command = "#{$PROGRAM_NAME} #{ARGV.join(" ")}"

# Autoload config from ~/.simplecov if present
require "simplecov/load_global_config"

# Autoload config from .simplecov if present
# Recurse upwards until we find .simplecov or reach the root directory

config_path = Pathname.new(SimpleCov.root)
loop do
  filename = config_path.join(".simplecov")
  if filename.exist?
    begin
      load filename
    rescue LoadError, StandardError
      $stderr.puts "Warning: Error occurred while trying to load #{filename}. " \
        "Error message: #{$!.message}"
    end
    break
  end
  config_path, = config_path.split
  break if config_path.root?
end
