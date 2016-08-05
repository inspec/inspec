# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'functional/helper'

describe 'inspec exec with json formatter' do
  include FunctionalHelper

  it 'can execute a simple file with the json formatter' do
    out = inspec('exec ' + example_control + ' --format json')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    JSON.load(out.stdout).must_be_kind_of Hash
  end

  it 'can execute the profile with the json formatter' do
    out = inspec('exec ' + example_profile + ' --format json')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    JSON.load(out.stdout).must_be_kind_of Hash
  end

  describe 'execute a profile with json formatting' do
    let(:json) { JSON.load(inspec('exec ' + example_profile + ' --format json').stdout) }
    let(:control_summary) { json['control_summary'] }
    let(:profile) { json['profiles']['profile'] }
    let(:controls) { profile['controls'] }
    let(:ex1) { controls['tmp-1.0'] }
    let(:ex2) {
      k = controls.keys.find { |x| x =~ /generated/ }
      controls[k]
    }
    let(:ex3) { profile['controls']['gordon-1.0'] }
    let(:check_result) {
      ex3['results'].find { |x| x['resource'] == 'gordon_config' }
    }

    it 'has all the metadata' do
      actual = profile.dup
      key = actual.delete('controls').keys
                  .find { |x| x =~ /generated from example.rb/ }
      actual.must_equal({
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
        "attributes" => []
      })
    end

    it 'must have 4 controls' do
      controls.length.must_equal 4
      control_summary['total'].must_equal 4
    end

    it 'has an id for every control' do
      controls.keys.find(&:nil?).must_be :nil?
    end

    it 'has no missing checks' do
      json['other_checks'].must_equal([])
    end

    it 'has results for every control' do
      ex1['results'].length.must_equal 1
      ex2['results'].length.must_equal 1
      ex3['results'].length.must_equal 2
    end

    it 'has the right result for tmp-1.0' do
      actual = ex1.dup

      src = actual.delete('source_location')
      src['ref'].must_match %r{examples/profile/controls/example.rb$}
      src['line'].must_equal 8

      result = actual.delete('results')[0]
      result.wont_be :nil?
      result['status'].must_equal 'passed'
      result['code_desc'].must_equal 'File /tmp should be directory'
      result['run_time'].wont_be :nil?
      result['start_time'].wont_be :nil?

      actual.must_equal({
        "title" => "Create /tmp directory",
        "desc" => "An optional description...",
        "impact" => 0.7,
        "refs" => [
          {
            "url" => "http://...",
            "ref" => "Document A-12"
          }
        ],
        "tags" => {
          "data" => "temp data",
          "security" => nil
        },
        "code" => "control \"tmp-1.0\" do                        # A unique ID for this control\n  impact 0.7                                # The criticality, if this control fails.\n  title \"Create /tmp directory\"             # A human-readable title\n  desc \"An optional description...\"         # Describe why this is needed\n  tag data: \"temp data\"                     # A tag allows you to associate key information\n  tag \"security\"                            # to the test\n  ref \"Document A-12\", url: 'http://...'    # Additional references\n\n  describe file('/tmp') do                  # The actual test\n    it { should be_directory }\n  end\nend\n",
      })
    end

    it 'must report 3 passing controls' do
      control_summary['passed'].must_equal 3
    end
    it 'must report 1 skipped control' do
      control_summary['skipped'].must_equal 1
    end
  end

  describe 'with a profile that is not supported on this OS/platform' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'skippy-profile-os') + ' --format json') }
    let(:json) { JSON.load(out.stdout) }

    # TODO: failure handling in json formatters...

    it 'never runs the actual resource' do
      File.exist?('/tmp/inspec_test_DONT_CREATE').must_equal false
    end
  end
end
