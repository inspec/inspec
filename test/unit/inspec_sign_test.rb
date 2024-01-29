require "helper"
require "plugins/inspec-sign/lib/inspec-sign/base"
require "stringio"

describe InspecPlugins::Sign::Base do
  let(:fixture_dir) { File.join(Dir.pwd, "test", "fixtures") }
  let(:signed_iaf_profile) { File.join(fixture_dir, "test-inspec-profile-0.1.0.iaf") }
  describe "verify" do
    it "should verify a signed profile" do
      out = InspecPlugins::Sign::Base.profile_verify(signed_iaf_profile, true)
      _ { out }.must_be_silent
    end
  end
end
