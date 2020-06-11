module Tins
  module ThreadLocal
    @@mutex = Mutex.new

    @@cleanup = lambda do |my_object_id|
      my_id = "__thread_local_#{my_object_id}__"
      @@mutex.synchronize do
        for t in Thread.list
          t[my_id] = nil if t[my_id]
        end
      end
    end

    # Define a thread local variable named _name_ in this module/class. If the
    # value _value_ is given, it is used to initialize the variable.
    def thread_local(name, default_value = nil, &default)
      is_a?(Module) or raise TypeError, "receiver has to be a Module"

      default_value && default and raise ArgumentError,
        "require either default_falue or default block"

      if default_value
        default = -> * { default_value }
      end

      name = name.to_s
      my_id = "__thread_local_#{__id__}__"

      ObjectSpace.define_finalizer(self, @@cleanup)

      define_method(name) do
        values = Thread.current[my_id] ||= {}
        if default && !values.key?(name)
          values[name] = default.call
        end
        values[name]
      end

      define_method("#{name}=") do |value|
        Thread.current[my_id] ||= {}
        Thread.current[my_id][name] = value
      end

      self
    end

    # Define a thread local variable for the current instance with name _name_.
    # If the value _value_ is given, it is used to initialize the variable.
    def instance_thread_local(name, default_value = nil, &default)
      class << self
        extend Tins::ThreadLocal
        self
      end.thread_local name, default_value, &default
      self
    end
  end
end
