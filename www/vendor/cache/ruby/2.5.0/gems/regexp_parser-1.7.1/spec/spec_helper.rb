require 'regexp_parser'
require 'regexp_property_values'
require_relative 'support/shared_examples'

RS = Regexp::Scanner
RL = Regexp::Lexer
RP = Regexp::Parser
RE = Regexp::Expression
T = Regexp::Syntax::Token

include Regexp::Expression

def ruby_version_at_least(version)
  Gem::Version.new(RUBY_VERSION.dup) >= Gem::Version.new(version)
end
