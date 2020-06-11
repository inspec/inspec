module Tins
  module MethodDescription
    class Parameters
      class Parameter < Struct.new(:type, :name)
        def ==(other)
          type == other.type
        end

        def inspect
          "#<#{self.class} #{to_s.inspect}>"
        end
      end

      class RestParameter < Parameter
        def to_s
          "*#{name}"
        end
      end

      class KeyrestParameter < Parameter
        def to_s
          "**#{name}"
        end
      end

      class ReqParameter < Parameter
        def to_s
          name.to_s
        end
      end

      class OptParameter < Parameter
        def to_s
          "#{name}=?"
        end
      end

      class KeyParameter < Parameter
        def to_s
          "#{name}:?"
        end
      end

      class KeyreqParameter < Parameter
        def to_s
          "#{name}:"
        end
      end

      class BlockParameter < Parameter
        def to_s
          "&#{name}"
        end
      end

      class GenericParameter < Parameter
        def to_s
          [ name, type ] * ?:
        end
      end

      def self.build(type, name)
        parameter_classname = "#{type.to_s.capitalize}Parameter"
        parameter_class =
          if const_defined? parameter_classname
            const_get parameter_classname
          else
            GenericParameter
          end
        parameter_class.new(type, name)
      end
    end

    class Signature
      def initialize(*parameters)
        @parameters = parameters
      end

      attr_reader :parameters

      def eql?(other)
        @parameters.eql? other.parameters
      end

      def ==(other)
        @parameters == other.parameters
      end

      def ===(method)
        self == method.signature
      end

      def to_s
        @parameters * ?,
      end

      def inspect
        "#<#{self.class} (#{to_s})>"
      end
    end

    def signature
      description style: :parameters
    end

    def description(style: :namespace)
      valid_styles = %i[ namespace name parameters ]
      valid_styles.include?(style) or
        raise ArgumentError,
        "style has to be one of #{valid_styles * ', '}"
      if respond_to?(:parameters)
        generated_name = 'x0'
        parameter_array = parameters.map { |p_type, p_name|
          unless p_name
            generated_name = generated_name.succ
            p_name = generated_name
          end
          Parameters.build(p_type, p_name)
        }
        signature = Signature.new(*parameter_array)
        if style == :parameters
          return signature
        end
      end
      result = ''
      if style == :namespace
        if owner <= Module
          result << receiver.to_s << ?. # XXX Better to use owner here as well?
        else
          result << owner.name.to_s << ?#
        end
      end
      if %i[ namespace name ].include?(style)
        result << name.to_s << '('
      end
      result << (signature || arity).to_s
      if %i[ namespace name ].include?(style)
        result << ?)
      end
      result
    end
  end
end
