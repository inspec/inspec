# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'functional/helper'

describe 'inspec exec' do
  include FunctionalHelper

  it 'can execute the profile with the mini json formatter' do
    out = inspec('exec --no-write-lockfile ' + example_profile + ' --format json-min')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    JSON.load(out.stdout).must_be_kind_of Hash
  end

  it 'can execute a simple file with the mini json formatter' do
    out = inspec('exec --no-write-lockfile ' + example_control + ' --format json-min')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    JSON.load(out.stdout).must_be_kind_of Hash
  end

  describe 'execute a profile with mini json formatting' do
    let(:json) { JSON.load(inspec('exec --no-write-lockfile ' + example_profile + ' --format json-min').stdout) }
    let(:controls) { json['controls'] }
    let(:ex1) { controls.find{|x| x['id'] == 'tmp-1.0'} }
    let(:ex2) { controls.find{|x| x['id'] =~ /generated/} }
    let(:ex3) { controls.find{|x| x['id'] == 'gordon-1.0'} }

    it 'must have 5 examples' do
      json['controls'].length.must_equal 5
    end

    it 'has an id' do
      controls.find { |ex| !ex.key? 'id' }.must_be :nil?
    end

    it 'has a profile_id' do
      controls.find { |ex| !ex.key? 'profile_id' }.must_be :nil?
    end

    it 'has a code_desc' do
      ex1['code_desc'].must_equal 'File /tmp should be directory'
      controls.find { |ex| !ex.key? 'code_desc' }.must_be :nil?
    end

    it 'has a status' do
      ex1['status'].must_equal 'passed'
      ex3['status'].must_equal 'skipped'
    end

    it 'has a skip_message' do
      ex1['skip_message'].must_be :nil?
      ex3['skip_message'].must_equal "Can't find file \"/tmp/gordon/config.yaml\""
    end
  end

end
