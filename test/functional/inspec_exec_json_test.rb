require "functional/helper"
require "json_schemer"

describe "inspec exec with json formatter" do
  include FunctionalHelper
  let(:schema) { Inspec::Schema.json("exec-json") }

  parallelize_me!

  it "can execute a simple file and validate the json schema" do
    out = inspec("exec " + example_control + " --reporter json --no-create-lockfile")
    data = JSON.parse(out.stdout)
    sout = inspec("schema exec-json")
    schema = JSONSchemer.schema(sout.stdout)
    _(schema.validate(data).to_a).must_equal []

    _(out.stderr).must_be_empty
    assert_exit_code 0, out
  end

  it "can execute a profile and validate the json schema" do
    out = inspec("exec " + complete_profile + " --reporter json --no-create-lockfile")
    data = JSON.parse(out.stdout)
    sout = inspec("schema exec-json")
    schema = JSONSchemer.schema(sout.stdout)
    _(schema.validate(data).to_a).must_equal []

    _(out.stderr).must_equal ""

    assert_exit_code 0, out
  end

  it "can execute a simple file while using end of options after reporter cli option" do
    out = inspec("exec --no-create-lockfile --reporter json -- " + example_control)
    _(out.stderr).must_equal ""
    _(out.exit_status).must_equal 0
    data = JSON.parse(out.stdout)
    sout = inspec("schema exec-json")
    schema = JSONSchemer.schema(sout.stdout)
    _(schema.validate(data).to_a).must_equal []

    _(out.stderr).must_equal ""

    skip_windows!
    assert_exit_code 0, out
  end

  it "can execute a profile and validate the json schema with target_id" do
    out = inspec("exec " + complete_profile + " --reporter json --no-create-lockfile --target-id 1d3e399f-4d71-4863-ac54-84d437fbc444")
    data = JSON.parse(out.stdout)
    _(data["platform"]["target_id"]).must_equal "1d3e399f-4d71-4863-ac54-84d437fbc444"
    sout = inspec("schema exec-json")
    schema = JSONSchemer.schema(sout.stdout)
    _(schema.validate(data).to_a).must_equal []

    _(out.stderr).must_equal ""

    assert_exit_code 0, out
  end

  it "properly validates all (valid) unit tests against the schema" do
    schema = JSONSchemer.schema(JSON.parse(inspec("schema exec-json").stdout))
    all_profile_folders.first(1).each do |folder|
      begin
        out = inspec("exec " + folder + " --reporter json --no-create-lockfile")
        # Ensure it parses properly
        out = JSON.parse(out.stdout)
        failures = schema.validate(out).to_a
        _(failures).must_equal []
      rescue JSON::ParserError
        # We don't actually care about these; cannot validate if parsing fails!
        nil
      end
    end
  end

  it "does not report skipped dependent profiles" do
    profile = File.join(profile_path, "unsupported_dependencies", "wrapper-profile")
    out = inspec("exec " + profile + " --reporter json --no-create-lockfile")

    data = JSON.parse(out.stdout)
    _(data["profiles"].count).must_equal 1
    profile = data["profiles"].first
    _(profile["controls"].count).must_equal 1

    _(out.stderr).must_include "WARN: Skipping profile: 'child_profile' on unsupported platform:"
    _(out.stderr).must_include "WARN: Skipping profile: 'child_profile2' on unsupported platform:"

    assert_exit_code 0, out
  end

  it "flags skipped profiles with correct status" do
    profile = File.join(profile_path, "unsupported_dependencies", "wrapper-profile")
    out = inspec("exec " + profile + " --reporter json --no-create-lockfile")

    data = JSON.parse(out.stdout)
    _(data["profiles"].count).must_equal 1
    profile = data["profiles"].first
    _(profile["status"]).must_equal "loaded"
    _(profile["depends"].count).must_equal 2
    profile["depends"].each do |d|
      _(d["status"]).must_equal "skipped"
      _(d["skip_message"]).must_include "Skipping profile: "
    end

    assert_exit_code 0, out
  end

  it "flags loaded profiles with correct status" do
    profile = File.join(profile_path, "dependencies", "inheritance")
    out = inspec("exec " + profile + " --reporter json --no-create-lockfile")

    data = JSON.parse(out.stdout)
    profile = data["profiles"].first
    _(profile["status"]).must_equal "loaded"
    _(profile["depends"].count).must_equal 2
    profile["depends"].each do |d|
      _(d["status"]).must_equal "loaded"
      _(d.key?("skip_message")).must_equal false
    end

    _(out.stderr).must_equal ""

    assert_exit_code 0, out
  end

  it "flags profile with correct status when not supported" do
    profile = File.join(profile_path, "skippy-profile-os")
    out = inspec("exec " + profile + " --reporter json --no-create-lockfile")

    data = JSON.parse(out.stdout)
    profile = data["profiles"].first
    _(profile["status"]).must_equal "skipped"
    _(profile["skip_message"]).must_include "Skipping profile: 'skippy' on unsupported platform:"

    _(out.stderr).must_equal ""

    assert_exit_code 101, out
  end

  it "flags profile with failed status when profile fails to load" do
    profile = File.join(profile_path, "raise_outside_control")
    out = inspec("exec " + profile + " --reporter json --no-create-lockfile")

    data = JSON.parse(out.stdout)
    profile = data["profiles"].first
    _(profile["status"]).must_equal "failed"
    assert_exit_code 102, out
  end

  it "reports a working profile run at the same time as a broken profile" do
    bad_profile = File.join(profile_path, "raise_outside_control")
    good_profile = File.join(profile_path, "basic_profile")
    out = inspec("exec #{bad_profile} #{good_profile} --reporter json --no-create-lockfile")

    data = JSON.parse(out.stdout)
    _(data["profiles"].length).must_equal 2
    good_profile_result = data["profiles"].select{ |p| p["name"] == "basic_profile" }.first
    bad_profile_result = data["profiles"].select{ |p| p["name"] == "raise_outside_control" }.first
    _(good_profile_result["status"]).must_equal "loaded"
    _(good_profile_result["controls"].first["results"].first["status"]).must_equal "passed"
    _(bad_profile_result["status"]).must_equal "failed"

    assert_exit_code 102, out
  end

  describe "execute a profile with json formatting" do
    let(:raw) { inspec("exec " + example_profile + " --reporter json --no-create-lockfile").stdout }
    let(:json) { JSON.load(raw) }
    let(:profile) { json["profiles"][0] }
    let(:controls) { profile["controls"] }
    let(:ex1) { controls.find { |x| x["id"] == "tmp-1.0" } }
    let(:ex2) { controls.find { |x| x["id"] =~ /generated/ } }
    let(:check_result) do
      ex3["results"].find { |x| x["resource"] == "example_config" }
    end

    it "has only one profile" do
      _(json["profiles"]).must_be_kind_of(Array)
      _(json["profiles"].length).must_equal 1
    end

    it "maps impact symbols to numbers" do
      _(ex1["impact"]).must_equal 0.7
    end

    it "has all the metadata" do
      actual = profile.dup
      key = actual.delete("controls")
        .find { |x| x["id"] =~ /generated from example/ }["id"]
      groups = actual.delete("groups")
      actual.delete("sha256")
      _(actual).must_equal({
        "name" => "profile",
        "title" => "InSpec Example Profile",
        "maintainer" => "Chef Software, Inc.",
        "copyright" => "Chef Software, Inc.",
        "copyright_email" => "support@chef.io",
        "license" => "Apache-2.0",
        "summary" => "Demonstrates the use of InSpec Compliance Profile",
        "version" => "1.0.0",
        "supports" => [{ "platform-family" => "unix" }, { "platform-family" => "windows" }],
        "attributes" => [],
        "status" => "loaded",
      })

      _(groups.sort_by { |x| x["id"] }).must_equal([
        { "id" => "controls/example-tmp.rb",
          "title" => "/ profile",
          "controls" => ["tmp-1.0", key] },
        { "id" => "controls/meta.rb",
          "title" => "SSH Server Configuration",
          "controls" => ["ssh-1"] },
        { "id" => "controls/minimal.rb",
          "title" => "Minimal control",
          "controls" => ["minimalist"] },
      ])
    end

    it "must have 4 controls" do
      _(controls.length).must_equal 4
    end

    it "has an id for every control" do
      _(controls.find { |x| x["id"].nil? }).must_be :nil?
    end

    it "has results for every control" do
      _(ex1["results"].length).must_equal 1
      _(ex2["results"].length).must_equal 1
    end

    it "has the right result for tmp-1.0" do
      actual = ex1.dup

      src = actual.delete("source_location")
      _(src["ref"]).must_match %r{test/fixtures/profiles/old-examples/profile/controls/example-tmp.rb$}
      _(src["line"]).must_equal 6

      result = actual.delete("results")[0]
      _(result).wont_be :nil?

      _(result["status"]).must_equal "passed"
      _(result["code_desc"]).must_equal "File / is expected to be directory"
      _(result["run_time"]).wont_be :nil?
      _(result["start_time"]).wont_be :nil?

      code = actual.delete "code"
      _(code).must_include "control 'tmp-1.0' do"

      _(actual).must_equal({
        "id" => "tmp-1.0",
        "title" => "Create / directory",
        "desc" => "An optional description...",
        "descriptions" => [{ "label" => "default", "data" => "An optional description..." }, { "label" => "label", "data" => "An optional description with a label" }],
        "impact" => 0.7,
        "refs" => [{ "url" => "http://...", "ref" => "Document A-12" }],
        "tags" => { "data" => "temp data", "security" => nil },
        "waiver_data" => {},
      })
    end
  end

  describe "with a profile that is not supported on this OS/platform" do
    let(:out) { inspec("exec " + File.join(profile_path, "skippy-profile-os") + " --reporter json --no-create-lockfile") }
    let(:json) { JSON.load(out.stdout) }

    # TODO: failure handling in json formatters...

    it "never runs the actual resource" do
      _(File.exist?("/tmp/inspec_test_DONT_CREATE")).must_equal false
    end
  end

  describe "JSON reporter without setting reporter-message-truncation" do
    let(:raw) { inspec("exec " + failure_control + " --reporter json --no-create-lockfile").stdout }
    let(:json) { JSON.load(raw) }
    let(:profile) { json["profiles"][0] }
    let(:control_with_message) { profile["controls"].find { |c| c["id"] == "Generates a message" } }
    it "reports full message by default" do
      _(control_with_message["results"].first["message"]).wont_be :nil?
      _(control_with_message["results"].first["message"]).must_equal "expected nil to match /some regex that is expected in the content/"
    end
  end

  describe "JSON reporter with reporter-message-truncation set to a number" do
    let(:raw) { inspec("exec " + failure_control + " --reporter json --reporter-message-truncation=20 --no-create-lockfile").stdout }
    let(:json) { JSON.load(raw) }
    let(:profile) { json["profiles"][0] }
    let(:control_with_message) { profile["controls"].find { |c| c["id"] == "Generates a message" } }
    it "reports a truncated message" do
      _(control_with_message["results"].first["message"]).wont_be :nil?
      _(control_with_message["results"].first["message"]).must_equal "expected nil to matc[Truncated to 20 characters]"
    end
  end

  describe "JSON reporter with reporter-message-truncation set to ALL" do
    let(:raw) { inspec("exec " + failure_control + " --reporter json --reporter-message-truncation=ALL --no-create-lockfile").stdout }
    let(:json) { JSON.load(raw) }
    let(:profile) { json["profiles"][0] }
    let(:control_with_message) { profile["controls"].find { |c| c["id"] == "Generates a message" } }
    it "reports full message" do
      _(control_with_message["results"].first["message"]).wont_be :nil?
      _(control_with_message["results"].first["message"]).must_equal "expected nil to match /some regex that is expected in the content/"
    end
  end

  describe "JSON reporter without setting reporter-backtrace-inclusion" do
    let(:raw) { inspec("exec " + failure_control + " --reporter json --no-create-lockfile").stdout }
    let(:json) { JSON.load(raw) }
    let(:profile) { json["profiles"][0] }
    let(:control_with_exception) { profile["controls"].find { |c| c["id"] == "Raises an exception" } }
    let(:failed_result) { control_with_exception["results"].find { |r| r["exception"] == "NoMethodError" } }
    it "reports backtrace by default" do
      _(failed_result["backtrace"]).wont_be :nil?
      _(failed_result["backtrace"]).must_be_instance_of Array
      _(failed_result["backtrace"].first).must_be_instance_of String
    end
  end

  describe "JSON reporter with reporter-backtrace-inclusion set to true" do
    let(:raw) { inspec("exec " + failure_control + " --reporter json --reporter-backtrace-inclusion=true --no-create-lockfile").stdout }
    let(:json) { JSON.load(raw) }
    let(:profile) { json["profiles"][0] }
    let(:control_with_exception) { profile["controls"].find { |c| c["id"] == "Raises an exception" } }
    let(:failed_result) { control_with_exception["results"].find { |r| r["exception"] == "NoMethodError" } }
    it "reports backtrace" do
      _(failed_result["backtrace"]).wont_be :nil?
      _(failed_result["backtrace"]).must_be_instance_of Array
      _(failed_result["backtrace"].first).must_be_instance_of String
    end
  end

  describe "JSON reporter with reporter-backtrace-inclusion set to false" do
    let(:raw) { inspec("exec " + failure_control + " --reporter json --reporter-backtrace-inclusion=false --no-create-lockfile").stdout }
    let(:json) { JSON.load(raw) }
    let(:profile) { json["profiles"][0] }
    let(:control_with_exception) { profile["controls"].find { |c| c["id"] == "Raises an exception" } }
    let(:failed_result) { control_with_exception["results"].find { |r| r["exception"] == "NoMethodError" } }
    it "does not report backtrace" do
      _(failed_result["backtrace"]).must_be :nil?
    end
  end
end
