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

    it 'provides the describe keyword in the global DSL' do
      load('describe true do; it { should_eq true }; end')
        .must_output ''
      profile.rules.keys.must_equal ['unknown:1']
      profile.rules.values[0].must_be_kind_of Vulcano::Rule
    end

    it 'does not provide the expect keyword in the global DLS' do
      load('expect(true).to_eq true').must_raise NoMethodError
    end

    it 'provides the rule keyword in the global DSL' do
      profile.load('rule 1')
      profile.rules.keys.must_equal [1]
      profile.rules.values[0].must_be_kind_of Vulcano::Rule
    end
  end

  describe 'rule DSL' do
    let(:rule_id) { rand.to_s }

    it 'doesnt add any checks if none are provided' do
      profile.load("rule #{rule_id.inspect}")
      rule = profile.rules[rule_id]
      rule.instance_variable_get(:@checks).must_equal([])
    end

    describe 'adds a check via describe' do
      let(:cmd) {<<-EOF
        rule #{rule_id.inspect} do
          describe os[:family] { it { must_equal 'ubuntu' } }
        end
      EOF
      }
      let(:check) {
        profile.load(cmd)
        rule = profile.rules[rule_id]
        rule.instance_variable_get(:@checks)[0]
      }

      it 'registers the check with describe' do
        check[0].must_equal 'describe'
      end

      it 'registers the check with the describe argument' do
        check[1].must_equal %w{ubuntu}
      end

      it 'registers the check with the provided proc' do
        check[2].must_be_kind_of Proc
      end
    end
  end
end
