# encoding: utf-8
# author: Steven Danna

require 'helper'
require 'rspec/core'
require 'inspec/control_eval_context'

describe Inspec::ControlEvalContext do
  module FakeDSL
    def foobar
      "wombat"
    end
  end
  Inspec::Log.level = :debug

  let(:control_content) { <<EOF
control 'foo' do
  describe foobar do
  end
end

control 'bar' do
  describe "wombat" do
    it { should_equal foobar }
  end
end
EOF
  }

  let(:resource_dsl) { FakeDSL }
  let(:backend) { mock() }
  let(:profile_context) { Inspec::ProfileContext.new('test-profile', backend, {}) }
  let(:eval_context) do
    c = Inspec::ControlEvalContext.create(profile_context, resource_dsl)
    # A lot of mocking here :(
    c.new(backend, mock(), mock(), mock())
  end

  it 'accepts a context and a resource_dsl' do
    Inspec::ControlEvalContext.create(profile_context, resource_dsl)
  end

  it 'provides rules with access to the given DSL' do
    profile_context.stubs(:current_load).returns({file: "<test content>"})
    eval_context.instance_eval(control_content)
    profile_context.all_rules.each do |rule|
      # Turn each rule into an example group and run it, none of the example content should raise an
      # exception
      Inspec::Rule.prepare_checks(rule).each do |m, a, b|
        RSpec::Core::ExampleGroup.describe(*a, &b).run
      end
    end
  end
end
