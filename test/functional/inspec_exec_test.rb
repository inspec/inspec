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

  it 'can execute the profile with the json formatter' do
    out = inspec('exec ' + example_profile + ' --format json')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    JSON.load(out.stdout).must_be_kind_of Hash
  end

  let(:example_control) { File.join(example_profile, 'controls', 'example.rb') }

  it 'can execute a simple file with the default formatter' do
    out = inspec('exec ' + example_control)
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    out.stdout.must_include '2 examples, 0 failures'
  end

  it 'can execute a simple file with the json formatter' do
    out = inspec('exec ' + example_control + ' --format json')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    JSON.load(out.stdout).must_be_kind_of Hash
  end

  it 'can execute a simple file with the fulljson formatter' do
    out = inspec('exec ' + example_control + ' --format fulljson')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    JSON.load(out.stdout).must_be_kind_of Hash
  end

  describe 'execute a profile with json formatting' do
    let(:json) { JSON.load(inspec('exec ' + example_profile + ' --format json').stdout) }
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

  it 'can execute the profile with the fulljson formatter' do
    out = inspec('exec ' + example_profile + ' --format fulljson')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    JSON.load(out.stdout).must_be_kind_of Hash
  end

  describe 'execute a profile with fulljson formatting' do
    let(:json) { JSON.load(inspec('exec ' + example_profile + ' --format fulljson').stdout) }
    let(:profile) { json['profiles']['profile'] }
    let(:controls) { profile['controls'] }
    let(:ex1) { controls['tmp-1.0'] }
    let(:ex2) {
      k = controls.keys.find { |x| x =~ /generated/ }
      controls[k]
    }
    let(:ex3) { controls['gordon-1.0'] }
    let(:check_result) { ex1['results'][0] }

    it 'has all the metadata' do
      controls = profile.delete('controls')
      key = controls.keys.find { |x| x =~ /generated from example.rb/ }

      profile.must_equal({
        "name" => "profile",
        "title" => "InSpec Example Profile",
        "maintainer" => "Chef Software, Inc.",
        "copyright" => "Chef Software, Inc.",
        "copyright_email" => "support@chef.io",
        "license" => "Apache 2 license",
        "summary" => "Demonstrates the use of InSpec Compliance Profile",
        "version" => "1.0.0",
        "supports" => [{"os-family" => "unix"}],
        "groups" => {
          "controls/meta.rb" => {"title"=>"SSH Server Configuration", "controls"=>["ssh-1"]},
          "controls/example.rb" => {"title"=>"/tmp profile", "controls"=>["tmp-1.0", key]},
          "controls/gordon.rb" => {"title"=>"Gordon Config Checks", "controls"=>["gordon-1.0"]},
        },
      })
    end

    it 'must have 4 controls' do
      controls.length.must_equal 4
    end

    it 'has an id for every control' do
      controls.keys.find(&:nil?).must_be :nil?
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

    it 'source location in json' do
      ex1['source_location'][0].must_match %r{examples/profile/controls/example.rb$}
    end

    it 'source line in json' do
      ex1['source_location'][1].must_equal 8
    end

    it 'has all needed results' do
      ex1['results'].length.must_equal 1
      ex2['results'].length.must_equal 1
      ex3['results'].length.must_equal 2
    end

    it 'has a status in its check result' do
      check_result['status'].must_equal 'passed'
    end

    it 'has a code description in its check result' do
      check_result['code_desc'].must_equal 'File /tmp should be directory'
    end

    it 'has a run_time in its check result' do
      check_result['run_time'].must_be > 0
      check_result['run_time'].must_be < 1
    end

    it 'has a start_time in its check result' do
      check_result['start_time'].wont_be :nil?
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

  describe 'with a profile that is not supported on this OS/platform' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'skippy-profile-os') + ' --format fulljson') }
    let(:json) { JSON.load(out.stdout) }

    # TODO: failure handling in json formatters...

    it 'never runs the actual resource' do
      File.exist?('/tmp/inspec_test_DONT_CREATE').must_equal false
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
