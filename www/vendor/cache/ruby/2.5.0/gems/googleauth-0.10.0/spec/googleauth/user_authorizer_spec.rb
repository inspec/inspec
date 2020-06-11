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
require "googleauth/user_authorizer"
require "uri"
require "multi_json"
require "spec_helper"

describe Google::Auth::UserAuthorizer do
  include TestHelpers

  let(:client_id) { Google::Auth::ClientId.new "testclient", "notasecret" }
  let(:scope) { %w[email profile] }
  let(:token_store) { DummyTokenStore.new }
  let(:callback_uri) { "https://www.example.com/oauth/callback" }
  let :authorizer do
    Google::Auth::UserAuthorizer.new(client_id,
                                     scope,
                                     token_store,
                                     callback_uri)
  end

  shared_examples "valid authorization url" do
    it "should have a valid base URI" do
      expect(uri).to match %r{https://accounts.google.com/o/oauth2/auth}
    end

    it "should request offline access" do
      expect(URI(uri).query).to match(/access_type=offline/)
    end

    it "should request response type code" do
      expect(URI(uri).query).to match(/response_type=code/)
    end

    it "should force approval" do
      expect(URI(uri).query).to match(/approval_prompt=force/)
    end

    it "should include granted scopes" do
      expect(URI(uri).query).to match(/include_granted_scopes=true/)
    end

    it "should include the correct client id" do
      expect(URI(uri).query).to match(/client_id=testclient/)
    end

    it "should not include a client secret" do
      expect(URI(uri).query).to_not match(/client_secret/)
    end

    it "should include the callback uri" do
      expect(URI(uri).query).to match(
        %r{redirect_uri=https://www.example.com/oauth/callback}
      )
    end

    it "should include the scope" do
      expect(URI(uri).query).to match(/scope=email%20profile/)
    end
  end

  context "when generating authorization URLs with user ID & state" do
    let :uri do
      authorizer.get_authorization_url login_hint: "user1", state: "mystate"
    end

    it_behaves_like "valid authorization url"

    it "includes a login hint" do
      expect(URI(uri).query).to match(/login_hint=user1/)
    end

    it "includes the app state" do
      expect(URI(uri).query).to match(/state=mystate/)
    end
  end

  context "when generating authorization URLs with user ID and no state" do
    let(:uri) { authorizer.get_authorization_url login_hint: "user1" }

    it_behaves_like "valid authorization url"

    it "includes a login hint" do
      expect(URI(uri).query).to match(/login_hint=user1/)
    end

    it "does not include the state parameter" do
      expect(URI(uri).query).to_not match(/state/)
    end
  end

  context "when generating authorization URLs with no user ID and no state" do
    let(:uri) { authorizer.get_authorization_url }

    it_behaves_like "valid authorization url"

    it "does not include the login hint parameter" do
      expect(URI(uri).query).to_not match(/login_hint/)
    end

    it "does not include the state parameter" do
      expect(URI(uri).query).to_not match(/state/)
    end
  end

  context "when retrieving tokens" do
    let :token_json do
      MultiJson.dump(
        access_token:           "accesstoken",
        refresh_token:          "refreshtoken",
        expiration_time_millis: 1_441_234_742_000
      )
    end

    context "with a valid user id" do
      let :credentials do
        token_store.store "user1", token_json
        authorizer.get_credentials "user1"
      end

      it "should return an instance of UserRefreshCredentials" do
        expect(credentials).to be_instance_of(
          Google::Auth::UserRefreshCredentials
        )
      end

      it "should return credentials with a valid refresh token" do
        expect(credentials.refresh_token).to eq "refreshtoken"
      end

      it "should return credentials with a valid access token" do
        expect(credentials.access_token).to eq "accesstoken"
      end

      it "should return credentials with a valid client ID" do
        expect(credentials.client_id).to eq "testclient"
      end

      it "should return credentials with a valid client secret" do
        expect(credentials.client_secret).to eq "notasecret"
      end

      it "should return credentials with a valid scope" do
        expect(credentials.scope).to eq %w[email profile]
      end

      it "should return credentials with a valid expiration time" do
        expect(credentials.expires_at).to eq Time.at(1_441_234_742)
      end
    end

    context "with an invalid user id" do
      it "should return nil" do
        expect(authorizer.get_credentials("notauser")).to be_nil
      end
    end
  end

  context "when saving tokens" do
    let(:expiry) { Time.now.to_i }
    let :credentials do
      Google::Auth::UserRefreshCredentials.new(
        client_id:     client_id.id,
        client_secret: client_id.secret,
        scope:         scope,
        refresh_token: "refreshtoken",
        access_token:  "accesstoken",
        expires_at:    expiry
      )
    end

    let :token_json do
      authorizer.store_credentials "user1", credentials
      token_store.load "user1"
    end

    it "should persist in the token store" do
      expect(token_json).to_not be_nil
    end

    it "should persist the refresh token" do
      expect(MultiJson.load(token_json)["refresh_token"]).to eq "refreshtoken"
    end

    it "should persist the access token" do
      expect(MultiJson.load(token_json)["access_token"]).to eq "accesstoken"
    end

    it "should persist the client id" do
      expect(MultiJson.load(token_json)["client_id"]).to eq "testclient"
    end

    it "should persist the scope" do
      expect(MultiJson.load(token_json)["scope"]).to include("email", "profile")
    end

    it "should persist the expiry as milliseconds" do
      expected_expiry = expiry * 1000
      expect(MultiJson.load(token_json)["expiration_time_millis"]).to eql(
        expected_expiry
      )
    end
  end

  context "with valid authorization code" do
    let :token_json do
      MultiJson.dump("access_token" => "1/abc123",
                     "token_type"   => "Bearer",
                     "expires_in"   => 3600)
    end

    before :example do
      stub_request(:post, "https://oauth2.googleapis.com/token")
        .to_return(body: token_json, status: 200, headers: {
                     "Content-Type" => "application/json"
                   })
    end

    it "should exchange a code for credentials" do
      credentials = authorizer.get_credentials_from_code(
        user_id: "user1", code: "code"
      )
      expect(credentials.access_token).to eq "1/abc123"
    end

    it "should not store credentials when get only requested" do
      authorizer.get_credentials_from_code user_id: "user1", code: "code"
      expect(token_store.load("user1")).to be_nil
    end

    it "should store credentials when requested" do
      authorizer.get_and_store_credentials_from_code(
        user_id: "user1", code: "code"
      )
      expect(token_store.load("user1")).to_not be_nil
    end
  end

  context "with invalid authorization code" do
    before :example do
      stub_request(:post, "https://oauth2.googleapis.com/token")
        .to_return(status: 400)
    end

    it "should raise an authorization error" do
      expect do
        authorizer.get_credentials_from_code user_id: "user1", code: "badcode"
      end.to raise_error Signet::AuthorizationError
    end

    it "should not store credentials when exchange fails" do
      expect do
        authorizer.get_credentials_from_code user_id: "user1", code: "badcode"
      end.to raise_error Signet::AuthorizationError
      expect(token_store.load("user1")).to be_nil
    end
  end

  context "when reovking authorization" do
    let :token_json do
      MultiJson.dump(
        access_token:           "accesstoken",
        refresh_token:          "refreshtoken",
        expiration_time_millis: 1_441_234_742_000
      )
    end

    before :example do
      token_store.store "user1", token_json
      stub_request(:post, "https://oauth2.googleapis.com/revoke")
        .with(body: hash_including("token" => "refreshtoken"))
        .to_return(status: 200)
    end

    it "should revoke the grant" do
      authorizer.revoke_authorization "user1"
      expect(a_request(
        :post, "https://oauth2.googleapis.com/revoke"
      ).with(body: hash_including("token" => "refreshtoken")))
        .to have_been_made
    end

    it "should remove the token from storage" do
      authorizer.revoke_authorization "user1"
      expect(token_store.load("user1")).to be_nil
    end
  end

  # TODO: - Test that tokens are monitored
  # TODO - Test scope enforcement (auth if upgrade required)
end
