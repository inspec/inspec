module Inspec::Plugin::V2
  # Track loading status of each plugin.  These are the elements of the Registry.
  #
  # Lifecycle of an installed plugin:
  #  If present in the config file, bundled, or core, it is "known"
  #  All known plugins are loaded.  v1 plugins auto-activate. All loaded plugins know their version.
  #  v2 plugins activate when they are used.  All activated plugins know their implementation class.
  Status = Struct.new(
    :activators,              # Array of Activators - where plugin_type info gets stored
    :api_generation,          # 0,1,2 # TODO: convert all bundled (v0) to v2
    :plugin_class,            # Plugin class
    :entry_point,             # a gem name or filesystem path
    :installation_type,       # :gem, :path, :core, bundle # TODO: combine core and bundle
    :loaded,                  # true, false False could mean not attempted or failed
    :load_exception,          # Exception class if it failed to load
    :name,                    # String name
    :version,                 # three-digit version.  Core / bundled plugins use InSpec version here.
  ) do
    def initialize(*)
      super
      self[:activators] = []
      self[:loaded] = false
    end

    def plugin_types
      activators.map(&:plugin_type).uniq.sort
    end
  end
end
