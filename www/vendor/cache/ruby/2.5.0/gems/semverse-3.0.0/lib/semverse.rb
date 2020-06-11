module Semverse
  require_relative 'semverse/errors'
  require_relative 'semverse/gem_version'
  require_relative 'semverse/version'
  require_relative 'semverse/constraint'

  DEFAULT_CONSTRAINT = Semverse::Constraint.new('>= 0.0.0').freeze
end
