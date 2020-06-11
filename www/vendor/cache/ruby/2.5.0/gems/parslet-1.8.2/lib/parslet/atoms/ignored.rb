# Ignores the result of a match.
#
# Example:
#
#   str('foo')            # will return 'foo',
#   str('foo').ignore     # will return nil
#
class Parslet::Atoms::Ignored < Parslet::Atoms::Base
  attr_reader :parslet
  def initialize(parslet)
    super()

    @parslet = parslet
  end

  def apply(source, context, consume_all)
    success, _ = result = parslet.apply(source, context, consume_all)

    return result unless success
    succ(nil)
  end
  
  def to_s_inner(prec)
    "ignored(#{parslet.to_s(prec)})"
  end
end
