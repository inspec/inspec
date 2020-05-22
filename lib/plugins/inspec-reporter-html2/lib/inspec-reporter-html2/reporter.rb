require "erb"
require "inspec/config"

module InspecPlugins::Html2Reporter
  class Reporter < Inspec.plugin(2, :reporter)
    def render
      # Read config data from the user's config file. Supports two settings, both of which are absolute filesystem paths:
      #  alternate_css_file - contents will be used instead of default CSS
      #  alternate_js_file - contents will be used instead of default JavaScript
      cfg = Inspec::Config.cached.fetch_plugin_config("inspec-reporter-html2")

      template_path = File.expand_path(__FILE__ + "../../../../templates")
      template = ERB.new(File.read(template_path + "/body.html.erb"))
      output(template.result(binding))
    end

    def self.run_data_schema_constraints
      "~> 0.0"
    end
  end
end
