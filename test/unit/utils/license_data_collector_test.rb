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
}.freeze

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
      _(ldc.headers[:Principal]).must_match(/^inspec:\d+\.\d+\.\d+$/)
      _(ldc.headers[:Customer]).must_match(/^\S+$/) # TODO - Validate customer ID
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

  describe "when it merges scans" do
    let(:time1) { (Time.now - 240).getutc.iso8601 }
    let(:time2) { (Time.now - 120).getutc.iso8601 }
    let(:time3) { (Time.now - 60).getutc.iso8601 }
    let(:time4) { (Time.now - 30).getutc.iso8601 }
    let(:left) do
      {
        headers: {
          Principal: "inspec:5.10.1",
          Customer: "12345678",
        },
        payload: {
          Periods: [
            {
              Version: "5.10.1",
              Date: time1,
              Period: {
                Start: time1,
                End: time2,
              },
              Summary: {
                Nodes: { Total: 0, Active: 0 },
                Scans: { Targets: 1, Total: 1 },
              },
              Evidence: {
                Nodes: [],
                Scans: [
                  {
                    Identifier: "target-uuid1",
                    Executions: 1,
                    Version: "5.10.1",
                    Activity: {
                      Start: time1,
                      End: time2,
                    },
                  },
                ],
                Content: [
                  Identifier: "audit-uuid1",
                  Executions: 1,
                  Version: "0.1.0",
                  Type: "Profile",
                  Activity: {
                    Start: time1,
                    End: time2,
                  },
                ],
              },
            },
          ],
        },
      }
    end

    let(:right) do
      {
        headers: {
          Principal: "inspec:5.10.1",
          Customer: "12345678",
        },
        payload: {
          Periods: [
            {
              Version: "5.10.1",
              Date: time3,
              Period: {
                Start: time3,
                End: time4,
              },
              Summary: {
                Nodes: { Total: 0, Active: 0 },
                Scans: { Targets: 1, Total: 1 },
              },
              Evidence: {
                Nodes: [],
                Scans: [
                  {
                    Identifier: "target-uuid1",
                    Executions: 1,
                    Version: "5.10.1",
                    Activity: {
                      Start: time3,
                      End: time4,
                    },
                  },
                ],
                Content: [
                  Identifier: "audit-uuid1",
                  Executions: 1,
                  Version: "0.1.0",
                  Type: "Profile",
                  Activity: {
                    Start: time3,
                    End: time4,
                  },
                ],
              },
            },
          ],
        },
      }
    end

    let(:ldc) { Inspec::LicenseDataCollector::Mock.new }
    describe "when the targets are the same and the profiles are the same" do
      it "should combine the scans and content fields" do
        ldc.aggregate_ldc_payload(left, right)
        _(left[:payload][:Periods].length).must_equal 1
        pp0 = left[:payload][:Periods][0]
        _(pp0[:Date]).must_equal time1 # Preserve earliest start date
        _(pp0[:Period][:Start]).must_equal time1 # Preserve earliest start date
        _(pp0[:Period][:End]).must_equal time4 # Use latest end date
        _(pp0[:Summary][:Scans][:Targets]).must_equal 1 # Just one target, the same
        _(pp0[:Summary][:Scans][:Total]).must_equal 1 # Just one target, the same
        _(pp0[:Evidence][:Scans].length).must_equal 1 # Just one scan record
        _(pp0[:Evidence][:Scans][0][:Identifier]).must_equal "target-uuid1" # Just one target, the same
        _(pp0[:Evidence][:Scans][0][:Executions]).must_equal 2 # 2 Scans
        _(pp0[:Evidence][:Scans][0][:Activity][:Start]).must_equal time1
        _(pp0[:Evidence][:Scans][0][:Activity][:End]).must_equal time4
        _(pp0[:Evidence][:Content].length).must_equal 1 # Just one content record
        _(pp0[:Evidence][:Content][0][:Identifier]).must_equal "audit-uuid1" # Just one profile
        _(pp0[:Evidence][:Content][0][:Executions]).must_equal 2 # 2 profiles
        _(pp0[:Evidence][:Content][0][:Activity][:Start]).must_equal time1 # Earlier of the two start times
        _(pp0[:Evidence][:Content][0][:Activity][:End]).must_equal time4 # Later of the two end times
      end
    end

    describe "when the targets are the same and the profiles are different IDs" do
      it "should combine the scans and make a separate content record" do
        right[:payload][:Periods][0][:Evidence][:Content][0][:Identifier] = "audit-uuid2"

        ldc.aggregate_ldc_payload(left, right)
        _(left[:payload][:Periods].length).must_equal 1
        pp0 = left[:payload][:Periods][0]
        _(pp0[:Date]).must_equal time1 # Preserve earliest start date
        _(pp0[:Period][:Start]).must_equal time1 # Preserve earliest start date
        _(pp0[:Period][:End]).must_equal time4 # Use latest end date
        _(pp0[:Summary][:Scans][:Targets]).must_equal 1 # Just one target, the same
        _(pp0[:Summary][:Scans][:Total]).must_equal 1 # Just one target, the same
        _(pp0[:Evidence][:Scans].length).must_equal 1 # Just one scan record
        _(pp0[:Evidence][:Scans][0][:Identifier]).must_equal "target-uuid1" # Just one target, the same
        _(pp0[:Evidence][:Scans][0][:Executions]).must_equal 2 # 2 Scans
        _(pp0[:Evidence][:Scans][0][:Activity][:Start]).must_equal time1
        _(pp0[:Evidence][:Scans][0][:Activity][:End]).must_equal time4
        _(pp0[:Evidence][:Content].length).must_equal 2 # 2 separate content records
        _(pp0[:Evidence][:Content][0][:Identifier]).must_equal "audit-uuid1" # First audit, the same
        _(pp0[:Evidence][:Content][0][:Executions]).must_equal 1
        _(pp0[:Evidence][:Content][1][:Identifier]).must_equal "audit-uuid2" # Second audit, different ID
        _(pp0[:Evidence][:Content][1][:Executions]).must_equal 1
      end
    end
    describe "when the targets are the same and the profiles are the same ID but different versions" do
      it "should combine the scans and make a separate content record" do
        # Realisitically, we think a new version number would imply a new Identifier, too.
        right[:payload][:Periods][0][:Evidence][:Content][0][:Version] = "0.2.0"

        ldc.aggregate_ldc_payload(left, right)
        _(left[:payload][:Periods].length).must_equal 1
        pp0 = left[:payload][:Periods][0]
        _(pp0[:Date]).must_equal time1 # Preserve earliest start date
        _(pp0[:Period][:Start]).must_equal time1 # Preserve earliest start date
        _(pp0[:Period][:End]).must_equal time4 # Use latest end date
        _(pp0[:Summary][:Scans][:Targets]).must_equal 1 # Just one target, the same
        _(pp0[:Summary][:Scans][:Total]).must_equal 1 # Just one target, the same
        _(pp0[:Evidence][:Scans].length).must_equal 1 # Just one scan record
        _(pp0[:Evidence][:Scans][0][:Identifier]).must_equal "target-uuid1" # Just one target, the same
        _(pp0[:Evidence][:Scans][0][:Executions]).must_equal 2 # 2 Scans
        _(pp0[:Evidence][:Scans][0][:Activity][:Start]).must_equal time1
        _(pp0[:Evidence][:Scans][0][:Activity][:End]).must_equal time4
        _(pp0[:Evidence][:Content].length).must_equal 2 # 2 separate content records
        _(pp0[:Evidence][:Content][0][:Identifier]).must_equal "audit-uuid1" # First audit, the same
        _(pp0[:Evidence][:Content][0][:Executions]).must_equal 1
        _(pp0[:Evidence][:Content][0][:Version]).must_equal "0.1.0"
        _(pp0[:Evidence][:Content][1][:Identifier]).must_equal "audit-uuid1" # Second audit, the same
        _(pp0[:Evidence][:Content][1][:Executions]).must_equal 1
        _(pp0[:Evidence][:Content][1][:Version]).must_equal "0.2.0"
      end
    end

    describe "when the targets are different and the profiles are the same" do
      it "should create a new scan record" do
        right[:payload][:Periods][0][:Evidence][:Scans][0][:Identifier] = "target-uuid2"

        ldc.aggregate_ldc_payload(left, right)
        _(left[:payload][:Periods].length).must_equal 1
        pp0 = left[:payload][:Periods][0]
        _(pp0[:Date]).must_equal time1 # Preserve earliest start date
        _(pp0[:Period][:Start]).must_equal time1 # Preserve earliest start date
        _(pp0[:Period][:End]).must_equal time4 # Use latest end date
        _(pp0[:Summary][:Scans][:Targets]).must_equal 2 # Two targets
        _(pp0[:Summary][:Scans][:Total]).must_equal 2 # Two targets
        _(pp0[:Evidence][:Scans].length).must_equal 2 # 2 scan record
        _(pp0[:Evidence][:Scans][0][:Identifier]).must_equal "target-uuid1" # First target
        _(pp0[:Evidence][:Scans][0][:Executions]).must_equal 1 # 1 scan of this target
        _(pp0[:Evidence][:Scans][1][:Identifier]).must_equal "target-uuid2" # Second target
        _(pp0[:Evidence][:Scans][1][:Executions]).must_equal 1 # 1 scan of this target
        _(pp0[:Evidence][:Content].length).must_equal 1 # Just one content record
        _(pp0[:Evidence][:Content][0][:Identifier]).must_equal "audit-uuid1" # Just one profile
        _(pp0[:Evidence][:Content][0][:Executions]).must_equal 2 # 2 profiles
        _(pp0[:Evidence][:Content][0][:Activity][:Start]).must_equal time1 # Earlier of the two start times
        _(pp0[:Evidence][:Content][0][:Activity][:End]).must_equal time4 # Later of the two end times
      end
    end

    describe "when the targets are different and the profiles are different" do
      it "should create a new scan record and a new content record" do
        right[:payload][:Periods][0][:Evidence][:Scans][0][:Identifier] = "target-uuid2"
        right[:payload][:Periods][0][:Evidence][:Content][0][:Identifier] = "audit-uuid2"

        ldc.aggregate_ldc_payload(left, right)
        _(left[:payload][:Periods].length).must_equal 1
        pp0 = left[:payload][:Periods][0]
        _(pp0[:Date]).must_equal time1 # Preserve earliest start date
        _(pp0[:Period][:Start]).must_equal time1 # Preserve earliest start date
        _(pp0[:Period][:End]).must_equal time4 # Use latest end date
        _(pp0[:Summary][:Scans][:Targets]).must_equal 2 # Two targets
        _(pp0[:Summary][:Scans][:Total]).must_equal 2 # Two targets
        _(pp0[:Evidence][:Scans].length).must_equal 2 # 2 scan record
        _(pp0[:Evidence][:Scans][0][:Identifier]).must_equal "target-uuid1" # First target
        _(pp0[:Evidence][:Scans][0][:Executions]).must_equal 1 # 1 scan of this target
        _(pp0[:Evidence][:Scans][1][:Identifier]).must_equal "target-uuid2" # Second target
        _(pp0[:Evidence][:Scans][1][:Executions]).must_equal 1 # 1 scan of this target
        _(pp0[:Evidence][:Content].length).must_equal 2 # 2 separate content records
        _(pp0[:Evidence][:Content][0][:Identifier]).must_equal "audit-uuid1" # First audit, the same
        _(pp0[:Evidence][:Content][0][:Executions]).must_equal 1
        _(pp0[:Evidence][:Content][1][:Identifier]).must_equal "audit-uuid2" # Second audit, different ID
        _(pp0[:Evidence][:Content][1][:Executions]).must_equal 1
      end

    end
  end

end
