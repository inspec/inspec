require "functional/helper"
require "json-schema"
require "inspec/schema"

describe "inspec exec with json formatter" do
  include FunctionalHelper
  let(:schema) { Inspec::Schema.json("exec-json") }

  parallelize_me!

  it "can execute a simple file and validate the json schema" do
    out = inspec("exec " + example_control + " --reporter json --no-create-lockfile")
    data = JSON.parse(out.stdout)
    _(JSON::Validator.validate(schema, data)).wont_equal false

    _(out.stderr).must_equal ""

    skip_windows!
    assert_exit_code 0, out
  end

  it "can execute a profile and validate the json schema" do
    out = inspec("exec " + example_profile + " --reporter json --no-create-lockfile")
    data = JSON.parse(out.stdout)
    _(JSON::Validator.validate(schema, data)).wont_equal false

    _(out.stderr).must_equal ""

    assert_exit_code 101, out
  end

  it "can execute a simple file while using end of options after reporter cli option" do
    out = inspec("exec --no-create-lockfile --reporter json -- " + example_control)
    data = JSON.parse(out.stdout)
    sout = Inspec::Schema.json("exec-json")
    schema = JSON.parse(sout)
    _(JSON::Validator.validate(schema, data)).wont_equal false

    _(out.stderr).must_equal ""

    skip_windows!
    assert_exit_code 0, out
  end

  it "can execute a profile and validate the json schema with target_id" do
    out = inspec("exec " + example_profile + " --reporter json --no-create-lockfile --target-id 1d3e399f-4d71-4863-ac54-84d437fbc444")
    data = JSON.parse(out.stdout)
    _(data["platform"]["target_id"]).must_equal "1d3e399f-4d71-4863-ac54-84d437fbc444"
    _(JSON::Validator.validate(schema, data)).wont_equal false

    _(out.stderr).must_equal ""

    assert_exit_code 101, out
  end

  it "does not report skipped dependent profiles" do
    out = inspec("exec " + File.join(profile_path, "unsupported_dependencies", "wrapper-profile") + " --reporter json --no-create-lockfile")

    data = JSON.parse(out.stdout)
    _(data["profiles"].count).must_equal 1
    profile = data["profiles"].first
    _(profile["controls"].count).must_equal 1

    _(out.stderr).must_include "WARN: Skipping profile: 'child_profile' on unsupported platform:"
    _(out.stderr).must_include "WARN: Skipping profile: 'child_profile2' on unsupported platform:"

    skip_windows!
    assert_exit_code 0, out
  end

  it "flags skipped profiles with correct status" do
    out = inspec("exec " + File.join(profile_path, "unsupported_dependencies", "wrapper-profile") + " --reporter json --no-create-lockfile")

    data = JSON.parse(out.stdout)
    _(data["profiles"].count).must_equal 1
    profile = data["profiles"].first
    _(profile["status"]).must_equal "loaded"
    _(profile["depends"].count).must_equal 2
    profile["depends"].each do |d|
      _(d["status"]).must_equal "skipped"
      _(d["skip_message"]).must_include "Skipping profile: "
    end

    skip_windows!
    assert_exit_code 0, out
  end

  it "flags loaded profiles with correct status" do
    out = inspec("exec " + File.join(profile_path, "dependencies", "inheritance") + " --reporter json --no-create-lockfile")

    data = JSON.parse(out.stdout)
    profile = data["profiles"].first
    _(profile["status"]).must_equal "loaded"
    _(profile["depends"].count).must_equal 2
    profile["depends"].each do |d|
      _(d["status"]).must_equal "loaded"
      _(d.key?("skip_message")).must_equal false
    end

    _(out.stderr).must_equal ""

    skip_windows!
    assert_exit_code 0, out
  end

  it "flags profile with correct status when not supported" do
    out = inspec("exec " + File.join(profile_path, "skippy-profile-os") + " --reporter json --no-create-lockfile")

    data = JSON.parse(out.stdout)
    profile = data["profiles"].first
    _(profile["status"]).must_equal "skipped"
    _(profile["skip_message"]).must_include "Skipping profile: 'skippy' on unsupported platform:"

    _(out.stderr).must_equal ""

    assert_exit_code 101, out
  end

  describe "execute a profile with json formatting" do
    let(:raw) { inspec("exec " + example_profile + " --reporter json --no-create-lockfile").stdout }
    let(:json) { JSON.load(raw) }
    let(:profile) { json["profiles"][0] }
    let(:controls) { profile["controls"] }
    let(:ex1) { controls.find { |x| x["id"] == "tmp-1.0" } }
    let(:ex2) { controls.find { |x| x["id"] =~ /generated/ } }
    let(:ex3) { profile["controls"].find { |x| x["id"] == "example-1.0" } }
    let(:check_result) do
      ex3["results"].find { |x| x["resource"] == "example_config" }
    end

    it "has only one profile" do
      _(json["profiles"]).must_be_kind_of(Array)
      _(json["profiles"].length).must_equal 1
    end

    it "maps impact symbols to numbers" do
      _(ex3["impact"]).must_equal 0.9
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
        "status" => "loaded",
        "attributes" => [],
      })

      _(groups.sort_by { |x| x["id"] }).must_equal([
        { "id" => "controls/example-tmp.rb", "title" => "/tmp profile", "controls" => ["tmp-1.0", key] },
        { "id" => "controls/example.rb", "title" => "Example Config Checks", "controls" => ["example-1.0"] },
        { "id" => "controls/meta.rb", "title" => "SSH Server Configuration", "controls" => ["ssh-1"] },
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
      _(ex3["results"].length).must_equal 2
    end

    it "has the right result for tmp-1.0" do
      actual = ex1.dup

      src = actual.delete("source_location")
      _(src["ref"]).must_match %r{test/unit/mock/profiles/old-examples/profile/controls/example-tmp.rb$}
      _(src["line"]).must_equal 6

      result = actual.delete("results")[0]
      _(result).wont_be :nil?
      skip_windows!
      _(result["status"]).must_equal "passed"
      _(result["code_desc"]).must_equal "File /tmp should be directory"
      _(result["run_time"]).wont_be :nil?
      _(result["start_time"]).wont_be :nil?

      example_rb_code = <<~END
        control 'tmp-1.0' do                                   # A unique ID for this control
          impact 0.7                                           # The criticality, if this control fails.
          title 'Create /tmp directory'                        # A human-readable title
          desc 'An optional description...'                    # Describe why this is needed
          desc 'label', 'An optional description with a label' # Pair a part of the description with a label
          tag data: 'temp data'                                # A tag allows you to associate key information
          tag 'security'                                       # to the test
          ref 'Document A-12', url: 'http://...'               # Additional references

          describe file('/tmp') do                             # The actual test
            it { should be_directory }
          end
        end
      END

      _(actual).must_equal({
        "id" => "tmp-1.0",
        "title" => "Create /tmp directory",
        "desc" => "An optional description...",
        "descriptions" => [{ "label" => "default", "data" => "An optional description..." }, { "label" => "label", "data" => "An optional description with a label" }],
        "impact" => 0.7,
        "refs" => [{ "url" => "http://...", "ref" => "Document A-12" }],
        "tags" => { "data" => "temp data", "security" => nil },
        "code" => example_rb_code,
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
end
