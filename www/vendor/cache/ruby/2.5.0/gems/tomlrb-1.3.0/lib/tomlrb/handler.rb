module Tomlrb
  class Handler
    attr_reader :output, :symbolize_keys

    def initialize(**options)
      @output = {}
      @current = @output
      @stack = []
      @array_names = []
      @symbolize_keys = options[:symbolize_keys]
    end

    def set_context(identifiers, is_array_of_tables: false)
      @current = @output

      deal_with_array_of_tables(identifiers, is_array_of_tables) do |identifierz|
        identifierz.each do |k|
          k = k.to_sym if @symbolize_keys
          if @current[k].is_a?(Array)
            @current[k] << {} if @current[k].empty?
            @current = @current[k].last
          else
            @current[k] ||= {}
            @current = @current[k]
          end
        end
      end
    end

    def deal_with_array_of_tables(identifiers, is_array_of_tables)
      identifiers.map!{|n| n.gsub("\"", '')}
      stringified_identifier = identifiers.join('.')

      if is_array_of_tables
        @array_names << stringified_identifier
        last_identifier = identifiers.pop
      elsif @array_names.include?(stringified_identifier)
        raise ParseError, 'Cannot define a normal table with the same name as an already established array'
      end

      yield(identifiers)

      if is_array_of_tables
        last_identifier = last_identifier.to_sym if @symbolize_keys
        @current[last_identifier] ||= []
        @current[last_identifier] << {}
        @current = @current[last_identifier].last
      end
    end

    def assign(k)
      k = k.to_sym if @symbolize_keys
      @current[k] = @stack.pop
    end

    def push(o)
      @stack << o
    end

    def start_(type)
      push([type])
    end

    def end_(type)
      array = []
      while (value = @stack.pop) != [type]
        raise ParseError, 'Unclosed table' if value.nil?
        array.unshift(value)
      end
      array
    end
  end
end
