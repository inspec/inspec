# Copyright 2015, Google Inc.
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

spec_dir = File.expand_path File.join(File.dirname(__FILE__))
$LOAD_PATH.unshift spec_dir
$LOAD_PATH.uniq!

require "faraday"
require "fakefs/safe"
require "googleauth"
require "spec_helper"
require "os"

describe "#get_application_default" do
  # Pass unique options each time to bypass memoization
  let(:options) { |example| { dememoize: example } }

  before :example do
    @key = OpenSSL::PKey::RSA.new 2048
    @var_name = ENV_VAR
    @credential_vars = [
      ENV_VAR, PRIVATE_KEY_VAR, CLIENT_EMAIL_VAR, CLIENT_ID_VAR,
      CLIENT_SECRET_VAR, REFRESH_TOKEN_VAR, ACCOUNT_TYPE_VAR
    ]
    @original_env_vals = {}
    @credential_vars.each { |var| @original_env_vals[var] = ENV[var] }
    @home = ENV["HOME"]
    @app_data = ENV["APPDATA"]
    @program_data = ENV["ProgramData"]
    @scope = "https://www.googleapis.com/auth/userinfo.profile"
  end

  after :example do
    @credential_vars.each { |var| ENV[var] = @original_env_vals[var] }
    ENV["HOME"] = @home unless @home == ENV["HOME"]
    ENV["APPDATA"] = @app_data unless @app_data == ENV["APPDATA"]
    ENV["ProgramData"] = @program_data unless @program_data == ENV["ProgramData"]
  end

  shared_examples "it cannot load misconfigured credentials" do
    it "fails if the GOOGLE_APPLICATION_CREDENTIALS path does not exist" do
      Dir.mktmpdir do |dir|
        key_path = File.join dir, "does-not-exist"
        ENV[@var_name] = key_path
        expect { Google::Auth.get_application_default @scope, options }
          .to raise_error RuntimeError
      end
    end

    it "fails without default file or env if not on compute engine" do
      stub = stub_request(:get, "http://169.254.169.254")
             .to_return(status:  404,
                        headers: { "Metadata-Flavor" => "NotGoogle" })
      Dir.mktmpdir do |dir|
        ENV.delete @var_name unless ENV[@var_name].nil? # no env var
        ENV["HOME"] = dir # no config present in this tmp dir
        expect do
          Google::Auth.get_application_default @scope, options
        end.to raise_error RuntimeError
      end
      expect(stub).to have_been_requested
    end
  end

  shared_examples "it can successfully load credentials" do
    it "succeeds if the GOOGLE_APPLICATION_CREDENTIALS file is valid" do
      Dir.mktmpdir do |dir|
        key_path = File.join dir, "my_cert_file"
        FileUtils.mkdir_p File.dirname(key_path)
        File.write key_path, cred_json_text
        ENV[@var_name] = key_path
        expect(Google::Auth.get_application_default(@scope, options))
          .to_not be_nil
      end
    end

    it "propagates default_connection option" do
      Dir.mktmpdir do |dir|
        key_path = File.join dir, "my_cert_file"
        FileUtils.mkdir_p File.dirname(key_path)
        File.write key_path, cred_json_text
        ENV[@var_name] = key_path
        connection = Faraday.new headers: { "User-Agent" => "hello" }
        opts = options.merge default_connection: connection
        creds = Google::Auth.get_application_default @scope, opts
        expect(creds.build_default_connection).to be connection
      end
    end

    it "succeeds with default file without GOOGLE_APPLICATION_CREDENTIALS" do
      ENV.delete @var_name unless ENV[@var_name].nil?
      Dir.mktmpdir do |dir|
        key_path = File.join dir, ".config", WELL_KNOWN_PATH
        key_path = File.join dir, WELL_KNOWN_PATH if OS.windows?
        FileUtils.mkdir_p File.dirname(key_path)
        File.write key_path, cred_json_text
        ENV["HOME"] = dir
        ENV["APPDATA"] = dir
        expect(Google::Auth.get_application_default(@scope, options))
          .to_not be_nil
      end
    end

    it "succeeds with default file without a scope" do
      ENV.delete @var_name unless ENV[@var_name].nil?
      Dir.mktmpdir do |dir|
        key_path = File.join dir, ".config", WELL_KNOWN_PATH
        key_path = File.join dir, WELL_KNOWN_PATH if OS.windows?
        FileUtils.mkdir_p File.dirname(key_path)
        File.write key_path, cred_json_text
        ENV["HOME"] = dir
        ENV["APPDATA"] = dir
        expect(Google::Auth.get_application_default(nil, options)).to_not be_nil
      end
    end

    it "succeeds without default file or env if on compute engine" do
      stub = stub_request(:get, "http://169.254.169.254")
             .to_return(status:  200,
                        headers: { "Metadata-Flavor" => "Google" })
      Dir.mktmpdir do |dir|
        ENV.delete @var_name unless ENV[@var_name].nil? # no env var
        ENV["HOME"] = dir # no config present in this tmp dir
        creds = Google::Auth.get_application_default @scope, options
        expect(creds).to_not be_nil
      end
      expect(stub).to have_been_requested
    end

    it "succeeds with system default file" do
      ENV.delete @var_name unless ENV[@var_name].nil?
      FakeFS do
        ENV["ProgramData"] = "/etc"
        prefix = OS.windows? ? "/etc/Google/Auth/" : "/etc/google/auth/"
        key_path = File.join prefix, CREDENTIALS_FILE_NAME
        FileUtils.mkdir_p File.dirname(key_path)
        File.write key_path, cred_json_text
        expect(Google::Auth.get_application_default(@scope, options))
          .to_not be_nil
        File.delete key_path
      end
    end

    it "succeeds if environment vars are valid" do
      ENV.delete @var_name unless ENV[@var_name].nil? # no env var
      ENV[PRIVATE_KEY_VAR] = cred_json[:private_key]
      ENV[CLIENT_EMAIL_VAR] = cred_json[:client_email]
      ENV[CLIENT_ID_VAR] = cred_json[:client_id]
      ENV[CLIENT_SECRET_VAR] = cred_json[:client_secret]
      ENV[REFRESH_TOKEN_VAR] = cred_json[:refresh_token]
      ENV[ACCOUNT_TYPE_VAR] = cred_json[:type]
      expect(Google::Auth.get_application_default(@scope, options))
        .to_not be_nil
    end

    it "warns when using cloud sdk credentials" do
      ENV.delete @var_name unless ENV[@var_name].nil? # no env var
      ENV[PRIVATE_KEY_VAR] = cred_json[:private_key]
      ENV[CLIENT_EMAIL_VAR] = cred_json[:client_email]
      ENV[CLIENT_ID_VAR] = Google::Auth::CredentialsLoader::CLOUD_SDK_CLIENT_ID
      ENV[CLIENT_SECRET_VAR] = cred_json[:client_secret]
      ENV[REFRESH_TOKEN_VAR] = cred_json[:refresh_token]
      ENV[ACCOUNT_TYPE_VAR] = cred_json[:type]
      ENV[PROJECT_ID_VAR] = "a_project_id"
      expect { Google::Auth.get_application_default @scope, options }.to output(
        Google::Auth::CredentialsLoader::CLOUD_SDK_CREDENTIALS_WARNING + "\n"
      ).to_stderr
    end
  end

  describe "when credential type is service account" do
    let :cred_json do
      {
        private_key_id: "a_private_key_id",
        private_key:    @key.to_pem,
        client_email:   "app@developer.gserviceaccount.com",
        client_id:      "app.apps.googleusercontent.com",
        type:           "service_account"
      }
    end

    def cred_json_text
      MultiJson.dump cred_json
    end

    it_behaves_like "it can successfully load credentials"
    it_behaves_like "it cannot load misconfigured credentials"
  end

  describe "when credential type is authorized_user" do
    let :cred_json do
      {
        client_secret: "privatekey",
        refresh_token: "refreshtoken",
        client_id:     "app.apps.googleusercontent.com",
        type:          "authorized_user"
      }
    end

    def cred_json_text
      MultiJson.dump cred_json
    end

    it_behaves_like "it can successfully load credentials"
    it_behaves_like "it cannot load misconfigured credentials"
  end

  describe "when credential type is unknown" do
    let :cred_json do
      {
        client_secret: "privatekey",
        refresh_token: "refreshtoken",
        client_id:     "app.apps.googleusercontent.com",
        private_key:   @key.to_pem,
        client_email:  "app@developer.gserviceaccount.com",
        type:          "not_known_type"
      }
    end

    def cred_json_text
      MultiJson.dump cred_json
    end

    it "fails if the GOOGLE_APPLICATION_CREDENTIALS file contains the creds" do
      Dir.mktmpdir do |dir|
        key_path = File.join dir, "my_cert_file"
        FileUtils.mkdir_p File.dirname(key_path)
        File.write key_path, cred_json_text
        ENV[@var_name] = key_path
        expect do
          Google::Auth.get_application_default @scope, options
        end.to raise_error RuntimeError
      end
    end

    it "fails if the well known file contains the creds" do
      ENV.delete @var_name unless ENV[@var_name].nil?
      Dir.mktmpdir do |dir|
        key_path = File.join dir, ".config", WELL_KNOWN_PATH
        key_path = File.join dir, WELL_KNOWN_PATH if OS.windows?
        FileUtils.mkdir_p File.dirname(key_path)
        File.write key_path, cred_json_text
        ENV["HOME"] = dir
        ENV["APPDATA"] = dir
        expect do
          Google::Auth.get_application_default @scope, options
        end.to raise_error RuntimeError
      end
    end

    it "fails if env vars are set" do
      ENV[ENV_VAR] = nil
      ENV[PRIVATE_KEY_VAR] = cred_json[:private_key]
      ENV[CLIENT_EMAIL_VAR] = cred_json[:client_email]
      expect do
        Google::Auth.get_application_default @scope, options
      end.to raise_error RuntimeError
    end
  end
end
