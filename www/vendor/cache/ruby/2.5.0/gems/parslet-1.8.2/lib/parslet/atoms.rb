
# This is where parslets name comes from: Small parser atoms.
#
module Parslet::Atoms
  # The precedence module controls parenthesis during the #inspect printing
  # of parslets. It is not relevant to other aspects of the parsing.
  #
  module Precedence
    BASE       = 1    # everything else
    LOOKAHEAD  = 2    # &SOMETHING
    REPETITION = 3    # 'a'+, 'a'?
    SEQUENCE   = 4    # 'a' 'b'
    ALTERNATE  = 5    # 'a' | 'b'
    OUTER      = 6    # printing is done here.
  end

  require 'parslet/atoms/can_flatten'
  require 'parslet/atoms/context'
  require 'parslet/atoms/dsl'
  require 'parslet/atoms/base'
  require 'parslet/atoms/ignored'
  require 'parslet/atoms/named'
  require 'parslet/atoms/lookahead'
  require 'parslet/atoms/alternative'
  require 'parslet/atoms/sequence'
  require 'parslet/atoms/repetition'
  require 'parslet/atoms/re'
  require 'parslet/atoms/str'
  require 'parslet/atoms/entity'
  require 'parslet/atoms/capture'
  require 'parslet/atoms/dynamic'
  require 'parslet/atoms/scope'
  require 'parslet/atoms/infix'
end
