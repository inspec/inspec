require 'helper'
require 'inspec/errors'
require 'inspec/dependencies/resolver'

class FakeDep
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def resolved_source
    { path: name }
  end
end

describe Inspec::Resolver do
  let(:subject) { Inspec::Resolver.new }

  describe "#resolve" do
    it "returns a Hash" do
      subject.resolve([]).must_equal({})
    end

    it "errors if the source version doesn't match the requirement" do
      dep = FakeDep.new("fake_dep_0")
      dep.expects(:source_satisfies_spec?).returns(false)
      dep.expects(:source_version).returns("1.0.0")
      dep.expects(:required_version).returns(">= 1.0.1")
      lambda { subject.resolve([dep]) }.must_raise Inspec::UnsatisfiedVersionSpecification
    end
  end
end
