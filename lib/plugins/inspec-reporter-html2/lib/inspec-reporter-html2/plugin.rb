require "inspec-reporter-html2/version"

# The InspecPlugins namespace is where all plugins should declare themselves.
# The 'Inspec' capitalization is used throughout the InSpec source code; yes, it's
# strange.
module InspecPlugins
  # Pick a reasonable namespace here for your plugin.  A reasonable choice
  # would be the CamelCase version of your plugin gem name.
  # inspec-reporter-html => HtmlReporter
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
