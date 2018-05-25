# encoding:utf-8

module Inspec
  class Attribute
    attr_accessor :name
    attr_writer :value

    DEFAULT_ATTRIBUTE = Class.new do
      def initialize(name)
        @name = name
      end

      def method_missing(*_)
        Inspec::Log.warn(
            "Returning DEFAULT_ATTRIBUTE for '#{@name}'. "\
          "Use --attrs to provide a value for '#{@name}' or specify a default  "\
          "value with `attribute('#{@name}', default: 'somedefault', ...)`.",
        )

        self
      end

      def respond_to_missing?(_, _)
        true
      end
    end

    def initialize(name, options = {})
      @name = name
      @opts = options
      @value = nil
    end

    # implicit call is done by inspec to determine the value of an attribute
    def value
      @value.nil? ? default : @value
    end

    def default
      @opts.key?(:default) ? @opts[:default] : DEFAULT_ATTRIBUTE.new(@name)
    end

    def title
      @opts[:title]
    end

    def description
      @opts[:description]
    end

    def ruby_var_identifier
      @opts[:identifier] || 'attr_' + @name.downcase.strip.gsub(/\s+/, '-').gsub(/[^\w-]/, '')
    end

    def to_hash
      {
          name: @name,
          options: @opts,
      }
    end

    def to_ruby
      res = ["#{ruby_var_identifier} = attribute('#{@name}',{"]
      res.push "  title: '#{title}'," unless title.to_s.empty?
      res.push "  default: #{default.inspect}," unless default.to_s.empty?
      res.push "  description: '#{description}'," unless description.to_s.empty?
      res.push '})'
      res.join("\n")
    end

    def to_s
      "Attribute #{@name} with #{@value}"
    end

    def lookup(name)
      Attribute.lookup(name, @opts, @value)
    end

    def self.lookup(name, options = {}, collection = {})
      lookup = name.to_s.split(/:/)
      key = lookup.first
      next_keys = name.to_s[(key.size + 1)..-1]

      if next_keys
        if collection.is_a?(Hash)
          found_key = collection.keys.select {|x| x.to_s == key.to_s}.first
          if found_key
            attr = self.lookup(next_keys, options, collection[found_key])
            attr.name = name
            return attr
          end
        end

        if collection.is_a?(Array)
          index = nil
          begin
            index = Integer(key)
          rescue ArgumentError
            # Nothing to see here
          end
          if index && collection[index]
            attr = self.lookup(next_keys, options, collection[index])
            attr.name = name
            return attr
          end
        end
      end

      attr = Attribute.new(name, options)
      if collection.is_a?(Hash)
        found_key = collection.keys.select {|x| x.to_s == key.to_s}.first
        if found_key
          attr.value = collection[found_key]
          return attr
        end
      end

      if collection.is_a?(Array)
        index = nil
        begin
          index = Integer(key)
        rescue ArgumentError
          # Nothing to see here
        end
        if index && collection[index]
          attr.value = collection[index]
          return attr
        end
      end

      if collection.respond_to?(:[])
        if (value = collection[key])
          attr.value = value
        end
      else
        attr.value = collection
      end
      attr
    end
  end
end
