# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved
require 'vulcano/base_rule'

module Vulcano
  class Rule < VulcanoBaseRule
    include Serverspec::Helper::Type
    extend Serverspec::Helper::Type
    include RSpec::Core::DSL

    # Override RSpec methods to add
    # IDs to each example group
    # TODO: remove this once IDs are in rspec-core
    def describe(sth, &block)
      @checks ||= []
      @checks.push(['describe', [sth], block])
    end

    # redirect all regular method calls to the
    # core DSL (which is attached to the class)
    def method_missing(m, *a, &b)
      VulcanoRule.__send__(m, *a, &b)
    end

  end
end

module Vulcano::DSL
  def rule id, &block
    Vulcano::Rule.new(id, &block)
  end

  def require_rules id, &block
    files = ::Vulcano::DSL.get_spec_files_for_profile id
  end

  def include_rules id, &block
    files = ::Vulcano::DSL.get_spec_files_for_profile id
    # files.each do |file|
    #   eval(File::read(file), file, 1)
    # end
  end

  # Register a given rule with RSpec and
  # let it run. This happens after everything
  # else is merged in.
  def self.execute_rule r
    checks = r.instance_variable_get(:@checks)
    id = r.instance_variable_get(:@id)
    checks.each do |m,a,b|
      cres = ::Vulcano::Rule.__send__(m, *a, &b)
      if m=='describe'
        set_rspec_ids(cres, id)
      end
    end
  end

  private

  # Attach an ID attribute to the
  # metadata of all examples
  # TODO: remove this once IDs are in rspec-core
  def self.set_rspec_ids(obj, id)
    obj.examples.each {|ex|
      ex.metadata[:id] = id
    }
    obj.children.each {|c|
      self.set_rspec_ids(c, id)
    }
  end

  def self.get_spec_files_for_profile id
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
    return files
  end

end

module Vulcano::GlobalDSL
  def rule id, &block
    r = Vulcano::Rule.new(id, &block)
    ::Vulcano::DSL.execute_rule(r)
  end
end

module Vulcano::DSLHelper
  def self.bind_dsl(scope)
    (class << scope; self; end).class_exec do
      include Vulcano::DSL
      include Vulcano::GlobalDSL
    end
  end
end

::Vulcano::DSLHelper.bind_dsl(self)
