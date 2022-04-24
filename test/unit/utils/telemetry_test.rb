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
  let(:profile_path) { File.join(mock_path, "profiles") }

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
      _(tm.run_ending_payload[:customerId]).must_match(/^\S+$/) # TODO - Validate customer ID
      _(tm.run_ending_payload[:correlationId]).must_match(REGEX[:uuid])
      _(tm.run_ending_payload[:createdTimeUTC]).must_match(REGEX[:datetime])
      _(tm.run_ending_payload[:type]).must_match(/^job|event$/)
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
        s[:resources].each do |r|
          _(r[:type]).must_equal "inspec-resource"
          _(r[:name]).wont_be_empty
          _(r[:id]).must_match(REGEX[:sha256])
        end
      end
    end
  end
end
