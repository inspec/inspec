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
      r = Rule.describe(sth, &block)
      set_rspec_ids(r)
    end

    # redirect all regular method calls to the
    # core DSL (which is attached to the class)
    def method_missing(m, *a, &b)
      VulcanoRule.__send__(m, *a, &b)
    end

    def self.registry
      @rules ||= {}
    end

    private

    # Attach an ID attribute to the
    # metadata of all examples
    # TODO: remove this once IDs are in rspec-core
    def set_rspec_ids(obj)
      obj.examples.each {|ex|
        ex.metadata[:id] = @id
      }
      obj.children.each {|c|
        set_rspec_ids(c)
      }
    end
  end
end

  # class Rule < ::Vulcano::Rule
  #   def describe(sth, &block)
  #     @examples ||= []
  #     @examples.push([sth, block])
  #   end
  # end


module Vulcano::DSL

  def rule id, &block
    existing = Vulcano::Rule.registry[id]
    if existing.nil?
      Vulcano::Rule.registry[id] = Vulcano::Rule.new(id, &block)
    else
      p "RULE #{id} was found: #{existing}"
      # TODO: alter existing rule
    end
  end

  def require_rules id, &block
    files = get_spec_files_for_profile id
  end

  def include_rules id, &block
    files = get_spec_files_for_profile id
    # files.each do |file|
    #   eval(File::read(file), file, 1)
    # end
  end

  private

  def get_spec_files_for_profile id
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

module Vulcano::DSLHelper
  def self.bind_dsl(scope)
    (class << scope; self; end).class_exec do
      include Vulcano::DSL
    end
  end
end

::Vulcano::DSLHelper.bind_dsl(self)
