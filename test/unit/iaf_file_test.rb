require "helper"
require "inspec/iaf_file"

describe "Inspec::IafFile" do

  # Using progress official public key for testing
  let(:valid_verification_key_name) { "progress-2022-05-04" }

  after do
    # delete local copy of public key which is created due to testing
    File.delete("#{Inspec.config_dir}/keys/#{valid_verification_key_name}.pem.pub") if File.exist?("#{Inspec.config_dir}/keys/#{valid_verification_key_name}.pem.pub")
  end

  describe "Finding validation key for iaf file" do
    before do
      stub_request(:get, "https://raw.githubusercontent.com/inspec/inspec/main/etc/keys/garbage-keyname.pem.pub")
        .with(
        headers: {
        "Accept" => "*/*",
        "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
        "User-Agent" => "Ruby",
        }
      )
        .to_return(status: 404, body: "", headers: {})
    end

    it "returns keypath when key is found" do
      path = Inspec::IafFile.find_validation_key(valid_verification_key_name)
      _(path).must_equal "#{Inspec.src_root}/etc/keys/#{valid_verification_key_name}.pem.pub"
    end

    it "returns error when key not found" do
      _ { Inspec::IafFile.find_validation_key("garbage-keyname") }.must_raise(Inspec::Exceptions::ProfileValidationKeyNotFound)
    end

    it "returns error when key not passed" do
      _ { Inspec::IafFile.find_validation_key }.must_raise(ArgumentError)
    end
  end

  describe "Finding signing key for iaf file" do
    it "returns error when key not found" do
      _ { Inspec::IafFile.find_signing_key("garbage-keyname") }.must_raise(Inspec::Exceptions::ProfileSigningKeyNotFound)
    end
  end

  describe "Fetch validation key from github" do
    before do
      stub_request(:get, "https://raw.githubusercontent.com/inspec/inspec/main/etc/keys/garbage-keyname.pem.pub")
        .with(
        headers: {
        "Accept" => "*/*",
        "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
        "User-Agent" => "Ruby",
        }
      )
        .to_return(status: 404, body: "", headers: {})

      stub_request(:get, "https://raw.githubusercontent.com/inspec/inspec/main/etc/keys/progress-2022-05-04.pem.pub")
        .with(
        headers: {
        "Accept" => "*/*",
        "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
        "User-Agent" => "Ruby",
        }
      )
        .to_return(status: 200, body: "", headers: {})
    end

    it "returns true when key found" do
      result = Inspec::IafFile.fetch_validation_key_from_github(valid_verification_key_name)
      _(result).must_equal true
    end

    it "returns false when key not found" do
      result = Inspec::IafFile.fetch_validation_key_from_github("garbage-keyname")
      _(result).must_equal false
    end

  end

  describe "Testing validity of an iaf file" do
    it "validates successfully" do
      iaf_file = Inspec::IafFile.new("test/fixtures/test-inspec-profile-0.1.0.iaf")
      _(iaf_file.valid?).must_equal true
    end
  end
end