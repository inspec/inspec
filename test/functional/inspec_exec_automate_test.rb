
require 'functional/helper'
require 'tempfile'

describe 'inspec exec automate' do
  include FunctionalHelper

  let(:config_path) do
    file = Tempfile.new('config.json')
    file.write(config_data)
    file.close
    file.path
  end

  let(:invocation) do
    cmd = 'exec '
    cmd += example_profile + ' '
    cmd += '--config ' + config_path
  end

  let(:run_result) { run_inspec_process(invocation) }

  describe 'when the the URL is fake' do
    let(:config_data) do
      data = <<~EOF
      {
      "reporter": {
          "automate" : {
              "stdout" : false,
              "url" : "https://fake_url_a2.com/data-collector/v0/",
              "token" : "faketoken123",
              "insecure" : true,
              "node_uuid" : "test123"
              }
          }
      }
      EOF
    end

    it 'should fail' do
      run_result.stderr.must_equal "Error generating reporter 'automate'\n"
      run_result.exit_status.must_equal 1
      run_result.stdout.must_include "ERROR: send_report: POST to /data-collector/v0/"
    end
  end

  describe 'when outputting to $stdout' do
    let(:config_data) do
      data = <<~EOF
      {
        "reporter": {
          "json-automate" : {
            "stdout" : true,
            "job_uuid" : "test123",
            "roles" : ["stuff"],
            "environment": "prod",
            "node_name": "some_node",
            "passthrough": {
              "projects": ["alpha", "beta"],
              "another_tramp_datum": "another_value"
            }
          }
        }
      }
      EOF
    end

    it 'should include tramp data' do
      run_result.stderr.must_equal ''
      run_result.exit_status.wont_equal 1

      # Can't use json-mode on run_inspec_process - it sets
      # the reporter to be 'json', we need 'json-automate'
      json = JSON.parse(run_result.stdout)

      # As of InSpec v3.7.11, these are all top-level tramp data:
      [
        'node_name',
        'job_uuid',
        'environment',
        'roles',
      ].each do |field|
        json.keys.must_include field
      end

      # As of InSpec v3.7.11+, these should be removed:
      [
        'recipies', # sic
      ].each do |field|
        json.keys.wont_include field
      end

      # Added in InSpec v3.7.11+
      json.keys.must_include 'passthrough'
      json['passthrough'].keys.sort.must_equal ['another_tramp_datum', 'projects']
      json['passthrough']['projects'].must_equal ['alpha', 'beta']

    end
  end
end
