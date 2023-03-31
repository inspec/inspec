module InspecPlugins
  module License
    class Plugin < ::Inspec.plugin(2)
      plugin_name :"inspec-license"

      cli_command :license do
        require_relative "inspec-license/cli"
        InspecPlugins::License::CLI
      end
    end
  end
end
