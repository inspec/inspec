require "inspec/resources/command"

module Inspec::Resources
  class PhpConfig < Inspec.resource(1)
    # Resource's internal name.
    name "php_config"
    supports platform: "unix"
    supports platform: "windows"
    desc "Use the php_config InSpec audit resource to test PHP config parameters"

    example <<~EXAMPLE
      describe php_config("config_param") do
        its("value") { should eq "some_value" }
      end

      describe php_config("config_param", { "ini" => "path_to_ini_file" }) do
        its("value") { should eq "some_value"  }
      end
    EXAMPLE

    # Resource initialization.
    attr_reader :config_param, :config_file_or_path
    def initialize(config_param, config_file_or_path = {})
      @config_param = config_param
      @config_file_or_path = config_file_or_path
    end

    # Unique resource id
    def resource_id
      config_param
    end

    # Resource appearance in test reports.
    def to_s
      "php_config #{resource_id}"
    end

    # Returns the value evaluated for the initialized config parameter
    def value
      php_utility = find_utility_or_error

      # The keys in the hash provided by user can be string or symbols.
      # Converting the key to symbols to handle scenario when "ini" key is provided as string.
      config_file_or_path.transform_keys(&:to_sym)

      # Assign the path with -c option for ini file provided by the user if any.
      php_ini_file = !config_file_or_path.empty? && config_file_or_path.key?(:ini) ? "-c #{config_file_or_path[:ini]}" : ""

      # The below command `get_cfg_var` is used to fetch the value for any config parameter.
      php_cmd = "#{php_utility} #{php_ini_file} -r 'echo get_cfg_var(\"#{config_param}\");'"
      config_value_cmd = inspec.command(php_cmd)

      raise Inspec::Exceptions::ResourceFailed, "Executing #{php_cmd} failed: #{config_value_cmd.stderr}" if config_value_cmd.exit_status.to_i != 0

      config_value = config_value_cmd.stdout.strip

      # Convert value to integer if the config value are digits.
      config_value.match(/^(\d)+$/) ? config_value.to_i : config_value
    end

    private

    # Method to check if php is present or not on the system.
    def find_utility_or_error
      %w{/usr/sbin/php /sbin/php php}.each do |cmd|
        return cmd if inspec.command(cmd).exist?
      end

      raise Inspec::Exceptions::ResourceFailed, "Could not find `php` on your system."
    end
  end
end
