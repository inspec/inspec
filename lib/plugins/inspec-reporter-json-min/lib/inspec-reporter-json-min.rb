require_relative "inspec-reporter-json-min/version"

module InspecPlugins
  module JsonMinReporter
    class Plugin < ::Inspec.plugin(2)
      plugin_name :"inspec-reporter-json-min"
      reporter :"json-min" do
        require_relative "inspec-reporter-json-min/reporter"
        InspecPlugins::JsonMinReporter::Reporter
      end
    end
  end
end
