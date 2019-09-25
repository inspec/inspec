module Inspec::Plugin::V2
  Activator = Struct.new(
    :plugin_name,
    :plugin_type,
    :activator_name,
    :activated,
    :exception,
    :activation_proc,
    :implementation_class
  ) do
    def initialize(*)
      super
      self[:activated] = false
    end

    alias activated? activated

    # Load a plugin, but if an error is encountered, store it and continue
    def activate
      return if activated?

      # rubocop: disable Lint/RescueException
      begin
        impl_class = self[:activation_proc].call
        self.activated = true
        self[:implementation_class] = impl_class
      rescue Exception => ex
        self[:exception] = ex
        Inspec::Log.error "Could not activate #{self[:plugin_type]} hook named '#{self[:activator_name]}' for plugin #{self[:plugin_name]}"
      end
      # rubocop: enable Lint/RescueException
    end

    # Load a plugin, but if an error is encountered, re-throw it
    def activate!
      activate
      raise exception if exception
    end
  end
end
