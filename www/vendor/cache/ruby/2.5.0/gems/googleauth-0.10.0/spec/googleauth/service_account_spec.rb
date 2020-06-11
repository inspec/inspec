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

require "apply_auth_examples"
require "fakefs/safe"
require "fileutils"
require "googleauth/service_account"
require "jwt"
require "multi_json"
require "openssl"
require "spec_helper"
require "tmpdir"
require "os"

include Google::Auth::CredentialsLoader

shared_examples "jwt header auth" do
  context "when jwt_aud_uri is present" do
    let(:test_uri) { "https://www.googleapis.com/myservice" }
    let(:auth_prefix) { "Bearer " }
    let(:auth_key) { ServiceAccountJwtHeaderCredentials::AUTH_METADATA_KEY }
    let(:jwt_uri_key) { ServiceAccountJwtHeaderCredentials::JWT_AUD_URI_KEY }

    def expect_is_encoded_jwt hdr
      expect(hdr).to_not be_nil
      expect(hdr.start_with?(auth_prefix)).to be true
      authorization = hdr[auth_prefix.length..-1]
      payload, = JWT.decode authorization, @key.public_key, true, algorithm: "RS256"
      expect(payload["aud"]).to eq(test_uri)
      expect(payload["iss"]).to eq(client_email)
    end

    describe "#apply!" do
      it "should update the target hash with a jwt token" do
        md = { foo: "bar" }
        md[jwt_uri_key] = test_uri
        @client.apply! md
        auth_header = md[auth_key]
        expect_is_encoded_jwt auth_header
        expect(md[jwt_uri_key]).to be_nil
      end
    end

    describe "updater_proc" do
      it "should provide a proc that updates a hash with a jwt token" do
        md = { foo: "bar" }
        md[jwt_uri_key] = test_uri
        the_proc = @client.updater_proc
        got = the_proc.call md
        auth_header = got[auth_key]
        expect_is_encoded_jwt auth_header
        expect(got[jwt_uri_key]).to be_nil
        expect(md[jwt_uri_key]).to_not be_nil
      end
    end

    describe "#apply" do
      it "should not update the original hash with a jwt token" do
        md = { foo: "bar" }
        md[jwt_uri_key] = test_uri
        the_proc = @client.updater_proc
        got = the_proc.call md
        auth_header = md[auth_key]
        expect(auth_header).to be_nil
        expect(got[jwt_uri_key]).to be_nil
        expect(md[jwt_uri_key]).to_not be_nil
      end

      it "should add a jwt token to the returned hash" do
        md = { foo: "bar" }
        md[jwt_uri_key] = test_uri
        got = @client.apply md
        auth_header = got[auth_key]
        expect_is_encoded_jwt auth_header
      end
    end
  end
end

describe Google::Auth::ServiceAccountCredentials do
  ServiceAccountCredentials = Google::Auth::ServiceAccountCredentials
  let(:client_email) { "app@developer.gserviceaccount.com" }
  let :cred_json do
    {
      private_key_id: "a_private_key_id",
      private_key:    @key.to_pem,
      client_email:   client_email,
      client_id:      "app.apps.googleusercontent.com",
      type:           "service_account",
      project_id:     "a_project_id"
    }
  end

  before :example do
    @key = OpenSSL::PKey::RSA.new 2048
    @client = ServiceAccountCredentials.make_creds(
      json_key_io: StringIO.new(cred_json_text),
      scope:       "https://www.googleapis.com/auth/userinfo.profile"
    )
  end

  def make_auth_stubs opts = {}
    access_token = opts[:access_token] || ""
    body = MultiJson.dump("access_token" => access_token,
                          "token_type"   => "Bearer",
                          "expires_in"   => 3600)
    blk = proc do |request|
      params = Addressable::URI.form_unencode request.body
      _claim, _header = JWT.decode(params.assoc("assertion").last,
                                   @key.public_key, true,
                                   algorithm: "RS256")
    end
    stub_request(:post, "https://www.googleapis.com/oauth2/v4/token")
      .with(body: hash_including(
        "grant_type" => "urn:ietf:params:oauth:grant-type:jwt-bearer"
      ),
            &blk)
      .to_return(body:    body,
                 status:  200,
                 headers: { "Content-Type" => "application/json" })
  end

  def cred_json_text
    MultiJson.dump cred_json
  end

  it_behaves_like "apply/apply! are OK"

  context "when scope is nil" do
    before :example do
      @client.scope = nil
    end

    it_behaves_like "jwt header auth"
  end

  describe "#from_env" do
    before :example do
      @var_name = ENV_VAR
      @credential_vars = [
        ENV_VAR, PRIVATE_KEY_VAR, CLIENT_EMAIL_VAR, ACCOUNT_TYPE_VAR
      ]
      @original_env_vals = {}
      @credential_vars.each { |var| @original_env_vals[var] = ENV[var] }
      ENV[ACCOUNT_TYPE_VAR] = cred_json[:type]

      @scope = "https://www.googleapis.com/auth/userinfo.profile"
      @clz = ServiceAccountCredentials
    end

    after :example do
      @credential_vars.each { |var| ENV[var] = @original_env_vals[var] }
    end

    it "returns nil if the GOOGLE_APPLICATION_CREDENTIALS is unset" do
      ENV.delete @var_name unless ENV[@var_name].nil?
      expect(ServiceAccountCredentials.from_env(@scope)).to be_nil
    end

    it "returns nil if the GOOGLE_APPLICATION_CREDENTIALS is empty" do
      ENV[@var_name] = ""
      expect(ServiceAccountCredentials.from_env(@scope)).to be_nil
    end

    it "fails if the GOOGLE_APPLICATION_CREDENTIALS path does not exist" do
      ENV.delete @var_name unless ENV[@var_name].nil?
      expect(ServiceAccountCredentials.from_env(@scope)).to be_nil
      Dir.mktmpdir do |dir|
        key_path = File.join dir, "does-not-exist"
        ENV[@var_name] = key_path
        expect { @clz.from_env @scope }.to raise_error RuntimeError
      end
    end

    it "succeeds when the GOOGLE_APPLICATION_CREDENTIALS file is valid" do
      Dir.mktmpdir do |dir|
        key_path = File.join dir, "my_cert_file"
        FileUtils.mkdir_p File.dirname(key_path)
        File.write key_path, cred_json_text
        ENV[@var_name] = key_path
        expect(@clz.from_env(@scope)).to_not be_nil
      end
    end

    it "succeeds when GOOGLE_PRIVATE_KEY and GOOGLE_CLIENT_EMAIL env vars are"\
      " valid" do
      ENV[PRIVATE_KEY_VAR] = cred_json[:private_key]
      ENV[CLIENT_EMAIL_VAR] = cred_json[:client_email]
      expect(@clz.from_env(@scope)).to_not be_nil
    end

    it "sets project_id when the PROJECT_ID_VAR env var is set" do
      ENV[PRIVATE_KEY_VAR] = cred_json[:private_key]
      ENV[CLIENT_EMAIL_VAR] = cred_json[:client_email]
      ENV[PROJECT_ID_VAR] = cred_json[:project_id]
      ENV[ENV_VAR] = nil
      credentials = @clz.from_env @scope
      expect(credentials.project_id).to eq(cred_json[:project_id])
    end

    it "succeeds when GOOGLE_PRIVATE_KEY is escaped" do
      escaped_key = cred_json[:private_key].gsub "\n", '\n'
      ENV[PRIVATE_KEY_VAR] = "\"#{escaped_key}\""
      ENV[CLIENT_EMAIL_VAR] = cred_json[:client_email]
      expect(@clz.from_env(@scope)).to_not be_nil
    end

    it "propagates default_connection option" do
      ENV[PRIVATE_KEY_VAR] = cred_json[:private_key]
      ENV[CLIENT_EMAIL_VAR] = cred_json[:client_email]
      connection = Faraday.new headers: { "User-Agent" => "hello" }
      creds = @clz.from_env @scope, default_connection: connection
      expect(creds.build_default_connection).to be connection
    end
  end

  describe "#from_well_known_path" do
    before :example do
      @home = ENV["HOME"]
      @app_data = ENV["APPDATA"]
      @scope = "https://www.googleapis.com/auth/userinfo.profile"
      @known_path = WELL_KNOWN_PATH
      @clz = ServiceAccountCredentials
    end

    after :example do
      ENV["HOME"] = @home unless @home == ENV["HOME"]
      ENV["APPDATA"] = @app_data unless @app_data == ENV["APPDATA"]
    end

    it "is nil if no file exists" do
      ENV["HOME"] = File.dirname __FILE__
      expect(ServiceAccountCredentials.from_well_known_path(@scope)).to be_nil
    end

    it "successfully loads the file when it is present" do
      Dir.mktmpdir do |dir|
        key_path = File.join dir, ".config", @known_path
        key_path = File.join dir, WELL_KNOWN_PATH if OS.windows?
        FileUtils.mkdir_p File.dirname(key_path)
        File.write key_path, cred_json_text
        ENV["HOME"] = dir
        ENV["APPDATA"] = dir
        expect(@clz.from_well_known_path(@scope)).to_not be_nil
      end
    end

    it "successfully sets project_id when file is present" do
      Dir.mktmpdir do |dir|
        key_path = File.join dir, ".config", @known_path
        key_path = File.join dir, WELL_KNOWN_PATH if OS.windows?
        FileUtils.mkdir_p File.dirname(key_path)
        File.write key_path, cred_json_text
        ENV["HOME"] = dir
        ENV["APPDATA"] = dir
        credentials = @clz.from_well_known_path @scope
        expect(credentials.project_id).to eq(cred_json[:project_id])
      end
    end

    it "propagates default_connection option" do
      Dir.mktmpdir do |dir|
        key_path = File.join dir, ".config", @known_path
        key_path = File.join dir, WELL_KNOWN_PATH if OS.windows?
        FileUtils.mkdir_p File.dirname(key_path)
        File.write key_path, cred_json_text
        ENV["HOME"] = dir
        ENV["APPDATA"] = dir
        connection = Faraday.new headers: { "User-Agent" => "hello" }
        creds = @clz.from_well_known_path @scope, default_connection: connection
        expect(creds.build_default_connection).to be connection
      end
    end
  end

  describe "#from_system_default_path" do
    before :example do
      @scope = "https://www.googleapis.com/auth/userinfo.profile"
      @program_data = ENV["ProgramData"]
      @prefix = OS.windows? ? "/etc/Google/Auth/" : "/etc/google/auth/"
      @path = File.join @prefix, CREDENTIALS_FILE_NAME
      @clz = ServiceAccountCredentials
    end

    after :example do
      ENV["ProgramData"] = @program_data
    end

    it "is nil if no file exists" do
      FakeFS do
        expect(ServiceAccountCredentials.from_system_default_path(@scope))
          .to be_nil
      end
    end

    it "successfully loads the file when it is present" do
      FakeFS do
        ENV["ProgramData"] = "/etc"
        FileUtils.mkdir_p File.dirname(@path)
        File.write @path, cred_json_text
        expect(@clz.from_system_default_path(@scope)).to_not be_nil
        File.delete @path
      end
    end

    it "propagates default_connection option" do
      FakeFS do
        ENV["ProgramData"] = "/etc"
        FileUtils.mkdir_p File.dirname(@path)
        File.write @path, cred_json_text
        connection = Faraday.new headers: { "User-Agent" => "hello" }
        creds = @clz.from_system_default_path @scope, default_connection: connection
        expect(creds.build_default_connection).to be connection
        File.delete @path
      end
    end
  end
end

describe Google::Auth::ServiceAccountJwtHeaderCredentials do
  ServiceAccountJwtHeaderCredentials =
    Google::Auth::ServiceAccountJwtHeaderCredentials

  let(:client_email) { "app@developer.gserviceaccount.com" }
  let(:clz) { Google::Auth::ServiceAccountJwtHeaderCredentials }
  let :cred_json do
    {
      private_key_id: "a_private_key_id",
      private_key:    @key.to_pem,
      client_email:   client_email,
      client_id:      "app.apps.googleusercontent.com",
      type:           "service_account",
      project_id:     "a_project_id"
    }
  end

  before :example do
    @key = OpenSSL::PKey::RSA.new 2048
    @client = clz.make_creds json_key_io: StringIO.new(cred_json_text)
  end

  def cred_json_text
    MultiJson.dump cred_json
  end

  it_behaves_like "jwt header auth"

  describe "#from_env" do
    before :example do
      @var_name = ENV_VAR
      @credential_vars = [
        ENV_VAR, PRIVATE_KEY_VAR, CLIENT_EMAIL_VAR, ACCOUNT_TYPE_VAR
      ]
      @original_env_vals = {}
      @credential_vars.each { |var| @original_env_vals[var] = ENV[var] }
      ENV[ACCOUNT_TYPE_VAR] = cred_json[:type]
    end

    after :example do
      @credential_vars.each { |var| ENV[var] = @original_env_vals[var] }
    end

    it "returns nil if the GOOGLE_APPLICATION_CREDENTIALS is unset" do
      ENV.delete @var_name unless ENV[@var_name].nil?
      expect(clz.from_env).to be_nil
    end

    it "returns nil if the GOOGLE_APPLICATION_CREDENTIALS is empty" do
      ENV[@var_name] = ""
      expect(clz.from_env).to be_nil
    end

    it "fails if the GOOGLE_APPLICATION_CREDENTIALS path does not exist" do
      ENV.delete @var_name unless ENV[@var_name].nil?
      expect(clz.from_env).to be_nil
      Dir.mktmpdir do |dir|
        key_path = File.join dir, "does-not-exist"
        ENV[@var_name] = key_path
        expect { clz.from_env }.to raise_error RuntimeError
      end
    end

    it "succeeds when the GOOGLE_APPLICATION_CREDENTIALS file is valid" do
      Dir.mktmpdir do |dir|
        key_path = File.join dir, "my_cert_file"
        FileUtils.mkdir_p File.dirname(key_path)
        File.write key_path, cred_json_text
        ENV[@var_name] = key_path
        expect(clz.from_env).to_not be_nil
      end
    end

    it "succeeds when GOOGLE_PRIVATE_KEY and GOOGLE_CLIENT_EMAIL env vars are"\
      " valid" do
      ENV[PRIVATE_KEY_VAR] = cred_json[:private_key]
      ENV[CLIENT_EMAIL_VAR] = cred_json[:client_email]
      expect(clz.from_env(@scope)).to_not be_nil
    end

    it "sets project_id when the PROJECT_ID_VAR env var is set" do
      ENV[PRIVATE_KEY_VAR] = cred_json[:private_key]
      ENV[CLIENT_EMAIL_VAR] = cred_json[:client_email]
      ENV[PROJECT_ID_VAR] = cred_json[:project_id]
      ENV[ENV_VAR] = nil
      credentials = clz.from_env @scope
      expect(credentials).to_not be_nil
      expect(credentials.project_id).to eq(cred_json[:project_id])
    end
  end

  describe "#from_well_known_path" do
    before :example do
      @home = ENV["HOME"]
      @app_data = ENV["APPDATA"]
    end

    after :example do
      ENV["HOME"] = @home unless @home == ENV["HOME"]
      ENV["APPDATA"] = @app_data unless @app_data == ENV["APPDATA"]
    end

    it "is nil if no file exists" do
      ENV["HOME"] = File.dirname __FILE__
      expect(clz.from_well_known_path).to be_nil
    end

    it "successfully loads the file when it is present" do
      Dir.mktmpdir do |dir|
        key_path = File.join dir, ".config", WELL_KNOWN_PATH
        key_path = File.join dir, WELL_KNOWN_PATH if OS.windows?
        FileUtils.mkdir_p File.dirname(key_path)
        File.write key_path, cred_json_text
        ENV["HOME"] = dir
        ENV["APPDATA"] = dir
        expect(clz.from_well_known_path).to_not be_nil
      end
    end

    it "successfully sets project_id when file is present" do
      Dir.mktmpdir do |dir|
        key_path = File.join dir, ".config", WELL_KNOWN_PATH
        key_path = File.join dir, WELL_KNOWN_PATH if OS.windows?
        FileUtils.mkdir_p File.dirname(key_path)
        File.write key_path, cred_json_text
        ENV["HOME"] = dir
        ENV["APPDATA"] = dir
        credentials = clz.from_well_known_path @scope
        expect(credentials.project_id).to eq(cred_json[:project_id])
      end
    end
  end
end
