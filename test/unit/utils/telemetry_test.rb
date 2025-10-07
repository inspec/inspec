require_relative "../../helper"
require_relative "../../../lib/inspec/utils/telemetry"
require_relative "../../../lib/inspec/runner"

module Inspec
  class Telemetry::Mock < Telemetry::Base
    attr_reader :run_ending_payload
    def run_ending(opts)
      @run_ending_payload = super(opts)
    end
  end
end

REGEX = {
  version: /^(\d+|\d+\.\d+|\d+\.\d+\.\d+)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$/,
  datetime: /^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2}(?:\.\d*)?)((-(\d{2}):(\d{2})|Z)?)$/,
  uuid: /^[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}$/,
  transport: /^[a-z0-9\-\_]+$/,
  sha256: /^[0-9a-fA-F]{64}|unknown$/,
}.freeze

describe "Telemetry" do
  let(:conf) { Inspec::Config.new({ "enable_telemetry" => false }) }
  let(:runner) { Inspec::Runner.new({ command_runner: :generic, reporter: [], conf: conf }) }
  let(:run_data) { JSON.parse(File.read("test/fixtures/reporters/run_data_test_profile_a.json"), symbolize_names: true) }
  let(:repo_path) { File.expand_path("../../..", __dir__) }
  let(:mock_path) { File.join(repo_path, "test", "fixtures") }
  let(:valid_client_api_data) { File.read("#{repo_path}/test/fixtures/valid_client_api_data.json") }
  let(:profile_path) { File.join(mock_path, "profiles") }
  let(:profile) { File.join(profile_path, "dependencies", "profile_a") }
  let(:tm) { Inspec::Telemetry::Mock.new }
  let(:chef_license_key) { "free-42727540-ddc8-4d4b-0000-80662e03cd73-0000" }

  before do
    stub_request(:get, "#{ChefLicensing::Config.license_server_url}/v1/listLicenses")
      .to_return(
        body: {
          "data": [chef_license_key],
          "message": "",
          "status_code": 200,
        }.to_json,
        headers: { content_type: "application/json" }
      )

    stub_request(:get, "#{ChefLicensing::Config.license_server_url}/v1/client")
      .with(query: { licenseId: chef_license_key, entitlementId: ChefLicensing::Config.chef_entitlement_id })
      .to_return(
        body: valid_client_api_data ,
        headers: { content_type: "application/json" }
      )

    stub_request(:get, "#{ChefLicensing::Config.license_server_url}/v1/client")
      .with(query: { licenseId: [chef_license_key, ENV["CHEF_LICENSE_KEY"]].join(","), entitlementId: ChefLicensing::Config.chef_entitlement_id })
      .to_return(
        body: valid_client_api_data ,
        headers: { content_type: "application/json" }
      )

    stub_request(:get, "#{ChefLicensing::Config.license_server_url}/v1/client")
      .with(query: { licenseId: [ENV["CHEF_LICENSE_KEY"], chef_license_key].join(","), entitlementId: ChefLicensing::Config.chef_entitlement_id })
      .to_return(
        body: valid_client_api_data ,
        headers: { content_type: "application/json" }
      )
  end

  describe "when it runs with a nested profile" do
    it "sets the wrapper fields" do
      ChefLicensing::Context.license = ChefLicensing.client(license_keys: [chef_license_key])
      Inspec::Telemetry.expects(:instance).returns(tm).at_least_once
      Inspec::Telemetry.run_ending(runner: runner, run_data: run_data, conf: conf)
      runner.add_target(profile)
      runner.run
      _(tm.run_ending_payload).wont_be_empty
      _(tm.run_ending_payload).must_be_kind_of Hash
      _(tm.run_ending_payload[:source]).must_match(/^inspec:\d+\.\d+\.\d+$/)
      _(tm.run_ending_payload[:licenseIds]).wont_be_empty
      _(tm.run_ending_payload[:createdTimeUTC]).must_match(REGEX[:datetime])
      _(tm.run_ending_payload[:type]).must_match(/^job$/)
    end

    it "sets the job fields" do
      ChefLicensing::Context.license = ChefLicensing.client(license_keys: [chef_license_key])
      Inspec::Telemetry.expects(:instance).returns(tm).at_least_once
      Inspec::Telemetry.run_ending(runner: runner, run_data: run_data, conf: conf)
      runner.add_target(profile)
      runner.run
      j = tm.run_ending_payload[:jobs][0]
      _(j).wont_be_empty
      _(j).must_be_kind_of Hash
      _(j[:type]).must_equal("InSpec")

      _(j[:environment][:host]).must_match(/^\S+$/)
      _(j[:environment][:os]).must_match(/^\S+$/)
      _(j[:environment][:version]).must_match(REGEX[:version]) # looser version matching
      _(j[:environment][:architecture]).wont_be_empty
      _(j[:environment][:id]).must_match(REGEX[:uuid])

      _(j[:content]).must_be_kind_of Array
      _(j[:content].count).must_equal 2
      j[:content].each do |c|
        _(c[:name]).wont_be_empty
        _(c[:version]).must_match(REGEX[:version])
        _(c[:sha256]).must_match(REGEX[:sha256])
        _(c[:maintainer]).wont_be_empty
      end

      _(j[:steps]).must_be_kind_of Array
      _(j[:steps].count).must_equal 4
      j[:steps].each do |s|
        _(s[:name]).must_equal "inspec-control"
        _(s[:id]).must_match(REGEX[:sha256])
        _(s[:resources]).must_be_kind_of Array
        _(s[:features]).wont_be_empty
        _(s[:tags]).wont_be_empty
        s[:resources].each do |r|
          _(r[:type]).must_equal "inspec-resource"
          _(r[:name]).wont_be_empty
          _(r[:id]).must_match(REGEX[:sha256])
        end
      end
    end
  end

  describe "telemetry opt-out for CINC users" do
    describe "telemetry_disabled_by_cli?" do
      it "returns true when disable_telemetry option is set to true" do
        conf = Inspec::Config.new({ "disable_telemetry" => true })
        Inspec::Telemetry.class_variable_set(:@@config, conf)
        _(Inspec::Telemetry.telemetry_disabled_by_cli?).must_equal true
      end

      it "returns false when disable_telemetry option is not set" do
        conf = Inspec::Config.new({})
        Inspec::Telemetry.class_variable_set(:@@config, conf)
        _(Inspec::Telemetry.telemetry_disabled_by_cli?).must_equal false
      end

      it "returns false when disable_telemetry option is set to false" do
        conf = Inspec::Config.new({ "disable_telemetry" => false })
        Inspec::Telemetry.class_variable_set(:@@config, conf)
        _(Inspec::Telemetry.telemetry_disabled_by_cli?).must_equal false
      end
    end

    describe "cinc_user?" do
      it "returns true when EXEC_NAME is not 'inspec'" do
        original_exec_name = Inspec::Dist::EXEC_NAME
        Inspec::Dist.const_set(:EXEC_NAME, "cinc-auditor")
        _(Inspec::Telemetry.cinc_user?).must_equal true
        Inspec::Dist.const_set(:EXEC_NAME, original_exec_name)
      end

      it "returns false when EXEC_NAME is 'inspec'" do
        original_exec_name = Inspec::Dist::EXEC_NAME
        Inspec::Dist.const_set(:EXEC_NAME, "inspec")
        _(Inspec::Telemetry.cinc_user?).must_equal false
        Inspec::Dist.const_set(:EXEC_NAME, original_exec_name)
      end
    end

    describe "determine_backend_class with disable_telemetry option" do
      before do
        # Reset class variables to ensure clean state
        Inspec::Telemetry.class_variable_set(:@@instance, nil)
      end

      it "returns Null backend for CINC users with --disable-telemetry" do
        original_exec_name = Inspec::Dist::EXEC_NAME

        # Mock CINC user (non-inspec executable)
        Inspec::Dist.const_set(:EXEC_NAME, "cinc-auditor")
        conf = Inspec::Config.new({ "disable_telemetry" => true })
        Inspec::Telemetry.class_variable_set(:@@config, conf)

        # Mock the dependencies to avoid actual API calls
        Inspec::Telemetry::RunContextProbe.stubs(:under_automate?).returns(false)
        Inspec::Telemetry::RunContextProbe.stubs(:guess_run_context).returns("cli")
        Inspec::Telemetry.stubs(:license).returns(nil)

        backend_class = Inspec::Telemetry.determine_backend_class
        _(backend_class).must_equal Inspec::Telemetry::Null

        # Restore original value
        Inspec::Dist.const_set(:EXEC_NAME, original_exec_name)
      end

      it "returns HTTP backend for Chef InSpec users with --disable-telemetry and logs warning" do
        original_exec_name = Inspec::Dist::EXEC_NAME

        # Mock Chef InSpec user
        Inspec::Dist.const_set(:EXEC_NAME, "inspec")
        conf = Inspec::Config.new({ "disable_telemetry" => true })
        Inspec::Telemetry.class_variable_set(:@@config, conf)

        # Mock the dependencies to avoid actual API calls
        Inspec::Telemetry::RunContextProbe.stubs(:under_automate?).returns(false)
        Inspec::Telemetry::RunContextProbe.stubs(:guess_run_context).returns("cli")
        Inspec::Telemetry.stubs(:license).returns(nil)

        # Capture log messages
        log_output = capture_io do
          backend_class = Inspec::Telemetry.determine_backend_class
          _(backend_class).must_equal Inspec::Telemetry::HTTP
        end

        # Restore original value
        Inspec::Dist.const_set(:EXEC_NAME, original_exec_name)
      end
    end
  end
end
