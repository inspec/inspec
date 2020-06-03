require_relative "inspec-reporter-cli/version"

module InspecPlugins
  module CliReporter
    class Plugin < ::Inspec.plugin(2)
      plugin_name :'inspec-reporter-cli'
      reporter :cli do
        require_relative "inspec-reporter-cli/reporter"
        InspecPlugins::CliReporter::Reporter
      end
    end
  end
end
