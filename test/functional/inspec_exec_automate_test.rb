# encoding: utf-8

require 'functional/helper'
require 'tempfile'

describe 'inspec exec automate' do
  include FunctionalHelper

  let(:json_file) do
    file = Tempfile.new('json.conf')
    json = <<~EOF
    {
    "reporter": {
        "automate" : {
            "stdout" : false,
            "url" : "https://fake_url_a2.com/data-collector/v0/",
            "token" : "faketoken123",
            "insecure" : true
            }
        }
    }
    EOF

    file.write(json)
    file.close
    file.path
  end

  it 'fails when trying to send a report to a fake url' do
    out = inspec('exec ' + example_profile  + ' --no-create-lockfile --json-config ' + json_file)
    out.stderr.must_equal "Error generating reporter 'automate'\n"
    out.exit_status.must_equal 1
    stdout = out.stdout.force_encoding(Encoding::UTF_8)
    stdout.must_include "ERROR: send_report: POST to /data-collector/v0/"
  end
end
