require_relative "inspec-reporter-junit/version"
module InspecPlugins
  module JUnitReporter
    class Plugin < ::Inspec.plugin(2)
      plugin_name :'inspec-reporter-junit'
      reporter :junit do
        require_relative "inspec-reporter-junit/reporter"
        InspecPlugins::JUnitReporter::Reporter
      end
    end
  end
end
