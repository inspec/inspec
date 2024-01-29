require "helper"
require "plugins/inspec-sign/lib/inspec-sign/base"
require "stringio"
require "tmpdir"
require "inspec/cli"

describe InspecPlugins::Sign::Base do
  let(:fixture_dir) { File.join(Dir.pwd, "test", "fixtures") }
  let(:signed_iaf_profile) { File.join(fixture_dir, "test-inspec-profile-0.1.0.iaf") }
  describe "verify" do
    it "should verify a signed profile" do
      out = InspecPlugins::Sign::Base.profile_verify(signed_iaf_profile, true)
      _ { out }.must_be_silent
    end
  end

  describe "key generate and profile_sign" do
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

      it "should sign a profile" do
        InspecPlugins::Sign::Base.profile_sign(File.join(fixture_dir, "profiles", "basic_profile"), opts)
        _(File.exist?(File.join(fixture_dir, "test-inspec-profile-0.1.0.iaf"))).must_equal true

      end
    end
  end
end
