# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved

class VulcanoRule
  include Serverspec::Helper::Type
  extend Serverspec::Helper::Type
  include RSpec::Core::DSL

  def initialize(id, &block)
    @id = id
    @impact = 1.0
    @title = id
    @desc = ""

    self.instance_eval(&block)
  end

  def impact(v = nil)
    @impact = v unless v.nil?
    @impact
  end

  def title(v = nil)
    @title = v unless v.nil?
    @title
  end

  def desc(v = nil)
    @desc = v unless v.nil?
    @desc
  end

  def describe(sth, &block)
    r = VulcanoRule.describe(sth, &block)
    r.examples.each {|ex|
      ex.metadata[:id] = @id
    }
  end

  def method_missing(m, *a, &b)
    VulcanoRule.__send__(m, *a, &b)
  end
end

def rule id, &block
  VulcanoRule.new(id, &block)
end
