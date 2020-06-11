# frozen_string_literal: true

require_relative 'keys'

module TTY
  class Reader
    # Responsible for meta-data information about key pressed
    #
    # @api private
    class Key < Struct.new(:name, :ctrl, :meta, :shift)
      def initialize(*)
        super(nil, false, false, false)
      end
    end

    # Represents key event emitted during keyboard press
    #
    # @api public
    class KeyEvent < Struct.new(:key, :value, :line)
      # Create key event from read input codes
      #
      # @param [Hash[Symbol]] keys
      #   the keys and codes mapping
      # @param [Array[Integer]] codes
      #
      # @return [KeyEvent]
      #
      # @api public
      def self.from(keys, char, line = '')
        key = Key.new
        key.name = (name = keys[char]) ? name : :ignore

        case char
        when proc { |c| c =~ /^[a-z]{1}$/ }
          key.name = :alpha
        when proc { |c| c =~ /^[A-Z]{1}$/ }
          key.name = :alpha
          key.shift = true
        when proc { |c| c =~ /^\d+$/ }
          key.name = :num
        when proc { |cs| !Keys.ctrl_keys[cs].nil? }
          key.ctrl = true
        end

        new(key, char, line)
      end

      # Check if key event can be triggered
      #
      # @return [Boolean]
      #
      # @api public
      def trigger?
        !key.nil? && !key.name.nil?
      end
    end # KeyEvent
  end # Reader
end # TTY
