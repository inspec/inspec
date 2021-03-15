require "functional/helper"
require "tempfile"

describe "inspec exec automate" do
  include FunctionalHelper

  let(:config_path) do
    @file = Tempfile.new("config.json")
    @file.write(config_data)
    @file.close
    @file.path
  end

  after do
    @file.unlink
  end

  let(:invocation) do
    "exec #{complete_profile} --config #{config_path}"
  end

  let(:run_result) { run_inspec_process(invocation) }

  describe "when the the URL is fake" do
    let(:config_data) do
      <<~END
        {
          "reporter": {
            "automate": {
            "stdout": false,
            "url": "https://fake_url_a2.com/data-collector/v0/",
            "token": "faketoken123",
            "insecure": true,
            "node_uuid": "test123"
            }
          }
        }
      END
    end

    it "should fail" do
      _(run_result.stderr).must_equal "Error generating reporter 'automate'\n"
      _(run_result.stdout).must_include "ERROR: send_report: POST to /data-collector/v0/"
      assert_exit_code 1, run_result
    end
  end

  describe "when outputting to $stdout" do
    let(:config_data) do
      <<~END
        {
          "reporter": {
            "json-automate": {
              "stdout": true,
              "job_uuid": "test123",
              "roles": ["stuff"],
              "environment": "prod",
              "passthrough": {
                "projects": ["alpha", "beta"],
                "another_tramp_datum": "another_value"
              },
              "node_name": "some_node"
            }
          }
        }
      END
    end

    it "should include tramp data" do
      _(run_result.stderr).must_equal ""

      # Can't use json-mode on run_inspec_process - it sets
      # the reporter to be 'json', we need 'json-automate'
      json = JSON.parse(run_result.stdout)

      # As of InSpec v3.7.11, these are all top-level tramp data:
      %w{
        node_name
        job_uuid
        environment
        passthrough
        roles
      }.each do |field|
        _(json.keys).must_include field
      end

      # As of InSpec v3.7.11+, these should be removed:
      [
        "recipies", # sic
      ].each do |field|
        _(json.keys).wont_include field
      end

      # Added in InSpec v3.7.11+
      _(json.keys).must_include "passthrough"
      _(json["passthrough"].keys.sort).must_equal %w{another_tramp_datum projects}
      _(json["passthrough"]["projects"]).must_equal %w{alpha beta}

      assert_exit_code 0, run_result
    end
  end
end
