# encoding: utf-8

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
    cmd += ' --no-create-lockfile '
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
end
