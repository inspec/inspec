require "functional/helper"
require "mixlib/shellout"

describe "inspec json" do
  include FunctionalHelper

  parallelize_me!

  it "read the profile json" do
    out = inspec("json " + example_profile)
    _(out.stderr).must_equal ""
    assert_exit_code 0, out
    s = out.stdout
    _(JSON.load(s)).must_be_kind_of Hash
  end

  describe "json profile data" do
    let(:json) { JSON.load(inspec("json " + example_profile).stdout) }

    it "has a generator name" do
      _(json["generator"]["name"]).must_equal "inspec"
    end

    it "has a generator inspec version" do
      _(json["generator"]["version"]).must_equal Inspec::VERSION
    end

    it "has a name" do
      _(json["name"]).must_equal "profile"
    end

    it "has a title" do
      _(json["title"]).must_equal "InSpec Example Profile"
    end

    it "has a summary" do
      _(json["summary"]).must_equal "Demonstrates the use of InSpec Compliance Profile"
    end

    it "has a version" do
      _(json["version"]).must_equal "1.0.0"
    end

    it "has a maintainer" do
      _(json["maintainer"]).must_equal "Chef Software, Inc."
    end

    it "has a copyright" do
      _(json["copyright"]).must_equal "Chef Software, Inc."
    end

    it "has controls" do
      _(json["controls"].length).must_equal 4
    end

    describe "a control" do
      let(:control) { json["controls"].find { |x| x["id"] == "tmp-1.0" } }

      it "has a title" do
        _(control["title"]).must_equal "Create /tmp directory"
      end

      it "has a description" do
        _(control["desc"]).must_equal "An optional description..."
      end

      it "has an impact" do
        _(control["impact"]).must_equal 0.7
      end

      it "has a ref" do
        _(control["refs"]).must_equal([{ "ref" => "Document A-12", "url" => "http://..." }])
      end

      it "has a source location" do
        loc = File.join(example_profile, "/controls/example-tmp.rb")
        _(control["source_location"]["ref"]).must_equal loc
        _(control["source_location"]["line"]).must_equal 6
      end

      it "has a the source code" do
        _(control["code"]).must_match(/\Acontrol 'tmp-1.0' do.*end\n\Z/m)
      end
    end
  end

  describe "filter with --controls" do
    let(:out) { inspec("json " + example_profile + " --controls tmp-1.0") }

    it "still succeeds" do
      _(out.stderr).must_equal ""

      assert_exit_code 0, out
    end

    it "only has one control included" do
      json = JSON.load(out.stdout)
      _(json["controls"].length).must_equal 1
      _(json["controls"][0]["id"]).must_equal "tmp-1.0"
      _(json["groups"].length).must_equal 1
      _(json["groups"][0]["id"]).must_equal "controls/example-tmp.rb"
    end
  end

  it "writes json to file" do
    out = inspec("json " + example_profile + " --output " + dst.path)

    hm = JSON.load(File.read(dst.path))
    _(hm["name"]).must_equal "profile"
    _(hm["controls"].length).must_equal 4

    _(out.stderr).must_equal ""

    assert_exit_code 0, out
  end

  describe "json test for pax header archives" do
    let(:profile_tgz) { File.join(Dir.mktmpdir, "pax-profile-test.tar.gz") }

    it "successfully reads a pax-formatted tar file" do
      # TODO: this needs updated to also support windows taring
      return if is_windows?

      files = Dir.glob("#{example_profile}/**/*").delete_if { |x| !File.file?(x) }
      relatives = files.map { |e| Pathname.new(e).relative_path_from(Pathname.new(example_profile)).to_s }

      cmd = Mixlib::ShellOut.new("tar --format=pax -czf #{profile_tgz} #{relatives.join(" ")}", cwd: example_profile)
      cmd.run_command
      cmd.error!

      out = inspec("json #{profile_tgz}")

      assert_exit_code 0, out
    end
  end

  describe "inspec json with a inheritance profile" do
    let(:profile) { File.join(profile_path, "export-json", "empty-wrapper") }

    it "can export a profile that uses inheritance" do
      out = inspec("json " + profile)

      # This will throw an exception if it is garbled
      json = JSON.load(out.stdout)
      # and here we verify (very passingly!) that is a structure we expect
      _(json).must_be_kind_of Hash

      json["controls"].each do |control|
        _(control["code"].empty?).must_equal false
      end

      _(out.stderr).must_be_empty

      assert_exit_code 0, out
    end
  end

  describe "inspec json does not write logs to STDOUT" do
    it "can execute a profile with warn calls and parse STDOUT as valid JSON" do
      out = inspec("json " + File.join(profile_path, "warn_logs"))

      assert_equal "warn_logs", JSON.load(out.stdout)["name"]

      _(out.stderr).must_include "This is a warn call"

      assert_exit_code 0, out
    end
  end

  describe "inspec json with a profile containing only_if" do
    it "ignores the `only_if`" do
      out = inspec("json " + File.join(profile_path, "only-if-os-nope"))

      assert_equal "only-if-os-nope", JSON.load(out.stdout)["name"]

      _(out.stderr).must_equal ""

      assert_exit_code 0, out
    end
  end
end
