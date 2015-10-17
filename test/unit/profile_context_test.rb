# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'
require 'vulcano/profile_context'

describe Vulcano::ProfileContext do
  let(:backend) { MockLoader.new.backend }
  let(:profile) { Vulcano::ProfileContext.new(nil, backend) }

  it 'must be able to load empty content' do
    profile.load('', 'dummy', 1).must_be_nil
  end

  describe 'its default DSL' do
    def load(call)
      proc { profile.load(call) }
    end

    it 'must provide os resource' do
      load('print os[:family]').must_output 'ubuntu'
    end

    it 'must profide file resource' do
      load('print file("").type').must_output 'unknown'
    end

    it 'must profide command resource' do
      load('print command("").stdout').must_output ''
    end

    it 'provides the describe keywords' do
      load('describe true do; it { should_eq true }; end')
        .must_output ''
      profile.rules.keys.must_equal ['unknown:1']
      profile.rules.values[0].must_be_kind_of Vulcano::Rule
    end
  end
end
