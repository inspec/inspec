require "helper"
require "plugins/inspec-sign/lib/inspec-sign/base"
require "stringio"
require "tmpdir"

describe InspecPlugins::Sign::Base do
  let(:fixture_dir) { File.join(Dir.pwd, "test", "fixtures") }
  let(:signed_iaf_profile) { File.join(fixture_dir, "test-inspec-profile-0.1.0.iaf") }
  describe "verify" do
    it "should verify a signed profile" do
      out = InspecPlugins::Sign::Base.profile_verify(signed_iaf_profile, true)
      _ { out }.must_be_silent
    end
  end

  describe "key generate" do
    before do
      $stdout = StringIO.new
    end

    after do
      $stdout = STDOUT
    end

    Dir.mktmpdir do |dir|
      opts = { "config_dir" => dir, "keyname" => "test" }
      it "should generate keys" do
        InspecPlugins::Sign::Base.keygen(opts)
        _(File.exist?(File.join(dir, "keys", "test.pem.key"))).must_equal true
        _(File.exist?(File.join(dir, "keys", "test.pem.pub"))).must_equal true
      end
    end
  end

  let(:profile_path) { File.join(fixture_dir, "profiles", "basic_profile") }
  let(:base) { InspecPlugins::Sign::Base.new }
  describe "read_profile_metadata" do
    it "should read the metadata of the given profile and return content" do
      _(base.read_profile_metadata(profile_path)).must_be_kind_of Hash
      _(base.read_profile_metadata(profile_path)).must_include "name"
    end
  end

  describe "write_profile_content_id" do
    it "should write the content id to the inspec.yml" do
      Dir.mktmpdir do |dir|
        tmp_profile_path = File.join(dir, "basic_profile")
        FileUtils.cp_r profile_path, tmp_profile_path

        base.write_profile_content_id(tmp_profile_path, "test-content-id")
        _(base.read_profile_metadata(tmp_profile_path)["profile_content_id"]).must_equal "test-content-id"
      end
    end
  end

end
