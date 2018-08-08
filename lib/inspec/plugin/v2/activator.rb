module Inspec::Plugin::V2
  Activator = Struct.new(
    :plugin_name,
    :plugin_type,
    :activator_name,
    :activated,
    :exception,
    :activation_proc,
    :implementation_class,
  ) do
    def initialize(*)
      super
      self[:activated] = false
    end
  end
end
