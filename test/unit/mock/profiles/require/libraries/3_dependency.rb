# encoding: utf-8

require '2_sec_level_dep'

module Dependency
  def self.dep_method
    ::Dependency::RESULT[:a]
  end
end
