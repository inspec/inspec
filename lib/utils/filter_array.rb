# encoding: utf-8
# copyright: 2015, Chef Software, Inc.
# license: All rights reserved
# author: Stephan Renatus

class FilterArray
  attr_accessor :rules
  alias content rules

  def initialize(rules)
    @rules = rules
  end

  # allows for chaining
  # .field('arch', 'b32').field('key', 'access').rules
  def field(key, value = nil)
    if value
      res = rules.find_all { |r| r[key.to_sym] == value }
      FilterArray.new(res)
    else
      rules.map { |h| h[key.to_sym] }.uniq
    end
  end

  def method_missing(meth, *args)
    field(meth, args[0])
  end
end
