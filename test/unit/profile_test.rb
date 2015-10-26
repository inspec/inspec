# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'

def load_profile(name)
  pwd = File.dirname(__FILE__)
  Inspec::Profile.from_path("#{pwd}/mock/profiles/#{name}")
end

describe Inspec::Profile do
  before {
    # mock up the profile runner
    # TODO: try to take the real profile runner here;
    # currently it's stopped at test runner conflicts
    class Inspec::Profile::Runner
      def initialize(opts) end
      def add_tests(tests) end
      def rules
        {}
      end
    end
  }

  describe 'with empty profile' do
    let(:profile) { load_profile('empty') }

    it 'has no metadata' do
      profile.params[:name].must_be_nil
    end

    it 'has no rules' do
      profile.params[:rules].must_equal({})
    end
  end

  describe 'with normal metadata in profile' do
    let(:profile) { load_profile('metadata') }

    it 'has metadata' do
      profile.params[:name].must_equal 'metadata profile'
    end

    it 'has no rules' do
      profile.params[:rules].must_equal({})
    end
  end
end
