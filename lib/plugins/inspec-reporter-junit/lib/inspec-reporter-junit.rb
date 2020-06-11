require_relative "inspec-reporter-junit/version"
module InspecPlugins
  module JUnitReporter
    class Plugin < ::Inspec.plugin(2)
      plugin_name :'inspec-reporter-junit'

      # Legacy JUnit reporter, which generates subtly incorrect XML.
      reporter :junit do
        require_relative "inspec-reporter-junit/reporter"
        InspecPlugins::JUnitReporter::ReporterV1
      end

      # v2 reporter, which generates valid JUnit XML.
      reporter :junit2 do
        require_relative "inspec-reporter-junit/reporter"
        InspecPlugins::JUnitReporter::ReporterV2
      end

    end
  end
end
