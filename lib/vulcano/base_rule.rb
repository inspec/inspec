# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved

class VulcanoBaseRule
  def initialize(id, &block)
    @id = id
    @impact = 1.0
    @title = id
    @desc = ""

    self.instance_eval(&block)
  end

  def id(v = nil)
    # never overwrite the ID
    @id
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
end
