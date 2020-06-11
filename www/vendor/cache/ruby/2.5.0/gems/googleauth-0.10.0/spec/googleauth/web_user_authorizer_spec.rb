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

require "googleauth"
require "googleauth/web_user_authorizer"
require "uri"
require "multi_json"
require "spec_helper"
require "rack"

describe Google::Auth::WebUserAuthorizer do
  include TestHelpers

  let(:client_id) { Google::Auth::ClientId.new "testclient", "notasecret" }
  let(:scope) { %w[email profile] }
  let(:token_store) { DummyTokenStore.new }
  let :authorizer do
    Google::Auth::WebUserAuthorizer.new client_id, scope, token_store
  end

  describe "#get_authorization_url" do
    let :env do
      Rack::MockRequest.env_for(
        "http://example.com:8080/test",
        "REMOTE_ADDR" => "10.10.10.10"
      )
    end
    let(:request) { Rack::Request.new env }
    it "should include current url in state" do
      url = authorizer.get_authorization_url request: request
      expect(url).to match(
        %r{%22current_uri%22:%22http://example.com:8080/test%22}
      )
    end

    it "should allow adding custom state key-value pairs" do
      url = authorizer.get_authorization_url request: request, state: { james: "bond", kind: 1 }
      expect(url).to match(%r{%22james%22:%22bond%22})
      expect(url).to match(%r{%22kind%22:1})
    end

    it "should include request forgery token in state" do
      expect(SecureRandom).to receive(:base64).and_return("aGVsbG8=")
      url = authorizer.get_authorization_url request: request
      expect(url).to match(/%22session_id%22:%22aGVsbG8=%22/)
    end

    it "should include request forgery token in session" do
      expect(SecureRandom).to receive(:base64).and_return("aGVsbG8=")
      authorizer.get_authorization_url request: request
      expect(request.session["g-xsrf-token"]).to eq "aGVsbG8="
    end

    it "should resolve callback against base URL" do
      url = authorizer.get_authorization_url request: request
      expect(url).to match(
        %r{redirect_uri=http://example.com:8080/oauth2callback}
      )
    end

    it "should allow overriding the current URL" do
      url = authorizer.get_authorization_url(
        request:     request,
        redirect_to: "/foo"
      )
      expect(url).to match %r{%22current_uri%22:%22/foo%22}
    end

    it "should pass through login hint" do
      url = authorizer.get_authorization_url(
        request:    request,
        login_hint: "user@example.com"
      )
      expect(url).to match(/login_hint=user@example.com/)
    end
  end

  shared_examples "handles callback" do
    let :token_json do
      MultiJson.dump("access_token" => "1/abc123",
                     "token_type"   => "Bearer",
                     "expires_in"   => 3600)
    end

    before :example do
      stub_request(:post, "https://oauth2.googleapis.com/token")
        .to_return(body:    token_json,
                   status:  200,
                   headers: { "Content-Type" => "application/json" })
    end

    let :env do
      Rack::MockRequest.env_for(
        "http://example.com:8080/oauth2callback?code=authcode&"\
        "state=%7B%22current_uri%22%3A%22%2Ffoo%22%2C%22"\
        "session_id%22%3A%22abc%22%7D",
        "REMOTE_ADDR" => "10.10.10.10"
      )
    end
    let(:request) { Rack::Request.new env }

    before :example do
      request.session["g-xsrf-token"] = "abc"
    end

    it "should return credentials when valid code present" do
      expect(credentials).to be_instance_of(
        Google::Auth::UserRefreshCredentials
      )
    end

    it "should return next URL to redirect to" do
      expect(next_url).to eq "/foo"
    end

    it "should fail if xrsf token in session and does not match request" do
      request.session["g-xsrf-token"] = "123"
      expect { credentials }.to raise_error(Signet::AuthorizationError)
    end
  end

  describe "#handle_auth_callback" do
    let(:result) { authorizer.handle_auth_callback "user1", request }
    let(:credentials) { result[0] }
    let(:next_url) { result[1] }

    it_behaves_like "handles callback"
  end

  describe "#handle_auth_callback_deferred and #get_credentials" do
    let :next_url do
      Google::Auth::WebUserAuthorizer.handle_auth_callback_deferred request
    end

    let :credentials do
      next_url
      authorizer.get_credentials "user1", request
    end

    it_behaves_like "handles callback"
  end
end
