module Inspec::Plugin::V2
  Activator = Struct.new(
    :plugin_name,
    :plugin_type,
    :activator_name,
    :'activated?',
    :exception,
    :activation_proc,
    :implementation_class,
  ) do
    def initialize(*)
      super
      self[:'activated?'] = false
    end

    def activated?(new_value = nil)
      return self[:'activated?'] if new_value.nil?
      self[:'activated?'] = new_value
    end
  end
end
