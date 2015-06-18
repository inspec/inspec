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

  def self.registry
    @rules ||= {}
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
  existing = VulcanoRule.registry[id]
  if existing.nil?
    VulcanoRule.registry[id] = VulcanoRule.new(id, &block)
  else
    # TODO: alter existing rule
  end
end


def include_rules id
  base_path = '/etc/vulcanosec/tests'
  path = File.join( base_path, id )
  # find all files to be included
  files = []
  if File::directory? path
    # include all library paths, if they exist
    libdir = File::join(path, 'lib')
    if File::directory? libdir and !$LOAD_PATH.include?(libdir)
      $LOAD_PATH.unshift(libdir)
    end
    files = Dir[File.join(path, 'spec','*_spec.rb')]
  end
  # include all files
  files.each do |file|
    eval(File::read(file))
  end
end