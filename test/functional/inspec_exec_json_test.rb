# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'functional/helper'
require 'jsonschema'

describe 'inspec exec with json formatter' do
  include FunctionalHelper

  it 'can execute a simple file and validate the json schema' do
    out = inspec('exec ' + example_control + ' --reporter json --no-create-lockfile')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    data = JSON.parse(out.stdout)
    sout = inspec('schema exec-json')
    schema = JSON.parse(sout.stdout)
    JSON::Schema.validate(data, schema)
  end

  it 'can execute a profile and validate the json schema' do
    out = inspec('exec ' + example_profile + ' --reporter json --no-create-lockfile')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    data = JSON.parse(out.stdout)
    sout = inspec('schema exec-json')
    schema = JSON.parse(sout.stdout)
    JSON::Schema.validate(data, schema)
  end

  describe 'execute a profile with json formatting' do
    let(:json) { JSON.load(inspec('exec ' + example_profile + ' --reporter json --no-create-lockfile').stdout) }
    let(:profile) { json['profiles'][0] }
    let(:controls) { profile['controls'] }
    let(:ex1) { controls.find { |x| x['id'] == 'tmp-1.0' } }
    let(:ex2) { controls.find { |x| x['id'] =~ /generated/ } }
    let(:ex3) { profile['controls'].find { |x| x['id'] == 'gordon-1.0' } }
    let(:check_result) {
      ex3['results'].find { |x| x['resource'] == 'gordon_config' }
    }

    it 'has only one profile' do
      json['profiles'].must_be_kind_of(Array)
      json['profiles'].length.must_equal 1
    end

    it 'has all the metadata' do
      actual = profile.dup
      key = actual.delete('controls')
                  .find { |x| x['id'] =~ /generated from example.rb/ }['id']
      groups = actual.delete('groups')
      actual.must_equal({
        "name" => "profile",
        "title" => "InSpec Example Profile",
        "maintainer" => "Chef Software, Inc.",
        "copyright" => "Chef Software, Inc.",
        "copyright_email" => "support@chef.io",
        "license" => "Apache-2.0",
        "summary" => "Demonstrates the use of InSpec Compliance Profile",
        "version" => "1.0.0",
        "sha256" => "8eed5154c9fa0174067ab475c0ad4a053f772590d129eb324101fe43ef30794d",
        "supports" => [{"os-family" => "unix"}],
        "attributes" => []
      })

      groups.sort_by { |x| x['id'] }.must_equal([
        {"id"=>"controls/example.rb", "title"=>"/tmp profile", "controls"=>["tmp-1.0", key]},
        {"id"=>"controls/gordon.rb", "title"=>"Gordon Config Checks", "controls"=>["gordon-1.0"]},
        {"id"=>"controls/meta.rb", "title"=>"SSH Server Configuration", "controls"=>["ssh-1"]},
      ])
    end

    it 'must have 4 controls' do
      controls.length.must_equal 4
    end

    it 'has an id for every control' do
      controls.find { |x| x['id'].nil? }.must_be :nil?
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
      src['line'].must_equal 7

      result = actual.delete('results')[0]
      result.wont_be :nil?
      result['status'].must_equal 'passed'
      result['code_desc'].must_equal 'File /tmp should be directory'
      result['run_time'].wont_be :nil?
      result['start_time'].wont_be :nil?

      actual.must_equal({
        "id" => "tmp-1.0",
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
  end

  describe 'with a profile that is not supported on this OS/platform' do
    let(:out) { inspec('exec ' + File.join(profile_path, 'skippy-profile-os') + ' --reporter json --no-create-lockfile') }
    let(:json) { JSON.load(out.stdout) }

    # TODO: failure handling in json formatters...

    it 'never runs the actual resource' do
      File.exist?('/tmp/inspec_test_DONT_CREATE').must_equal false
    end
  end
end
