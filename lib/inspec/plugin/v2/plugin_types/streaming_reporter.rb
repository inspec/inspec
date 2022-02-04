module Inspec::Plugin::V2::PluginType
  class StreamingReporter < Inspec::Plugin::V2::PluginBase # TBD Superclass may need to change
    register_plugin_type(:streaming_reporter)

    #====================================================================#
    #                StreamingReporter plugin type API
    #====================================================================#
    # Implementation classes must implement these methods.

    # def fetch(_profile_name, _input_name)
    # raise NotImplementedError, "Plugin #{plugin_name} must implement the #fetch method"
    # end

  end
end
