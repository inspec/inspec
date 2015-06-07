# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved
require 'vulcano/base_rule'

class VulcanoRule < VulcanoBaseRule
  include Serverspec::Helper::Type
  extend Serverspec::Helper::Type
  include RSpec::Core::DSL

  def describe(sth, &block)
    r = VulcanoRule.describe(sth, &block)
    set_rspec_ids(r)
  end

  def method_missing(m, *a, &b)
    VulcanoRule.__send__(m, *a, &b)
  end

  private

  def set_rspec_ids(obj)
    obj.examples.each {|ex|
      ex.metadata[:id] = @id
    }
    obj.children.each {|c|
      set_rspec_ids(c)
    }
  end
end

def rule id, &block
  VulcanoRule.new(id, &block)
end
