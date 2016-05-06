# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'functional/helper'

describe 'inspec exec' do
  include FunctionalHelper

  it 'can execute the profile' do
    out = inspec('exec ' + example_profile)
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    out.stdout.must_match /^Pending: /
    out.stdout.must_include '5 examples, 0 failures, 1 pending'
  end

  it 'executes only specified controls' do
    out = inspec('exec ' + example_profile + ' --controls tmp-1.0')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    out.stdout.must_include '1 example, 0 failures'
  end

  it 'can execute the profile with the mini json formatter' do
    out = inspec('exec ' + example_profile + ' --format json-min')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    JSON.load(out.stdout).must_be_kind_of Hash
  end

  it 'can execute a simple file with the default formatter' do
    out = inspec('exec ' + example_control)
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    out.stdout.must_include '2 examples, 0 failures'
  end

  it 'can execute a simple file with the mini json formatter' do
    out = inspec('exec ' + example_control + ' --format json-min')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    JSON.load(out.stdout).must_be_kind_of Hash
  end

  describe 'execute a profile with mini json formatting' do
    let(:json) { JSON.load(inspec('exec ' + example_profile + ' --format json-min').stdout) }
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

  describe 'with a profile that is not supported on this OS/platform' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'skippy-profile-os')) }
    let(:json) { JSON.load(out.stdout) }

    it 'exits with an error' do
      out.stderr.must_match /^This OS\/platform \(.+\) is not supported by this profile.$/
      out.exit_status.must_equal 1
    end
  end

  describe 'with a profile that is supported on this version of inspec' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'supported_inspec')) }

    it 'exits cleanly' do
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
    end
  end

  describe 'with a profile that is not supported on this version of inspec' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'unsupported_inspec')) }

    it 'does not support this profile' do
      out.exit_status.must_equal 1
      out.stderr.must_equal "This profile requires InSpec version >= 99.0.0. You are running InSpec v#{Inspec::VERSION}.\n"
    end
  end
end
