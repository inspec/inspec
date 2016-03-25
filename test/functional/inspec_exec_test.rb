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
    out.stdout.must_include '4 examples, 0 failures, 1 pending'
  end

  it 'executes only specified controls' do
    out = inspec('exec ' + example_profile + ' --controls tmp-1.0')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    out.stdout.must_include '1 example, 0 failures'
  end

  it 'can execute the profile with the json formatter' do
    out = inspec('exec ' + example_profile + ' --format json')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    JSON.load(out.stdout).must_be_kind_of Hash
  end

  describe 'execute a profile with json formatting' do
    let(:json) { JSON.load(inspec('exec ' + example_profile + ' --format json').stdout) }
    let(:examples) { json['examples'] }
    let(:ex1) { examples.find{|x| x['id'] == 'tmp-1.0'} }
    let(:ex2) { examples.find{|x| x['id'] =~ /generated/} }
    let(:ex3) { examples.find{|x| x['id'] == 'gordon-1.0'} }

    it 'must have 4 examples' do
      json['examples'].length.must_equal 4
    end

    it 'id in json' do
      examples.find { |ex| !ex.key? 'id' }.must_be :nil?
    end

    it 'impact in json' do
      ex1['impact'].must_equal 0.7
      ex2['impact'].must_be :nil?
    end

    it 'status in json' do
      ex1['status'].must_equal 'passed'
      ex3['status'].must_equal 'pending'
    end

    it 'pending message in json' do
      ex1['pending_message'].must_be :nil?
      ex3['pending_message'].must_equal 'Not yet implemented'
    end
  end

  describe 'execute a profile with fulljson formatting' do
    let(:json) { JSON.load(inspec('exec ' + example_profile + ' --format fulljson').stdout) }
    let(:examples) { json['examples'] }
    let(:metadata) { json['profiles'][0] }
    let(:ex1) { examples.find{|x| x['id'] == 'tmp-1.0'} }
    let(:ex2) { examples.find{|x| x['id'] =~ /generated/} }
    let(:ex3) { examples.find{|x| x['id'] == 'gordon-1.0'} }

    it 'has all the metadata' do
      metadata.must_equal({
        "name" => "profile",
        "title" => "InSpec Example Profile",
        "maintainer" => "Chef Software, Inc.",
        "copyright" => "Chef Software, Inc.",
        "copyright_email" => "support@chef.io",
        "license" => "Apache 2 license",
        "summary" => "Demonstrates the use of InSpec Compliance Profile",
        "version" => "1.0.0",
        "supports" => [{"os-family" => "unix"}]
      })
    end

    it 'must have 4 examples' do
      json['examples'].length.must_equal 4
    end

    it 'id in json' do
      examples.find { |ex| !ex.key? 'id' }.must_be :nil?
    end

    it 'title in json' do
      ex3['title'].must_equal 'Verify the version number of Gordon'
    end

    it 'desc in json' do
      ex3['desc'].must_equal 'An optional description...'
    end

    it 'code in json' do
      ex3['code'].wont_be :nil?
    end

    it 'code_desc in json' do
      ex3['code_desc'].wont_be :nil?
    end

    it 'impact in json' do
      ex1['impact'].must_equal 0.7
      ex2['impact'].must_be :nil?
    end

    it 'status in json' do
      ex1['status'].must_equal 'passed'
      ex3['status'].must_equal 'pending'
    end

    it 'ref in json' do
      ex1['ref'].must_match %r{examples/profile/controls/example.rb$}
    end

    it 'ref_line in json' do
      ex1['ref_line'].must_equal 14
    end

    it 'run_time in json' do
      ex1['run_time'].wont_be :nil?
    end

    it 'start_time in json' do
      ex1['start_time'].wont_be :nil?
    end

    it 'pending message in json' do
      ex1['pending'].must_be :nil?
      ex3['pending'].must_equal "Can't find file \"/tmp/gordon/config.yaml\""
    end
  end

end
