require_relative "../../helper"
require_relative "../../../lib/inspec/utils/license_data_collector"
require_relative "../../../lib/inspec/runner"

module Inspec
  class LicenseDataCollector::Mock < LicenseDataCollector::Base
  end
end

LDC_REGEX = {
  semver: /^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$/,
  datetime: /^(\d{4})-(\d{2})-(\d{2})T(\d{2}):(\d{2}):(\d{2}(?:\.\d*)?)((-(\d{2}):(\d{2})|Z)?)$/,
  uuid: /^[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}$/, # Not in LDC standard
}


describe "LicenseDataCollector" do
  let(:runner) { Inspec::Runner.new({ command_runner: :generic, reporter: [] }) }
  let(:repo_path) { File.expand_path("../../..", __dir__) }
  let(:mock_path) { File.join(repo_path, "test", "fixtures") }
  let(:profile_path) { File.join(mock_path, "profiles") }

  describe "when it runs with an unlicensed profile" do
    let(:profile) { File.join(profile_path, "old-examples", "profile") }
    let(:ldc) { Inspec::LicenseDataCollector::Mock.new }

    it "sets the header" do
      Inspec::LicenseDataCollector.expects(:instance).returns(ldc).at_least_once
      runner.add_target(profile)
      runner.load
      runner.run
      _(ldc.headers).wont_be_empty
      _(ldc.headers).must_be_kind_of Hash
      _(ldc.headers[:Principal]).must_match /^inspec:\d+\.\d+\.\d+$/
      _(ldc.headers[:Customer]).must_match /^\S+$/ # TODO - Validate customer ID
    end

    it "sets the payload" do
      Inspec::LicenseDataCollector.expects(:instance).returns(ldc).at_least_once
      runner.add_target(profile)
      runner.load
      runner.run
      p = ldc.payload
      _(p).wont_be_empty
      _(p).must_be_kind_of Hash
      _(p[:Periods]).must_be_kind_of Array
      pp0 = p[:Periods][0]
      _(pp0[:Version]).must_match LDC_REGEX[:semver]
      _(pp0[:Date]).must_match LDC_REGEX[:datetime]
      _(pp0[:Period][:Start]).must_match LDC_REGEX[:datetime]
      _(pp0[:Period][:End]).must_match LDC_REGEX[:datetime]
      _(pp0[:Summary][:Nodes][:Total]).must_equal 0
      _(pp0[:Summary][:Nodes][:Active]).must_equal 0
      _(pp0[:Summary][:Scans][:Targets]).must_equal 1
      _(pp0[:Summary][:Scans][:Total]).must_equal 1

      _(pp0[:Evidence][:Nodes]).must_equal []

      _(pp0[:Evidence][:Scans]).must_be_kind_of Array
      _(pp0[:Evidence][:Scans].length).must_equal 1
      pp0es0 = pp0[:Evidence][:Scans][0]
      _(pp0es0[:Identifier]).must_match LDC_REGEX[:uuid]
      _(pp0es0[:Executions]).must_equal 1
      _(pp0es0[:Version]).must_match LDC_REGEX[:semver]
      _(pp0es0[:Activity][:Start]).must_match LDC_REGEX[:datetime]
      _(pp0es0[:Activity][:End]).must_match LDC_REGEX[:datetime]

      _(pp0[:Evidence][:Content]).must_equal []

    end
  end

  describe "when it runs with a licensed profile" do
    let(:profile) { File.join(profile_path, "entitlement", "unsigned-id") }
    let(:ldc) { Inspec::LicenseDataCollector::Mock.new }
    it "sets the payload" do
      Inspec::LicenseDataCollector.expects(:instance).returns(ldc).at_least_once
      runner.add_target(profile)
      runner.load
      runner.run
      p = ldc.payload
      _(p).wont_be_empty
      _(p).must_be_kind_of Hash
      _(p[:Periods]).must_be_kind_of Array
      pp0 = p[:Periods][0]
      _(pp0[:Version]).must_match LDC_REGEX[:semver]
      _(pp0[:Date]).must_match LDC_REGEX[:datetime]
      _(pp0[:Period][:Start]).must_match LDC_REGEX[:datetime]
      _(pp0[:Period][:End]).must_match LDC_REGEX[:datetime]
      _(pp0[:Summary][:Nodes][:Total]).must_equal 0
      _(pp0[:Summary][:Nodes][:Active]).must_equal 0
      _(pp0[:Summary][:Scans][:Targets]).must_equal 1
      _(pp0[:Summary][:Scans][:Total]).must_equal 1

      _(pp0[:Evidence][:Nodes]).must_equal []

      _(pp0[:Evidence][:Scans]).must_be_kind_of Array
      _(pp0[:Evidence][:Scans].length).must_equal 1
      pp0es0 = pp0[:Evidence][:Scans][0]
      _(pp0es0[:Identifier]).must_match LDC_REGEX[:uuid]
      _(pp0es0[:Executions]).must_equal 1
      _(pp0es0[:Version]).must_match LDC_REGEX[:semver]
      _(pp0es0[:Activity][:Start]).must_match LDC_REGEX[:datetime]
      _(pp0es0[:Activity][:End]).must_match LDC_REGEX[:datetime]

      _(pp0[:Evidence][:Content]).must_be_kind_of Array
      _(pp0[:Evidence][:Content].length).must_equal 1
      pp0ec0 = pp0[:Evidence][:Content][0]
      _(pp0ec0[:Identifier]).must_match LDC_REGEX[:uuid]
      _(pp0ec0[:Executions]).must_equal 1
      _(pp0ec0[:Version]).must_match LDC_REGEX[:semver]
      _(pp0ec0[:Type]).must_equal "Profile"
      _(pp0ec0[:Activity][:Start]).must_match LDC_REGEX[:datetime]
      _(pp0ec0[:Activity][:End]).must_match LDC_REGEX[:datetime]
    end
  end
end
