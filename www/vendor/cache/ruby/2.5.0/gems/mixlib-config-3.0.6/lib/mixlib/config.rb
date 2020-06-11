#
# Author:: Adam Jacob (<adam@chef.io>)
# Author:: Nuo Yan (<nuo@chef.io>)
# Author:: Christopher Brown (<cb@chef.io>)
# Copyright:: Copyright (c) 2008-2018, Chef Software Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require_relative "config/version"
require_relative "config/configurable"
require_relative "config/unknown_config_option_error"
require_relative "config/reopened_config_context_with_configurable_error"
require_relative "config/reopened_configurable_with_config_context_error"

module Mixlib
  module Config
    def self.extended(base)
      class << base; attr_accessor :configuration; end
      class << base; attr_accessor :configurables; end
      class << base; attr_accessor :config_contexts; end
      class << base; attr_accessor :config_context_lists; end
      class << base; attr_accessor :config_context_hashes; end
      class << base; attr_accessor :config_parent; end
      base.configuration = ({})
      base.configurables = ({})
      base.config_contexts = ({})
      base.config_context_lists = ({})
      base.config_context_hashes = ({})
      base.initialize_mixlib_config
    end

    def initialize_mixlib_config
      @config_strict_mode = nil
    end

    # Loads a given ruby file, and runs instance_eval against it in the context of the current
    # object.
    #
    # Raises an IOError if the file cannot be found, or is not readable.
    #
    # === Parameters
    # filename<String>:: A filename to read from
    def from_file(filename)
      if %w{ .yml .yaml }.include?(File.extname(filename))
        from_yaml(filename)
      elsif File.extname(filename) == ".json"
        from_json(filename)
      elsif File.extname(filename) == ".toml"
        from_toml(filename)
      else
        instance_eval(IO.read(filename), filename, 1)
      end
    end

    # Parses valid YAML structure into Ruby so it can be ingested into the Class
    #
    # === Parameters
    # filename<String>:: A filename to read from
    def from_yaml(filename)
      require "yaml"
      from_hash(YAML.load(IO.read(filename)))
    end

    # Parses valid JSON structure into Ruby
    #
    # === Parameters
    # filename<String>:: A filename to read from
    def from_json(filename)
      require "json"
      from_hash(JSON.parse(IO.read(filename)))
    end

    def from_toml(filename)
      require "tomlrb"
      from_hash(Tomlrb.parse(IO.read(filename), symbolize_keys: true))
    end

    # Transforms a Hash into method-style configuration syntax to be processed
    #
    # === Parameters
    # hash<Hash>:: A Hash containing configuration
    def from_hash(hash)
      apply_nested_hash(hash)
    end

    # Pass Mixlib::Config.configure() a block, and it will yield itself
    #
    # === Parameters
    # block<Block>:: A block that is called with self.configuration as the argument.
    def configure(&block)
      yield(configuration)
    end

    # Get the value of a config option
    #
    # === Parameters
    # config_option<Symbol>:: The config option to return
    #
    # === Returns
    # value:: The value of the config option
    #
    # === Raises
    # <UnknownConfigOptionError>:: If the config option does not exist and strict mode is on.
    def [](config_option)
      internal_get(config_option.to_sym)
    end

    # Set the value of a config option
    #
    # === Parameters
    # config_option<Symbol>:: The config option to set (within the [])
    # value:: The value for the config option
    #
    # === Returns
    # value:: The new value of the config option
    #
    # === Raises
    # <UnknownConfigOptionError>:: If the config option does not exist and strict mode is on.
    def []=(config_option, value)
      internal_set(config_option.to_sym, value)
    end

    # Check if Mixlib::Config has a config option.
    #
    # === Parameters
    # key<Symbol>:: The config option to check for
    #
    # === Returns
    # <True>:: If the config option exists
    # <False>:: If the config option does not exist
    def key?(key)
      configuration.key?(key.to_sym) || config_contexts.key?(key.to_sym)
    end

    alias_method :has_key?, :key?

    def is_default?(key)
      symbol = key.to_sym
      if configurables.key?(symbol)
        configurables[symbol].is_default?(configuration)
      else
        raise ArgumentError, "config option must exist, and not be a context to check for default values"
      end
    end

    # Resets a config option to its default.
    #
    # === Parameters
    # symbol<Symbol>:: Name of the config option
    def delete(symbol)
      configuration.delete(symbol)
    end

    # Resets all config options to their defaults.
    def reset
      self.configuration = ({})
      config_contexts.values.each(&:reset)
    end

    # Makes a copy of any non-default values.
    #
    # This returns a shallow copy of the hash; while the hash itself is
    # duplicated a la dup, modifying data inside arrays and hashes may modify
    # the original Config object.
    #
    # === Returns
    #
    # Hash of values the user has set.
    #
    # === Examples
    #
    # For example, this config class:
    #
    #     class MyConfig < Mixlib::Config
    #       default :will_be_set, 1
    #       default :will_be_set_to_default, 1
    #       default :will_not_be_set, 1
    #       configurable(:computed_value) { |x| x*2 }
    #       config_context :group do
    #         default :will_not_be_set, 1
    #       end
    #       config_context :group_never_set
    #     end
    #
    #     MyConfig.x = 2
    #     MyConfig.will_be_set = 2
    #     MyConfig.will_be_set_to_default = 1
    #     MyConfig.computed_value = 2
    #     MyConfig.group.x = 3
    #
    # produces this:
    #
    #     MyConfig.save == {
    #       :x => 2,
    #       :will_be_set => 2,
    #       :will_be_set_to_default => 1,
    #       :computed_value => 4,
    #       :group => {
    #         :x => 3
    #       }
    #     }
    #
    def save(include_defaults = false)
      result = configuration.dup
      if include_defaults
        (configurables.keys - result.keys).each do |missing_default|
          # Ask any configurables to save themselves into the result array
          if configurables[missing_default].has_default
            result[missing_default] = configurables[missing_default].default
          end
        end
      end
      config_contexts.each_pair do |key, context|
        context_result = context.save(include_defaults)
        result[key] = context_result if context_result.size != 0 || include_defaults
      end
      config_context_lists.each_pair do |key, meta|
        meta[:values].each do |context|
          context_result = context.save(include_defaults)
          result[key] = (result[key] || []) << context_result if context_result.size != 0 || include_defaults
        end
      end
      config_context_hashes.each_pair do |key, meta|
        meta[:values].each_pair do |context_key, context|
          context_result = context.save(include_defaults)
          (result[key] ||= {})[context_key] = context_result if context_result.size != 0 || include_defaults
        end
      end
      result
    end
    alias :to_hash :save

    # Restore non-default values from the given hash.
    #
    # === Parameters
    # hash<Hash>: a hash in the same format as output by save.
    #
    # === Returns
    # self
    def restore(hash)
      self.configuration = hash.reject { |key, value| config_contexts.key?(key) }
      config_contexts.each do |key, config_context|
        if hash.key?(key)
          config_context.restore(hash[key])
        else
          config_context.reset
        end
      end
      config_context_lists.each do |key, meta|
        meta[:values] = []
        if hash.key?(key)
          hash[key].each do |val|
            context = define_context(meta[:definition_blocks])
            context.restore(val)
            meta[:values] << context
          end
        end
      end
      config_context_hashes.each do |key, meta|
        meta[:values] = {}
        if hash.key?(key)
          hash[key].each do |vkey, val|
            context = define_context(meta[:definition_blocks])
            context.restore(val)
            meta[:values][vkey] = context
          end
        end
      end
    end

    # Merge an incoming hash with our config options
    #
    # === Parameters
    # hash<Hash>: a hash in the same format as output by save.
    #
    # === Returns
    # self
    def merge!(hash)
      hash.each do |key, value|
        if config_contexts.key?(key)
          # Grab the config context and let internal_get cache it if so desired
          config_contexts[key].restore(value)
        else
          configuration[key] = value
        end
      end
      self
    end

    # Return the set of config hash keys.
    # This *only* returns hash keys which have been set by the user.  In future
    # versions this will likely be removed in favor of something more explicit.
    # For now though, we want this to match has_key?
    #
    # === Returns
    # result of Hash#keys
    def keys
      configuration.keys
    end

    # Creates a shallow copy of the internal hash
    # NOTE: remove this in 3.0 in favor of save.  This is completely useless
    # with default values and configuration_context.
    #
    # === Returns
    # result of Hash#dup
    def hash_dup
      save
    end

    # metaprogramming to ensure that the slot for method_symbol
    # gets set to value after any other logic is run
    #
    # === Parameters
    # method_symbol<Symbol>:: Name of the method (variable setter)
    # blk<Block>:: logic block to run in setting slot method_symbol to value
    # value<Object>:: Value to be set in config hash
    #
    def config_attr_writer(method_symbol, &block)
      configurable(method_symbol).writes_value(&block)
    end

    # metaprogramming to set the default value for the given config option
    #
    # === Parameters
    # symbol<Symbol>:: Name of the config option
    # default_value<Object>:: Default value (can be unspecified)
    # block<Block>:: Logic block that calculates default value
    def default(symbol, default_value = nil, &block)
      configurable(symbol).defaults_to(default_value, &block)
    end

    # metaprogramming to set information about a config option.  This may be
    # used in one of two ways:
    #
    # 1. Block-based:
    # configurable(:attr) do
    #   defaults_to 4
    #   writes_value { |value| 10 }
    # end
    #
    # 2. Chain-based:
    # configurable(:attr).defaults_to(4).writes_value { |value| 10 }
    #
    # Currently supported configuration:
    #
    # defaults_to(value): value returned when configurable has no explicit value
    # defaults_to BLOCK: block is run when the configurable has no explicit value
    # writes_value BLOCK: block that is run to filter a value when it is being set
    #
    # === Parameters
    # symbol<Symbol>:: Name of the config option
    # default_value<Object>:: Default value [optional]
    # block<Block>:: Logic block that calculates default value [optional]
    #
    # === Returns
    # The value of the config option.
    def configurable(symbol, &block)
      unless configurables[symbol]
        if config_contexts.key?(symbol)
          raise ReopenedConfigContextWithConfigurableError, "Cannot redefine config_context #{symbol} as a configurable value"
        end

        configurables[symbol] = Configurable.new(symbol)
        define_attr_accessor_methods(symbol)
      end
      if block
        yield(configurables[symbol])
      end
      configurables[symbol]
    end

    # Allows you to create a new config context where you can define new
    # options with default values.
    #
    # This method allows you to open up the configurable more than once.
    #
    # For example:
    #
    # config_context :server_info do
    #   configurable(:url).defaults_to("http://localhost")
    # end
    #
    # === Parameters
    # symbol<Symbol>: the name of the context
    # block<Block>: a block that will be run in the context of this new config
    # class.
    def config_context(symbol, &block)
      if configurables.key?(symbol)
        raise ReopenedConfigurableWithConfigContextError, "Cannot redefine config value #{symbol} with a config context"
      end

      if config_contexts.key?(symbol)
        context = config_contexts[symbol]
      else
        context = Class.new
        context.extend(::Mixlib::Config)
        context.config_parent = self
        config_contexts[symbol] = context
        define_attr_accessor_methods(symbol)
      end

      if block
        context.instance_eval(&block)
      end

      context
    end

    # Allows you to create a new list of config contexts where you can define new
    # options with default values.
    #
    # This method allows you to open up the configurable more than once.
    #
    # For example:
    #
    # config_context_list :listeners, :listener do
    #   configurable(:url).defaults_to("http://localhost")
    # end
    #
    # === Parameters
    # symbol<Symbol>: the plural name for contexts in the list
    # symbol<Symbol>: the singular name for contexts in the list
    # block<Block>: a block that will be run in the context of this new config
    # class.
    def config_context_list(plural_symbol, singular_symbol, &block)
      if configurables.key?(plural_symbol)
        raise ReopenedConfigurableWithConfigContextError, "Cannot redefine config value #{plural_symbol} with a config context"
      end

      unless config_context_lists.key?(plural_symbol)
        config_context_lists[plural_symbol] = {
          definition_blocks: [],
          values: [],
        }
        define_list_attr_accessor_methods(plural_symbol, singular_symbol)
      end

      config_context_lists[plural_symbol][:definition_blocks] << block if block_given?
    end

    # Allows you to create a new hash of config contexts where you can define new
    # options with default values.
    #
    # This method allows you to open up the configurable more than once.
    #
    # For example:
    #
    # config_context_hash :listeners, :listener do
    #   configurable(:url).defaults_to("http://localhost")
    # end
    #
    # === Parameters
    # symbol<Symbol>: the plural name for contexts in the list
    # symbol<Symbol>: the singular name for contexts in the list
    # block<Block>: a block that will be run in the context of this new config
    # class.
    def config_context_hash(plural_symbol, singular_symbol, &block)
      if configurables.key?(plural_symbol)
        raise ReopenedConfigurableWithConfigContextError, "Cannot redefine config value #{plural_symbol} with a config context"
      end

      unless config_context_hashes.key?(plural_symbol)
        config_context_hashes[plural_symbol] = {
          definition_blocks: [],
          values: {},
        }
        define_hash_attr_accessor_methods(plural_symbol, singular_symbol)
      end

      config_context_hashes[plural_symbol][:definition_blocks] << block if block_given?
    end

    NOT_PASSED = Object.new

    # Gets or sets strict mode.  When strict mode is on, only values which
    # were specified with configurable(), default() or writes_with() may be
    # retrieved or set. Getting or setting anything else will cause
    # Mixlib::Config::UnknownConfigOptionError to be thrown.
    #
    # If this is set to :warn, unknown values may be get or set, but a warning
    # will be printed with Chef::Log.warn if this occurs.
    #
    # === Parameters
    # value<String>:: pass this value to set strict mode [optional]
    #
    # === Returns
    # Current value of config_strict_mode
    #
    # === Raises
    # <ArgumentError>:: if value is set to something other than true, false, or :warn
    #
    def config_strict_mode(value = NOT_PASSED)
      if value == NOT_PASSED
        if @config_strict_mode.nil?
          if config_parent
            config_parent.config_strict_mode
          else
            false
          end
        else
          @config_strict_mode
        end
      else
        self.config_strict_mode = value
      end
    end

    # Sets strict mode.  When strict mode is on, only values which
    # were specified with configurable(), default() or writes_with() may be
    # retrieved or set.  All other values
    #
    # If this is set to :warn, unknown values may be get or set, but a warning
    # will be printed with Chef::Log.warn if this occurs.
    #
    # === Parameters
    # value<String>:: pass this value to set strict mode [optional]
    #
    # === Raises
    # <ArgumentError>:: if value is set to something other than true, false, or :warn
    #
    def config_strict_mode=(value)
      unless [ true, false, :warn, nil ].include?(value)
        raise ArgumentError, "config_strict_mode must be true, false, nil or :warn"
      end

      @config_strict_mode = value
    end

    # Allows for simple lookups and setting of config options via method calls
    # on Mixlib::Config.  If there any arguments to the method, they are used to set
    # the value of the config option.  Otherwise, it's a simple get operation.
    #
    # === Parameters
    # method_symbol<Symbol>:: The method called.  Must match a config option.
    # *args:: Any arguments passed to the method
    #
    # === Returns
    # value:: The value of the config option.
    #
    # === Raises
    # <UnknownConfigOptionError>:: If the config option does not exist and strict mode is on.
    def method_missing(method_symbol, *args)
      method_symbol = $1.to_sym if method_symbol.to_s =~ /(.+)=$/
      internal_get_or_set(method_symbol, *args)
    end

    protected

    # Given a (nested) Hash, apply it to the config object and any contexts.
    #
    # This is preferable to converting it to the string representation with
    # the #to_dotted_hash method above.
    #
    # === Parameters
    # hash<Hash>:: The hash to apply to the config oject
    def apply_nested_hash(hash)
      hash.each do |k, v|
        if v.is_a? Hash
          # If loading from hash, and we reference a context that doesn't exist
          # and warning/strict is off, we need to create the config context that we expected to be here.
          context = internal_get(k.to_sym) || config_context(k.to_sym)
          context.apply_nested_hash(v)
        else
          internal_set(k.to_sym, v)
        end
      end
    end

    private

    # Given a (nested) Hash, turn it into a single top-level hash using dots as
    # nesting notation. This allows for direction translation into method-style
    # setting of Config.
    #
    # === Parameters
    # hash<Hash>:: The hash to "de-nestify"
    # recursive_key<String>:: The existing key to prepend going forward
    #
    # === Returns
    # value:: A single-depth Hash using dot notation to indicate nesting
    def to_dotted_hash(hash, recursive_key = "")
      hash.each_with_object({}) do |(k , v), ret|
        key = recursive_key + k.to_s
        if v.is_a? Hash
          ret.merge!(to_dotted_hash(v, key + "."))
        else
          ret[key] = v
        end
      end
    end

    # Internal dispatch setter for config values.
    #
    # === Parameters
    # symbol<Symbol>:: Name of the method (variable setter)
    # value<Object>:: Value to be set in config hash
    #
    def internal_set(symbol, value)
      if configurables.key?(symbol)
        configurables[symbol].set(configuration, value)
      elsif config_contexts.key?(symbol)
        config_contexts[symbol].restore(value.to_hash)
      else
        if config_strict_mode == :warn
          Chef::Log.warn("Setting unsupported config value #{symbol}.")
        elsif config_strict_mode
          raise UnknownConfigOptionError, "Cannot set unsupported config value #{symbol}."
        end
        configuration[symbol] = value
      end
    end

    def internal_get(symbol)
      if configurables.key?(symbol)
        configurables[symbol].get(configuration)
      elsif config_contexts.key?(symbol)
        config_contexts[symbol]
      elsif config_context_lists.key?(symbol)
        config_context_lists[symbol]
      elsif config_context_hashes.key?(symbol)
        config_context_hashes[symbol]
      else
        if config_strict_mode == :warn
          Chef::Log.warn("Reading unsupported config value #{symbol}.")
        elsif config_strict_mode
          raise UnknownConfigOptionError, "Reading unsupported config value #{symbol}."
        end
        configuration[symbol]
      end
    end

    def internal_get_or_set(symbol, *args)
      num_args = args.length
      # Setting
      if num_args > 0
        internal_set(symbol, num_args == 1 ? args[0] : args)
      end

      # Returning
      internal_get(symbol)
    end

    def define_attr_accessor_methods(symbol)
      # When Ruby 1.8.7 is no longer supported, this stuff can be done with define_singleton_method!
      meta = class << self; self; end
      # Setter
      meta.send :define_method, "#{symbol}=".to_sym do |value|
        internal_set(symbol, value)
      end
      # Getter
      meta.send :define_method, symbol do |*args, &block|
        # If a block was given, eval it in the context
        if block
          # If the block expects no arguments, then instance_eval
          if block.arity == 0
            internal_get(symbol).instance_eval(&block)
          else # yield to the block
            block.yield(internal_get(symbol))
          end
        else
          internal_get_or_set(symbol, *args)
        end
      end
    end

    def define_list_attr_accessor_methods(plural_symbol, singular_symbol)
      # When Ruby 1.8.7 is no longer supported, this stuff can be done with define_singleton_method!
      meta = class << self; self; end
      # Getter for list
      meta.send :define_method, plural_symbol do
        internal_get(plural_symbol)[:values]
      end
      # Adds a single new context to the list
      meta.send :define_method, singular_symbol do |&block|
        context_list_details = internal_get(plural_symbol)
        new_context = define_context(context_list_details[:definition_blocks])
        context_list_details[:values] << new_context
        # If the block expects no arguments, then instance_eval
        if block.arity == 0
          new_context.instance_eval(&block)
        else # yield to the block
          block.yield(new_context)
        end
      end
    end

    def define_hash_attr_accessor_methods(plural_symbol, singular_symbol)
      # When Ruby 1.8.7 is no longer supported, this stuff can be done with define_singleton_method!
      meta = class << self; self; end
      # Getter for list
      meta.send :define_method, plural_symbol do
        internal_get(plural_symbol)[:values]
      end
      # Adds a single new context to the list
      meta.send :define_method, singular_symbol do |key, &block|
        context_hash_details = internal_get(plural_symbol)
        context = if context_hash_details[:values].key? key
                    context_hash_details[:values][key]
                  else
                    new_context = define_context(context_hash_details[:definition_blocks])
                    context_hash_details[:values][key] = new_context
                    new_context
                  end
        # If the block expects no arguments, then instance_eval
        if block.arity == 0
          context.instance_eval(&block)
        else # yield to the block
          block.yield(context)
        end
      end
    end

    def define_context(definition_blocks)
      context = Class.new
      context.extend(::Mixlib::Config)
      context.config_parent = self
      definition_blocks.each do |block|
        context.instance_eval(&block)
      end
      context
    end
  end
end
