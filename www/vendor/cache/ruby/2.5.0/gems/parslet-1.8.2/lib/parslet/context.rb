# Provides a context for tree transformations to run in. The context allows
# accessing each of the bindings in the bindings hash as local method.
#
# Example: 
#
#   ctx = Context.new(:a => :b)
#   ctx.instance_eval do 
#     a # => :b
#   end
#
# @api private
class Parslet::Context
  include Parslet

  def initialize(bindings)
    bindings.each do |key, value|
      singleton_class.send(:define_method, key) { value }
      instance_variable_set("@#{key}", value)
    end
  end
end