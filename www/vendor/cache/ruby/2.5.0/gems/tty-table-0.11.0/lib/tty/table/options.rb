# frozen_string_literal: true

require 'delegate'

module TTY
  class Table
    # Structure for holding table options with indifferent access
    class Options < DelegateClass(Hash)

      def initialize(hash={}, &block)
        super(&block)

        hash.each do |key, value|
          self[convert_key(key)] = valu
        end
      end

      def []=(key, value)
        super(convert_key(key), value)
      end

      def convert_key(key)
        key.is_a?(Symbol) ? key.to_s : key
      end

    end # Options
  end # Table
end # TTY
