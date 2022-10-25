require "inspec/resources/command"
module Inspec::Resources
  class Mailalias < Inspec.resource(1)
    # resource internal name.
    name "mail_alias"

    # Restrict to only run on the below platforms (if none were given,
    # all OS's and cloud API's supported)
    supports platform: "unix"

    desc "Use the mail_alias InSpec audit resource to test mail alias present in the aliases file"

    example <<~EXAMPLE
      describe mail_alias("toor") do
        it { should be_aliased_to "root" }
      end
    EXAMPLE

    def initialize(alias_key)
      skip_resource "The `mail_alias` resource is not yet available on your OS." unless inspec.os.unix?
      @alias_key = alias_key
    end

    # resource_id is used in reporting engines to uniquely identify the individual resource.
    def resource_id
      "#{@alias_key}"
    end

    # resource appearance in test reports.
    def to_s
      "mail_alias #{resource_id}"
    end

    # aliased_to matcher checks if the given alias_value is set to the initialized alias_key
    def aliased_to?(alias_value)
      # /etc/aliases if the file where the alias and its value(s) are stored
      cmd = inspec.command("cat /etc/aliases | grep '^#{@alias_key}:'")
      raise Inspec::Exceptions::ResourceFailed, "#{@alias_key} is not a valid key in the aliases" if cmd.exit_status.to_i != 0

      # in general aliases file contains : separated values like alias_key : alias_value1, alias_value2
      alias_values_combined = cmd.stdout.split(":").map(&:strip)[1]
      alias_values_splitted = alias_values_combined.split(",").map(&:strip)
      alias_values_splitted.include?(alias_value)
    end
  end
end
