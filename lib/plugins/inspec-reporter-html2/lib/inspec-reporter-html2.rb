libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require "inspec-reporter-html2/version"
module InspecPlugins
  module Html2Reporter
    class Plugin < ::Inspec.plugin(2)
      # Internal machine name of the plugin. InSpec will use this in errors, etc.
      plugin_name :'inspec-reporter-html2'

      # Define a new Reporter.
      reporter :html2 do
        require "inspec-reporter-html2/reporter"
        InspecPlugins::Html2Reporter::Reporter
      end
    end
  end
end
