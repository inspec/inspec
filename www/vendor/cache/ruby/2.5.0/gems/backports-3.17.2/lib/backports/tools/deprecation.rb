module Backports
  class << self
    attr_accessor :warned # private
    Backports.warned = {}

    def frown_upon kind, msg
      warn kind, msg if $VERBOSE
    end

    def warn kind, msg
      return if warned[kind]
      super msg
      warned[kind] = msg
    end

    alias_method :deprecate, :warn

  end
end
