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
  semver: /^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$/,
  datetime: /^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2}(?:\.\d*)?)((-(\d{2}):(\d{2})|Z)?)$/,
  uuid: /^[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}$/,
  transport: /^[a-z0-9\-\_]+$/,
  sha256: /^[0-9a-fA-F]{64}|unknown$/,
}.freeze

describe "Telemetry" do
  let(:runner) { Inspec::Runner.new({ command_runner: :generic, reporter: [] }) }
  let(:repo_path) { File.expand_path("../../..", __dir__) }
  let(:mock_path) { File.join(repo_path, "test", "fixtures") }
  let(:valid_list_licenses_api_response) { File.read("#{repo_path}/test/fixtures/valid_list_licenses_api_response.json") }
  let(:valid_client_api_data) { File.read("#{repo_path}/test/fixtures/valid_client_api_data.json") }
  let(:profile_path) { File.join(mock_path, "profiles") }

  before do
    stub_request(:get, "#{ChefLicensing::Config.license_server_url}/v1/listLicenses")
      .to_return(
        body: valid_list_licenses_api_response,
        headers: { content_type: "application/json" }
      )

    stub_request(:get, "#{ChefLicensing::Config.license_server_url}/v1/client")
      .with(query: { licenseId: "free-42727540-ddc8-4d4b-0000-80662e03cd73-0000", entitlementId: ChefLicensing::Config.chef_entitlement_id })
      .to_return(
        body: valid_client_api_data ,
        headers: { content_type: "application/json" }
      )
  end

  describe "when it runs with a nested profile" do
    let(:profile) { File.join(profile_path, "dependencies", "profile_a") }
    let(:tm) { Inspec::Telemetry::Mock.new }

    it "sets the wrapper fields" do
      Inspec::Telemetry.expects(:instance).returns(tm).at_least_once
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
      Inspec::Telemetry.expects(:instance).returns(tm).at_least_once
      runner.add_target(profile)
      runner.run
      j = tm.run_ending_payload[:jobs][0]
      _(j).wont_be_empty
      _(j).must_be_kind_of Hash
      _(j[:type]).must_equal("InSpec")

      _(j[:environment][:host]).must_match(/^\S+$/)
      _(j[:environment][:os]).must_match(/^\S+$/)
      _(j[:environment][:version]).must_match(REGEX[:semver]) # could be looser
      _(j[:environment][:architecture]).wont_be_empty
      _(j[:environment][:id]).must_match(REGEX[:uuid])

      _(j[:content]).must_be_kind_of Array
      _(j[:content].count).must_equal 2
      j[:content].each do |c|
        _(c[:name]).wont_be_empty
        _(c[:version]).must_match(REGEX[:semver])
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

  describe "when telemetry is run for Inspec" do
    let(:profile) { File.join(profile_path, "dependencies", "profile_a") }
    let(:tm) { Inspec::Telemetry::Mock.new }
    let(:conf) { Inspec::Config.new({ "enable_telemetry" => false }) }
    let(:runner) { Inspec::Runner.new({ command_runner: :generic, reporter: [], conf: conf }) }

    it "Inspec user can not disable telemetry using --no-enable-telemetry option" do
      Inspec::Telemetry.expects(:instance).returns(tm).at_least_once
      runner.add_target(profile)
      runner.run
      # Inspec user attempted to disable telemetry
      _(Inspec::Telemetry.telemetry_disabled?).must_equal true
      # Returns HTTP backend meaning the telemetry call is not disabled and will make an API call
      _(Inspec::Telemetry.determine_backend_class).must_equal Inspec::Telemetry::HTTP
    end
  end
end
