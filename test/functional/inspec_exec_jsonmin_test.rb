require 'functional/helper'
require 'jsonschema'

describe 'inspec exec' do
  include FunctionalHelper

  it 'can execute a profile with the mini json formatter and validate its schema' do
    out = inspec('exec ' + example_profile + ' --reporter json-min --no-create-lockfile')
    out.stderr.must_equal ''
    out.exit_status.must_equal 101
    data = JSON.parse(out.stdout)
    sout = inspec('schema exec-jsonmin')
    schema = JSON.parse(sout.stdout)
    JSON::Schema.validate(data, schema)
  end

  it 'can execute a simple file with the mini json formatter and validate its schema' do
    out = inspec('exec ' + example_control + ' --reporter json-min --no-create-lockfile')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    data = JSON.parse(out.stdout)
    sout = inspec('schema exec-jsonmin')
    schema = JSON.parse(sout.stdout)
    JSON::Schema.validate(data, schema)
  end

  it 'does not contain any dupilcate results with describe.one' do
    out = inspec("shell -c 'describe.one do describe 1 do it { should cmp 2 } end end' --reporter=json-min")
    out.stderr.must_equal ''
    data = JSON.parse(out.stdout)
    data['controls'].length.must_equal 1
    data['controls'][0]['message'].must_equal "\nexpected: 2\n     got: 1\n\n(compared using `cmp` matcher)\n"
  end

  describe 'execute a profile with mini json formatting' do
    let(:json) { JSON.load(inspec('exec ' + example_profile + ' --reporter json-min --no-create-lockfile').stdout) }
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
      ex3['skip_message'].must_equal "Can't find file `/tmp/gordon/config.yaml`"
    end
  end

end
