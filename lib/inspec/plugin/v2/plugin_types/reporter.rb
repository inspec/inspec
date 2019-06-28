module Inspec::Plugin::V2::PluginType
  class Reporter < Inspec::Plugin::V2::PluginBase
    register_plugin_type(:reporter)

    #====================================================================#
    #                         Reporter plugin type API
    #====================================================================#
    # Implementation classes must implement these methods.

    # Given a control and it's results, adds the necessary information to the report
    # @param control
    # @param results
    def results(_control, _results)
      raise NotImplementedError, "Plugin #{plugin_name} must implement the #results method"
    end

    # A finalizer method for closing report resources
    def close
      raise NotImplementedError, "Plugin #{plugin_name} must implement the #close method"
    end
  end
end
