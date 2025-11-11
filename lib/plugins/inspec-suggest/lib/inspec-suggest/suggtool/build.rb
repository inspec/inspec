require_relative "base"

module InspecPlugins::Suggest
  class SuggToolCommand < Inspec.plugin(2, :cli_command)

    # options from suggtool check
    option :fail_fast, type: :boolean, default: false,
      desc: "Stop after any one file has errors."
    option :ignore_errors, type: :boolean, default: false,
      desc: "Continue even if at least one file has errors"
    option :disable_check, type: :array,
      desc: "List of names of checks to disable"

    # option from suggtool bump
    option :level, type: :string, default: "patch",
      desc: "Level of the version number to bump. One of: patch, minor, major"

    # options from suggtool sign
    option :keyname, type: :string,
      desc: "Name of key to sign the profile. Passed to `inspec sign profile`."
    option :out_dir, type: :string,
      desc: "Output directory for the IAF files. Default: SRC/etc/suggest"

    desc "build", "Perform complete build for all suggtool utilities"
    def build(*requested_sets)
      fetch(*requested_sets)
      check(*requested_sets)
      package(*requested_sets)
      bump(*requested_sets)
      load_sign_plugin
      sign(*requested_sets)
    end

    no_commands do
      def load_sign_plugin
        # Before calling sign, we must ensure that the inspec-sign plugin is loaded. 
        # Normally this happens automatically when the word "sign" appears on the CLI.
        # But since we here invoke "inspec suggtool build", that didn't happen.
        # So the fix is to manually activate and register the plugin now.
        activator = Inspec::Plugin::V2::Registry.instance.find_activators(plugin_type: :cli_command, plugin_name: :"inspec-sign", activator_name: :sign).first
        activator.activate!
        Inspec::InspecCLI.register(activator.implementation_class, activator.activator_name.to_s, "", "", {})
      end
    end
  end
end
