require_relative "base"
module InspecPlugins::Suggest
  class SuggToolCommand < Inspec.plugin(2, :cli_command)

    desc "sign SETNAME", "Sign one or more suggestion sets into IAF files."
    def sign(*requested_sets)
      setup(requested_sets)

      with_requested_sets do |set_name, set_cfg|
        # read keyname from config file
        # find profile working directory
        # call inspec sign via Inspec.start
      end
    end
  end
end
