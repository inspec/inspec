# encoding: utf-8

module Inspec
  module RubyHelper
    def ruby_qualifier(q)
      if q.length <= 1
        q[0]
      elsif q[0] == 'map' && q.length == 2
        q[0] + ' ' + q[1]
      else
        q[0] + '(' + q[1..-1].map(&:inspect).join(', ') + ')'
      end
    end
  end
end
