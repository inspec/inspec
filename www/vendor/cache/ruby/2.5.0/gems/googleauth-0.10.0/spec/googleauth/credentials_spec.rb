# Copyright 2017, Google Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
#     * Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
# copyright notice, this list of conditions and the following disclaimer
# in the documentation and/or other materials provided with the
# distribution.
#     * Neither the name of Google Inc. nor the names of its
# contributors may be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

require "googleauth"


# This test is testing the private class Google::Auth::Credentials. We want to
# make sure that the passed in scope propogates to the Signet object. This means
# testing the private API, which is generally frowned on.
describe Google::Auth::Credentials, :private do
  let :default_keyfile_hash do
    {
      "private_key_id" => "testabc1234567890xyz",
      "private_key"    => "-----BEGIN RSA PRIVATE KEY-----\nMIIBOwIBAAJBAOyi0Hy1l4Ym2m2o71Q0TF4O9E81isZEsX0bb+Bqz1SXEaSxLiXM\nUZE8wu0eEXivXuZg6QVCW/5l+f2+9UPrdNUCAwEAAQJAJkqubA/Chj3RSL92guy3\nktzeodarLyw8gF8pOmpuRGSiEo/OLTeRUMKKD1/kX4f9sxf3qDhB4e7dulXR1co/\nIQIhAPx8kMW4XTTL6lJYd2K5GrH8uBMp8qL5ya3/XHrBgw3dAiEA7+3Iw3ULTn2I\n1J34WlJ2D5fbzMzB4FAHUNEV7Ys3f1kCIQDtUahCMChrl7+H5t9QS+xrn77lRGhs\nB50pjvy95WXpgQIhAI2joW6JzTfz8fAapb+kiJ/h9Vcs1ZN3iyoRlNFb61JZAiA8\nNy5NyNrMVwtB/lfJf1dAK/p/Bwd8LZLtgM6PapRfgw==\n-----END RSA PRIVATE KEY-----\n",
      "client_email"   => "credz-testabc1234567890xyz@developer.gserviceaccount.com",
      "client_id"      => "credz-testabc1234567890xyz.apps.googleusercontent.com",
      "type"           => "service_account",
      "project_id"     => "a_project_id"
    }
  end

  it "uses a default scope" do
    mocked_signet = double "Signet::OAuth2::Client"
    allow(mocked_signet).to receive(:configure_connection).and_return(mocked_signet)
    allow(mocked_signet).to receive(:fetch_access_token!).and_return(true)
    allow(mocked_signet).to receive(:client_id)
    allow(Signet::OAuth2::Client).to receive(:new) do |options|
      expect(options[:token_credential_uri]).to eq("https://oauth2.googleapis.com/token")
      expect(options[:audience]).to eq("https://oauth2.googleapis.com/token")
      expect(options[:scope]).to eq([])
      expect(options[:issuer]).to eq(default_keyfile_hash["client_email"])
      expect(options[:signing_key]).to be_a_kind_of(OpenSSL::PKey::RSA)

      mocked_signet
    end

    Google::Auth::Credentials.new default_keyfile_hash
  end

  it "uses a custom scope" do
    mocked_signet = double "Signet::OAuth2::Client"
    allow(mocked_signet).to receive(:configure_connection).and_return(mocked_signet)
    allow(mocked_signet).to receive(:fetch_access_token!).and_return(true)
    allow(mocked_signet).to receive(:client_id)
    allow(Signet::OAuth2::Client).to receive(:new) do |options|
      expect(options[:token_credential_uri]).to eq("https://oauth2.googleapis.com/token")
      expect(options[:audience]).to eq("https://oauth2.googleapis.com/token")
      expect(options[:scope]).to eq(["http://example.com/scope"])
      expect(options[:issuer]).to eq(default_keyfile_hash["client_email"])
      expect(options[:signing_key]).to be_a_kind_of(OpenSSL::PKey::RSA)

      mocked_signet
    end

    Google::Auth::Credentials.new default_keyfile_hash, scope: "http://example.com/scope"
  end

  describe "using CONSTANTS" do
    it "can be subclassed to pass in other env paths" do
      test_path_env_val = "/unknown/path/to/file.txt".freeze
      test_json_env_val = JSON.generate default_keyfile_hash

      ENV["TEST_PATH"] = test_path_env_val
      ENV["TEST_JSON_VARS"] = test_json_env_val

      class TestCredentials1 < Google::Auth::Credentials
        TOKEN_CREDENTIAL_URI = "https://example.com/token".freeze
        AUDIENCE = "https://example.com/audience".freeze
        SCOPE = "http://example.com/scope".freeze
        PATH_ENV_VARS = ["TEST_PATH"].freeze
        JSON_ENV_VARS = ["TEST_JSON_VARS"].freeze
      end

      allow(::File).to receive(:file?).with(test_path_env_val) { false }
      allow(::File).to receive(:file?).with(test_json_env_val) { false }

      mocked_signet = double "Signet::OAuth2::Client"
      allow(mocked_signet).to receive(:configure_connection).and_return(mocked_signet)
      allow(mocked_signet).to receive(:fetch_access_token!).and_return(true)
      allow(mocked_signet).to receive(:client_id)
      allow(Signet::OAuth2::Client).to receive(:new) do |options|
        expect(options[:token_credential_uri]).to eq("https://example.com/token")
        expect(options[:audience]).to eq("https://example.com/audience")
        expect(options[:scope]).to eq(["http://example.com/scope"])
        expect(options[:issuer]).to eq(default_keyfile_hash["client_email"])
        expect(options[:signing_key]).to be_a_kind_of(OpenSSL::PKey::RSA)

        mocked_signet
      end

      creds = TestCredentials1.default
      expect(creds).to be_a_kind_of(TestCredentials1)
      expect(creds.client).to eq(mocked_signet)
      expect(creds.project_id).to eq(default_keyfile_hash["project_id"])
    end

    it "subclasses can use PATH_ENV_VARS to get keyfile path" do
      class TestCredentials2 < Google::Auth::Credentials
        SCOPE = "http://example.com/scope".freeze
        PATH_ENV_VARS = %w[PATH_ENV_DUMMY PATH_ENV_TEST].freeze
        JSON_ENV_VARS = ["JSON_ENV_DUMMY"].freeze
        DEFAULT_PATHS = ["~/default/path/to/file.txt"].freeze
      end

      allow(::ENV).to receive(:[]).with("GOOGLE_AUTH_SUPPRESS_CREDENTIALS_WARNINGS") { "true" }
      allow(::ENV).to receive(:[]).with("PATH_ENV_DUMMY") { "/fake/path/to/file.txt" }
      allow(::File).to receive(:file?).with("/fake/path/to/file.txt") { false }
      allow(::ENV).to receive(:[]).with("PATH_ENV_TEST") { "/unknown/path/to/file.txt" }
      allow(::File).to receive(:file?).with("/unknown/path/to/file.txt") { true }
      allow(::File).to receive(:read).with("/unknown/path/to/file.txt") { JSON.generate default_keyfile_hash }

      mocked_signet = double "Signet::OAuth2::Client"
      allow(mocked_signet).to receive(:configure_connection).and_return(mocked_signet)
      allow(mocked_signet).to receive(:fetch_access_token!).and_return(true)
      allow(mocked_signet).to receive(:client_id)
      allow(Signet::OAuth2::Client).to receive(:new) do |options|
        expect(options[:token_credential_uri]).to eq("https://oauth2.googleapis.com/token")
        expect(options[:audience]).to eq("https://oauth2.googleapis.com/token")
        expect(options[:scope]).to eq(["http://example.com/scope"])
        expect(options[:issuer]).to eq(default_keyfile_hash["client_email"])
        expect(options[:signing_key]).to be_a_kind_of(OpenSSL::PKey::RSA)

        mocked_signet
      end

      creds = TestCredentials2.default
      expect(creds).to be_a_kind_of(TestCredentials2)
      expect(creds.client).to eq(mocked_signet)
      expect(creds.project_id).to eq(default_keyfile_hash["project_id"])
    end

    it "subclasses can use JSON_ENV_VARS to get keyfile contents" do
      test_json_env_val = JSON.generate default_keyfile_hash

      class TestCredentials3 < Google::Auth::Credentials
        SCOPE = "http://example.com/scope".freeze
        PATH_ENV_VARS = ["PATH_ENV_DUMMY"].freeze
        JSON_ENV_VARS = %w[JSON_ENV_DUMMY JSON_ENV_TEST].freeze
        DEFAULT_PATHS = ["~/default/path/to/file.txt"].freeze
      end

      allow(::ENV).to receive(:[]).with("GOOGLE_AUTH_SUPPRESS_CREDENTIALS_WARNINGS") { "true" }
      allow(::ENV).to receive(:[]).with("PATH_ENV_DUMMY") { "/fake/path/to/file.txt" }
      allow(::File).to receive(:file?).with("/fake/path/to/file.txt") { false }
      allow(::File).to receive(:file?).with(test_json_env_val) { false }
      allow(::ENV).to receive(:[]).with("JSON_ENV_DUMMY") { nil }
      allow(::ENV).to receive(:[]).with("JSON_ENV_TEST") { test_json_env_val }

      mocked_signet = double "Signet::OAuth2::Client"
      allow(mocked_signet).to receive(:configure_connection).and_return(mocked_signet)
      allow(mocked_signet).to receive(:fetch_access_token!).and_return(true)
      allow(mocked_signet).to receive(:client_id)
      allow(Signet::OAuth2::Client).to receive(:new) do |options|
        expect(options[:token_credential_uri]).to eq("https://oauth2.googleapis.com/token")
        expect(options[:audience]).to eq("https://oauth2.googleapis.com/token")
        expect(options[:scope]).to eq(["http://example.com/scope"])
        expect(options[:issuer]).to eq(default_keyfile_hash["client_email"])
        expect(options[:signing_key]).to be_a_kind_of(OpenSSL::PKey::RSA)

        mocked_signet
      end

      creds = TestCredentials3.default
      expect(creds).to be_a_kind_of(TestCredentials3)
      expect(creds.client).to eq(mocked_signet)
      expect(creds.project_id).to eq(default_keyfile_hash["project_id"])
    end

    it "subclasses can use DEFAULT_PATHS to get keyfile path" do
      class TestCredentials4 < Google::Auth::Credentials
        SCOPE = "http://example.com/scope".freeze
        PATH_ENV_VARS = ["PATH_ENV_DUMMY"].freeze
        JSON_ENV_VARS = ["JSON_ENV_DUMMY"].freeze
        DEFAULT_PATHS = ["~/default/path/to/file.txt"].freeze
      end

      allow(::ENV).to receive(:[]).with("GOOGLE_AUTH_SUPPRESS_CREDENTIALS_WARNINGS") { "true" }
      allow(::ENV).to receive(:[]).with("PATH_ENV_DUMMY") { "/fake/path/to/file.txt" }
      allow(::File).to receive(:file?).with("/fake/path/to/file.txt") { false }
      allow(::ENV).to receive(:[]).with("JSON_ENV_DUMMY") { nil }
      allow(::File).to receive(:file?).with("~/default/path/to/file.txt") { true }
      allow(::File).to receive(:read).with("~/default/path/to/file.txt") { JSON.generate default_keyfile_hash }

      mocked_signet = double "Signet::OAuth2::Client"
      allow(mocked_signet).to receive(:configure_connection).and_return(mocked_signet)
      allow(mocked_signet).to receive(:fetch_access_token!).and_return(true)
      allow(mocked_signet).to receive(:client_id)
      allow(Signet::OAuth2::Client).to receive(:new) do |options|
        expect(options[:token_credential_uri]).to eq("https://oauth2.googleapis.com/token")
        expect(options[:audience]).to eq("https://oauth2.googleapis.com/token")
        expect(options[:scope]).to eq(["http://example.com/scope"])
        expect(options[:issuer]).to eq(default_keyfile_hash["client_email"])
        expect(options[:signing_key]).to be_a_kind_of(OpenSSL::PKey::RSA)

        mocked_signet
      end

      creds = TestCredentials4.default
      expect(creds).to be_a_kind_of(TestCredentials4)
      expect(creds.client).to eq(mocked_signet)
      expect(creds.project_id).to eq(default_keyfile_hash["project_id"])
    end

    it "subclasses that find no matches default to Google::Auth.get_application_default" do
      class TestCredentials5 < Google::Auth::Credentials
        SCOPE = "http://example.com/scope".freeze
        PATH_ENV_VARS = ["PATH_ENV_DUMMY"].freeze
        JSON_ENV_VARS = ["JSON_ENV_DUMMY"].freeze
        DEFAULT_PATHS = ["~/default/path/to/file.txt"].freeze
      end

      allow(::ENV).to receive(:[]).with("GOOGLE_AUTH_SUPPRESS_CREDENTIALS_WARNINGS") { "true" }
      allow(::ENV).to receive(:[]).with("PATH_ENV_DUMMY") { "/fake/path/to/file.txt" }
      allow(::File).to receive(:file?).with("/fake/path/to/file.txt") { false }
      allow(::ENV).to receive(:[]).with("JSON_ENV_DUMMY") { nil }
      allow(::File).to receive(:file?).with("~/default/path/to/file.txt") { false }

      mocked_signet = double "Signet::OAuth2::Client"
      allow(mocked_signet).to receive(:configure_connection).and_return(mocked_signet)
      allow(mocked_signet).to receive(:fetch_access_token!).and_return(true)
      allow(mocked_signet).to receive(:client_id)
      allow(Google::Auth).to receive(:get_application_default) do |scope|
        expect(scope).to eq([TestCredentials5::SCOPE])

        # This should really be a Signet::OAuth2::Client object,
        # but mocking is making that difficult, so return a valid hash instead.
        default_keyfile_hash
      end
      allow(Signet::OAuth2::Client).to receive(:new) do |options|
        expect(options[:token_credential_uri]).to eq("https://oauth2.googleapis.com/token")
        expect(options[:audience]).to eq("https://oauth2.googleapis.com/token")
        expect(options[:scope]).to eq(["http://example.com/scope"])
        expect(options[:issuer]).to eq(default_keyfile_hash["client_email"])
        expect(options[:signing_key]).to be_a_kind_of(OpenSSL::PKey::RSA)

        mocked_signet
      end

      creds = TestCredentials5.default
      expect(creds).to be_a_kind_of(TestCredentials5)
      expect(creds.client).to eq(mocked_signet)
      expect(creds.project_id).to eq(default_keyfile_hash["project_id"])
    end
  end

  describe "using class methods" do
    it "can be subclassed to pass in other env paths" do
      test_path_env_val = "/unknown/path/to/file.txt".freeze
      test_json_env_val = JSON.generate default_keyfile_hash

      ENV["TEST_PATH"] = test_path_env_val
      ENV["TEST_JSON_VARS"] = test_json_env_val

      class TestCredentials11 < Google::Auth::Credentials
        self.token_credential_uri = "https://example.com/token"
        self.audience = "https://example.com/audience"
        self.scope = "http://example.com/scope"
        self.env_vars = ["TEST_PATH", "TEST_JSON_VARS"]
      end

      allow(::File).to receive(:file?).with(test_path_env_val) { false }
      allow(::File).to receive(:file?).with(test_json_env_val) { false }

      mocked_signet = double "Signet::OAuth2::Client"
      allow(mocked_signet).to receive(:configure_connection).and_return(mocked_signet)
      allow(mocked_signet).to receive(:fetch_access_token!).and_return(true)
      allow(mocked_signet).to receive(:client_id)
      allow(Signet::OAuth2::Client).to receive(:new) do |options|
        expect(options[:token_credential_uri]).to eq("https://example.com/token")
        expect(options[:audience]).to eq("https://example.com/audience")
        expect(options[:scope]).to eq(["http://example.com/scope"])
        expect(options[:issuer]).to eq(default_keyfile_hash["client_email"])
        expect(options[:signing_key]).to be_a_kind_of(OpenSSL::PKey::RSA)

        mocked_signet
      end

      creds = TestCredentials11.default
      expect(creds).to be_a_kind_of(TestCredentials11)
      expect(creds.client).to eq(mocked_signet)
      expect(creds.project_id).to eq(default_keyfile_hash["project_id"])
    end

    it "subclasses can use PATH_ENV_VARS to get keyfile path" do
      class TestCredentials12 < Google::Auth::Credentials
        self.scope = "http://example.com/scope"
        self.env_vars = %w[PATH_ENV_DUMMY PATH_ENV_TEST JSON_ENV_DUMMY]
        self.paths = ["~/default/path/to/file.txt"]
      end

      allow(::ENV).to receive(:[]).with("GOOGLE_AUTH_SUPPRESS_CREDENTIALS_WARNINGS") { "true" }
      allow(::ENV).to receive(:[]).with("PATH_ENV_DUMMY") { "/fake/path/to/file.txt" }
      allow(::File).to receive(:file?).with("/fake/path/to/file.txt") { false }
      allow(::ENV).to receive(:[]).with("PATH_ENV_TEST") { "/unknown/path/to/file.txt" }
      allow(::File).to receive(:file?).with("/unknown/path/to/file.txt") { true }
      allow(::File).to receive(:read).with("/unknown/path/to/file.txt") { JSON.generate default_keyfile_hash }

      mocked_signet = double "Signet::OAuth2::Client"
      allow(mocked_signet).to receive(:configure_connection).and_return(mocked_signet)
      allow(mocked_signet).to receive(:fetch_access_token!).and_return(true)
      allow(mocked_signet).to receive(:client_id)
      allow(Signet::OAuth2::Client).to receive(:new) do |options|
        expect(options[:token_credential_uri]).to eq("https://oauth2.googleapis.com/token")
        expect(options[:audience]).to eq("https://oauth2.googleapis.com/token")
        expect(options[:scope]).to eq(["http://example.com/scope"])
        expect(options[:issuer]).to eq(default_keyfile_hash["client_email"])
        expect(options[:signing_key]).to be_a_kind_of(OpenSSL::PKey::RSA)

        mocked_signet
      end

      creds = TestCredentials12.default
      expect(creds).to be_a_kind_of(TestCredentials12)
      expect(creds.client).to eq(mocked_signet)
      expect(creds.project_id).to eq(default_keyfile_hash["project_id"])
    end

    it "subclasses can use JSON_ENV_VARS to get keyfile contents" do
      test_json_env_val = JSON.generate default_keyfile_hash

      class TestCredentials13 < Google::Auth::Credentials
        self.scope = "http://example.com/scope"
        self.env_vars = %w[PATH_ENV_DUMMY JSON_ENV_DUMMY JSON_ENV_TEST]
        self.paths = ["~/default/path/to/file.txt"]
      end

      allow(::ENV).to receive(:[]).with("GOOGLE_AUTH_SUPPRESS_CREDENTIALS_WARNINGS") { "true" }
      allow(::ENV).to receive(:[]).with("PATH_ENV_DUMMY") { "/fake/path/to/file.txt" }
      allow(::File).to receive(:file?).with("/fake/path/to/file.txt") { false }
      allow(::File).to receive(:file?).with(test_json_env_val) { false }
      allow(::ENV).to receive(:[]).with("JSON_ENV_DUMMY") { nil }
      allow(::ENV).to receive(:[]).with("JSON_ENV_TEST") { test_json_env_val }

      mocked_signet = double "Signet::OAuth2::Client"
      allow(mocked_signet).to receive(:configure_connection).and_return(mocked_signet)
      allow(mocked_signet).to receive(:fetch_access_token!).and_return(true)
      allow(mocked_signet).to receive(:client_id)
      allow(Signet::OAuth2::Client).to receive(:new) do |options|
        expect(options[:token_credential_uri]).to eq("https://oauth2.googleapis.com/token")
        expect(options[:audience]).to eq("https://oauth2.googleapis.com/token")
        expect(options[:scope]).to eq(["http://example.com/scope"])
        expect(options[:issuer]).to eq(default_keyfile_hash["client_email"])
        expect(options[:signing_key]).to be_a_kind_of(OpenSSL::PKey::RSA)

        mocked_signet
      end

      creds = TestCredentials13.default
      expect(creds).to be_a_kind_of(TestCredentials13)
      expect(creds.client).to eq(mocked_signet)
      expect(creds.project_id).to eq(default_keyfile_hash["project_id"])
    end

    it "subclasses can use DEFAULT_PATHS to get keyfile path" do
      class TestCredentials14 < Google::Auth::Credentials
        self.scope = "http://example.com/scope"
        self.env_vars = %w[PATH_ENV_DUMMY JSON_ENV_DUMMY]
        self.paths = ["~/default/path/to/file.txt"]
      end

      allow(::ENV).to receive(:[]).with("GOOGLE_AUTH_SUPPRESS_CREDENTIALS_WARNINGS") { "true" }
      allow(::ENV).to receive(:[]).with("PATH_ENV_DUMMY") { "/fake/path/to/file.txt" }
      allow(::File).to receive(:file?).with("/fake/path/to/file.txt") { false }
      allow(::ENV).to receive(:[]).with("JSON_ENV_DUMMY") { nil }
      allow(::File).to receive(:file?).with("~/default/path/to/file.txt") { true }
      allow(::File).to receive(:read).with("~/default/path/to/file.txt") { JSON.generate default_keyfile_hash }

      mocked_signet = double "Signet::OAuth2::Client"
      allow(mocked_signet).to receive(:configure_connection).and_return(mocked_signet)
      allow(mocked_signet).to receive(:fetch_access_token!).and_return(true)
      allow(mocked_signet).to receive(:client_id)
      allow(Signet::OAuth2::Client).to receive(:new) do |options|
        expect(options[:token_credential_uri]).to eq("https://oauth2.googleapis.com/token")
        expect(options[:audience]).to eq("https://oauth2.googleapis.com/token")
        expect(options[:scope]).to eq(["http://example.com/scope"])
        expect(options[:issuer]).to eq(default_keyfile_hash["client_email"])
        expect(options[:signing_key]).to be_a_kind_of(OpenSSL::PKey::RSA)

        mocked_signet
      end

      creds = TestCredentials14.default
      expect(creds).to be_a_kind_of(TestCredentials14)
      expect(creds.client).to eq(mocked_signet)
      expect(creds.project_id).to eq(default_keyfile_hash["project_id"])
    end

    it "subclasses that find no matches default to Google::Auth.get_application_default" do
      class TestCredentials15 < Google::Auth::Credentials
        self.scope = "http://example.com/scope"
        self.env_vars = %w[PATH_ENV_DUMMY JSON_ENV_DUMMY]
        self.paths = ["~/default/path/to/file.txt"]
      end

      allow(::ENV).to receive(:[]).with("GOOGLE_AUTH_SUPPRESS_CREDENTIALS_WARNINGS") { "true" }
      allow(::ENV).to receive(:[]).with("PATH_ENV_DUMMY") { "/fake/path/to/file.txt" }
      allow(::File).to receive(:file?).with("/fake/path/to/file.txt") { false }
      allow(::ENV).to receive(:[]).with("JSON_ENV_DUMMY") { nil }
      allow(::File).to receive(:file?).with("~/default/path/to/file.txt") { false }

      mocked_signet = double "Signet::OAuth2::Client"
      allow(mocked_signet).to receive(:configure_connection).and_return(mocked_signet)
      allow(mocked_signet).to receive(:fetch_access_token!).and_return(true)
      allow(mocked_signet).to receive(:client_id)
      allow(Google::Auth).to receive(:get_application_default) do |scope|
        expect(scope).to eq(TestCredentials15.scope)

        # This should really be a Signet::OAuth2::Client object,
        # but mocking is making that difficult, so return a valid hash instead.
        default_keyfile_hash
      end
      allow(Signet::OAuth2::Client).to receive(:new) do |options|
        expect(options[:token_credential_uri]).to eq("https://oauth2.googleapis.com/token")
        expect(options[:audience]).to eq("https://oauth2.googleapis.com/token")
        expect(options[:scope]).to eq(["http://example.com/scope"])
        expect(options[:issuer]).to eq(default_keyfile_hash["client_email"])
        expect(options[:signing_key]).to be_a_kind_of(OpenSSL::PKey::RSA)

        mocked_signet
      end

      creds = TestCredentials15.default
      expect(creds).to be_a_kind_of(TestCredentials15)
      expect(creds.client).to eq(mocked_signet)
      expect(creds.project_id).to eq(default_keyfile_hash["project_id"])
    end
  end

  it "warns when cloud sdk credentials are used" do
    mocked_signet = double "Signet::OAuth2::Client"
    allow(mocked_signet).to receive(:configure_connection).and_return(mocked_signet)
    allow(mocked_signet).to receive(:fetch_access_token!).and_return(true)
    allow(Signet::OAuth2::Client).to receive(:new) do |_options|
      mocked_signet
    end
    allow(mocked_signet).to receive(:client_id).and_return(Google::Auth::CredentialsLoader::CLOUD_SDK_CLIENT_ID)
    expect { Google::Auth::Credentials.new default_keyfile_hash }.to output(
      Google::Auth::CredentialsLoader::CLOUD_SDK_CREDENTIALS_WARNING + "\n"
    ).to_stderr
  end
end
