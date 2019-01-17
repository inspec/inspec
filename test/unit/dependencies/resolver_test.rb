require "helper"
require "inspec/errors"
require "inspec/dependencies/resolver"

class FakeDep
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def resolved_source
    { path: name }
  end

  def source_satisfies_spec?
    true
  end
end

describe Inspec::Resolver do
  let(:subject) { Inspec::Resolver.new }

  describe "#resolve" do
    it "returns a Hash" do
      subject.resolve([]).must_equal({})
    end

    it "errors if a dependency is listed twice at the same level" do
      dep = FakeDep.new("fake_dep_0")
      lambda { subject.resolve([dep, dep]) }.must_raise Inspec::DuplicateDep
    end

    it "fails if there is a simple cycle " do
      dep0 = FakeDep.new("fake_dep_0")
      dep1 = FakeDep.new("fake_dep_1")
      dep2 = FakeDep.new("fake_dep_2")

      dep0.stubs(:dependencies).returns([dep1])

      dep1.stubs(:dependencies).returns([dep2])
      dep2.stubs(:dependencies).returns([dep1])
      lambda { subject.resolve([dep0]) }.must_raise Inspec::CyclicDependencyError
    end

    it "errors if the source version doesn't match the requirement" do
      dep = FakeDep.new("fake_dep_0")
      dep.expects(:source_satisfies_spec?).returns(false)
      dep.expects(:source_version).returns("1.0.0")
      dep.expects(:version_constraints).returns([">= 1.0.1"])
      lambda { subject.resolve([dep]) }.must_raise Inspec::UnsatisfiedVersionSpecification
    end
  end
end
