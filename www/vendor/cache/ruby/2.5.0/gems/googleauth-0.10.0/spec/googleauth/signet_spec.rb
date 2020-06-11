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
require "googleauth/signet"
require "jwt"
require "openssl"
require "spec_helper"

describe Signet::OAuth2::Client do
  before :example do
    @key = OpenSSL::PKey::RSA.new 2048
    @client = Signet::OAuth2::Client.new(
      token_credential_uri: "https://oauth2.googleapis.com/token",
      scope:                "https://www.googleapis.com/auth/userinfo.profile",
      issuer:               "app@example.com",
      audience:             "https://oauth2.googleapis.com/token",
      signing_key:          @key
    )
  end

  def make_auth_stubs opts
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
    with_params = { body: hash_including(
      "grant_type" => "urn:ietf:params:oauth:grant-type:jwt-bearer"
    ) }
    with_params[:headers] = { "User-Agent" => opts[:user_agent] } if opts[:user_agent]
    stub_request(:post, "https://oauth2.googleapis.com/token")
      .with(with_params, &blk)
      .to_return(body:    body,
                 status:  200,
                 headers: { "Content-Type" => "application/json" })
  end

  it_behaves_like "apply/apply! are OK"

  describe "#configure_connection" do
    it "honors default_connection" do
      token = "1/abcdef1234567890"
      stub = make_auth_stubs access_token: token, user_agent: "RubyRocks/1.0"
      conn = Faraday.new headers: { "User-Agent" => "RubyRocks/1.0" }
      @client.configure_connection default_connection: conn
      md = { foo: "bar" }
      @client.apply! md
      want = { foo: "bar", authorization: "Bearer #{token}" }
      expect(md).to eq(want)
      expect(stub).to have_been_requested
    end

    it "honors connection_builder" do
      token = "1/abcdef1234567890"
      stub = make_auth_stubs access_token: token, user_agent: "RubyRocks/2.0"
      connection_builder = proc do
        Faraday.new headers: { "User-Agent" => "RubyRocks/2.0" }
      end
      @client.configure_connection connection_builder: connection_builder
      md = { foo: "bar" }
      @client.apply! md
      want = { foo: "bar", authorization: "Bearer #{token}" }
      expect(md).to eq(want)
      expect(stub).to have_been_requested
    end
  end

  describe "#fetch_access_token!" do
    it "retries when orig_fetch_access_token! raises Signet::RemoteServerError" do
      mocked_responses = [:raise, :raise, "success"]
      allow(@client).to receive(:orig_fetch_access_token!).exactly(3).times do
        response = mocked_responses.shift
        response == :raise ? raise(Signet::RemoteServerError) : response
      end
      expect(@client.fetch_access_token!).to eq("success")
    end

    it "raises when the max retry count is exceeded" do
      mocked_responses = [:raise, :raise, :raise, :raise, :raise, :raise, "success"]
      allow(@client).to receive(:orig_fetch_access_token!).exactly(6).times do
        response = mocked_responses.shift
        response == :raise ? raise(Signet::RemoteServerError) : response
      end
      expect { @client.fetch_access_token! }.to raise_error Signet::AuthorizationError
    end

    it "does not retry and raises right away if it encounters a Signet::AuthorizationError" do
      allow(@client).to receive(:orig_fetch_access_token!).at_most(:once)
        .and_raise(Signet::AuthorizationError.new("Some Message"))
      expect { @client.fetch_access_token! }.to raise_error Signet::AuthorizationError
    end

    it "does not retry and raises right away if it encounters a Signet::ParseError" do
      allow(@client).to receive(:orig_fetch_access_token!).at_most(:once).and_raise(Signet::ParseError)
      expect { @client.fetch_access_token! }.to raise_error Signet::ParseError
    end
  end
end
