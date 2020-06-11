# Copyright (C) 2010 Google Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
require "spec_helper"
require "signet/oauth_2/client"
require "openssl"
require "jwt"
require "date"

conn = Faraday.default_connection

def build_json_response payload
  [200, { "Content-Type" => "application/json; charset=utf-8" }, MultiJson.dump(payload)]
end

def build_form_encoded_response payload
  [200, { "Content-Type" => "application/json; charset=utf-8" }, Addressable::URI.form_encode(payload)]
end

describe Signet::OAuth2::Client, "unconfigured" do
  before do
    @client = Signet::OAuth2::Client.new
  end
  it "should allow additional paraemters to be set." do
    @client.additional_parameters["type"] = "web_server"
    expect(@client.additional_parameters).to eq({ "type" => "web_server" })
  end
  it "should raise an error if a bogus scope is provided" do
    expect(lambda do
      @client = Signet::OAuth2::Client.new scope: :bogus
    end).to raise_error(TypeError)
  end

  it "should raise an error if a scope array is provided with spaces" do
    expect(lambda do
      @client = Signet::OAuth2::Client.new(
        scope: ["legit", "bogus bogus"]
      )
    end).to raise_error(ArgumentError)
  end

  it "should allow the scope to be set to a String" do
    @client.scope = "legit"
    expect(@client.scope).to eq ["legit"]
    @client.scope = "legit alsolegit"
    expect(@client.scope).to eq ["legit", "alsolegit"]
  end

  it "should allow the scope to be set to an Array" do
    @client.scope = ["legit"]
    expect(@client.scope).to eq ["legit"]
    @client.scope = ["legit", "alsolegit"]
    expect(@client.scope).to eq ["legit", "alsolegit"]
  end

  it "should raise an error if a bogus redirect URI is provided" do
    expect(lambda do
      @client = Signet::OAuth2::Client.new redirect_uri: :bogus
    end).to raise_error(TypeError)
  end

  it "should raise an error if a relative redirect URI is provided" do
    expect(lambda do
      @client = Signet::OAuth2::Client.new redirect_uri: "/relative/path"
    end).to raise_error(ArgumentError)
  end

  it 'should allow "postmessage" as a redirect URI (Google hack)' do
    @client.authorization_uri = "https://example.com/authorize"
    @client.client_id = "s6BhdRkqt3"
    @client.redirect_uri = "postmessage"
    expect(@client.authorization_uri.query_values["redirect_uri"]).to eq "postmessage"
  end

  it "should allow oob values as a redirect URI (for installed apps)" do
    @client.authorization_uri = "https://example.com/authorize"
    @client.client_id = "s6BhdRkqt3"
    @client.redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
    expect(@client.authorization_uri.query_values["redirect_uri"]).to eq "urn:ietf:wg:oauth:2.0:oob"
    @client.redirect_uri = "oob"
    expect(@client.authorization_uri.query_values["redirect_uri"]).to eq "oob"
  end

  it "should have no authorization_uri" do
    expect(@client.authorization_uri).to eq nil
  end

  it "should allow the authorization_uri to be set to a String" do
    @client.authorization_uri = "https://example.com/authorize"
    @client.client_id = "s6BhdRkqt3"
    @client.redirect_uri = "https://example.client.com/callback"
    expect(@client.authorization_uri.to_s).to include(
      "https://example.com/authorize"
    )
    expect(@client.authorization_uri.query_values["client_id"]).to eq "s6BhdRkqt3"
    expect(@client.authorization_uri.query_values["redirect_uri"]).to eq(
      "https://example.client.com/callback"
    )
  end

  it "should allow the authorization_uri to be set to a Hash" do
    @client.authorization_uri = {
      scheme: "https", host: "example.com", path: "/authorize"
    }
    @client.client_id = "s6BhdRkqt3"
    @client.redirect_uri = "https://example.client.com/callback"
    expect(@client.authorization_uri.to_s).to include(
      "https://example.com/authorize"
    )
    expect(@client.authorization_uri.query_values["client_id"]).to eq "s6BhdRkqt3"
    expect(@client.authorization_uri.query_values["redirect_uri"]).to eq( 
      "https://example.client.com/callback"
    )
  end

  it "should allow the authorization_uri to be set to a URI" do
    @client.authorization_uri =
      Addressable::URI.parse "https://example.com/authorize"
    @client.client_id = "s6BhdRkqt3"
    @client.redirect_uri =
      Addressable::URI.parse "https://example.client.com/callback"
    expect(@client.authorization_uri.to_s).to include(
      "https://example.com/authorize"
    )
    expect(@client.authorization_uri.query_values["client_id"]).to eq "s6BhdRkqt3"
    expect(@client.authorization_uri.query_values["redirect_uri"]).to eq(
      "https://example.client.com/callback"
    )
  end

  it "should require a redirect URI when getting the authorization_uri" do
    @client.authorization_uri =
      Addressable::URI.parse "https://example.com/authorize"
    @client.client_id = "s6BhdRkqt3"
    expect(lambda do
      @client.authorization_uri
    end).to raise_error(ArgumentError)
  end

  it "should require a client ID when getting the authorization_uri" do
    @client.authorization_uri =
      Addressable::URI.parse "https://example.com/authorize"
    @client.redirect_uri =
      Addressable::URI.parse "https://example.client.com/callback"
    expect(lambda do
      @client.authorization_uri
    end).to raise_error(ArgumentError)
  end

  it "should have no token_credential_uri" do
    expect(@client.token_credential_uri).to eq nil
  end

  it "should allow the token_credential_uri to be set to a String" do
    @client.token_credential_uri = "https://example.com/token"
    expect(@client.token_credential_uri.to_s).to eq "https://example.com/token"
  end

  it "should allow the token_credential_uri to be set to a Hash" do
    @client.token_credential_uri = {
      scheme: "https", host: "example.com", path: "/token"
    }
    expect(@client.token_credential_uri.to_s).to eq "https://example.com/token"
  end

  it "should allow the token_credential_uri to be set to a URI" do
    @client.token_credential_uri =
      Addressable::URI.parse "https://example.com/token"
    expect(@client.token_credential_uri.to_s).to eq "https://example.com/token"
  end
end

describe Signet::OAuth2::Client, "configured for assertions profile" do
  describe "when using RSA keys" do
    before do
      @key = OpenSSL::PKey::RSA.new 2048
      @client = Signet::OAuth2::Client.new(
        token_credential_uri: "https://oauth2.googleapis.com/token",
        scope:                "https://www.googleapis.com/auth/userinfo.profile",
        issuer:               "app@example.com",
        audience:             "https://oauth2.googleapis.com/token",
        signing_key:          @key
      )
    end

    it "should generate valid JWTs" do
      jwt = @client.to_jwt
      expect(jwt).not_to be_nil

      claim, header = JWT.decode jwt, @key.public_key, true, algorithm: "RS256"
      expect(claim["iss"]).to eq "app@example.com"
      expect(claim["scope"]).to eq "https://www.googleapis.com/auth/userinfo.profile"
      expect(claim["aud"]).to eq "https://oauth2.googleapis.com/token"
    end

    it "should generate valid JWTs for impersonation" do
      @client.principal = "user@example.com"
      jwt = @client.to_jwt
      expect(jwt).not_to be_nil

      claim, header = JWT.decode jwt, @key.public_key, true, algorithm: "RS256"
      expect(claim["iss"]).to eq "app@example.com"
      expect(claim["prn"]).to eq "user@example.com"
      expect(claim["scope"]).to eq "https://www.googleapis.com/auth/userinfo.profile"
      expect(claim["aud"]).to eq "https://oauth2.googleapis.com/token"
    end

    it "should generate valid JWTs for impersonation using deprecated person attribute" do
      @client.person = "user@example.com"
      jwt = @client.to_jwt
      expect(jwt).not_to be_nil

      claim, header = JWT.decode jwt, @key.public_key, true, algorithm: "RS256"
      expect(claim["iss"]).to eq "app@example.com"
      expect(claim["prn"]).to eq "user@example.com"
      expect(claim["scope"]).to eq "https://www.googleapis.com/auth/userinfo.profile"
      expect(claim["aud"]).to eq "https://oauth2.googleapis.com/token"
    end

    it "should generate valid JWTs for impersonation using the sub attribute" do
      @client.sub = "user@example.com"
      jwt = @client.to_jwt
      expect(jwt).not_to be_nil

      claim, header = JWT.decode jwt, @key.public_key, true, algorithm: "RS256"
      expect(claim["iss"]).to eq "app@example.com"
      expect(claim["sub"]).to eq "user@example.com"
      expect(claim["scope"]).to eq "https://www.googleapis.com/auth/userinfo.profile"
      expect(claim["aud"]).to eq "https://oauth2.googleapis.com/token"
    end

    it "should generate a JSON representation of the client" do
      @client.principal = "user@example.com"
      json = @client.to_json
      expect(json).not_to be_nil

      deserialized = MultiJson.load json
      expect(deserialized["token_credential_uri"]).to eq "https://oauth2.googleapis.com/token"
      expect(deserialized["scope"]).to eq ["https://www.googleapis.com/auth/userinfo.profile"]
      expect(deserialized["issuer"]).to eq "app@example.com"
      expect(deserialized["audience"]).to eq "https://oauth2.googleapis.com/token"
      expect(deserialized["signing_key"]).to eq @key.to_s
    end

    it "should send valid access token request" do
      stubs = Faraday::Adapter::Test::Stubs.new do |stub|
        stub.post "/token" do |env|
          params = Addressable::URI.form_unencode env[:body]
          claim, header = JWT.decode params.assoc("assertion").last, @key.public_key, true, algorithm: "RS256"
          expect(params.assoc("grant_type")).to eq ["grant_type", "urn:ietf:params:oauth:grant-type:jwt-bearer"]
          build_json_response(
            "access_token" => "1/abcdef1234567890",
            "token_type"   => "Bearer",
            "expires_in"   => 3600
          )
        end
      end
      connection = Faraday.new url: "https://www.google.com" do |builder|
        builder.adapter :test, stubs
      end

      @client.fetch_access_token! connection: connection
      expect(@client.access_token).to eq "1/abcdef1234567890"
      stubs.verify_stubbed_calls
    end
  end

  describe "when using shared secrets" do
    before do
      @key = "my secret key"
      @client = Signet::OAuth2::Client.new(
        token_credential_uri: "https://oauth2.googleapis.com/token",
        scope:                "https://www.googleapis.com/auth/userinfo.profile",
        issuer:               "app@example.com",
        audience:             "https://oauth2.googleapis.com/token",
        signing_key:          @key
      )
    end

    it "should generate valid JWTs" do
      jwt = @client.to_jwt
      expect(jwt).not_to be_nil

      claim, header = JWT.decode jwt, @key, true, algorithm: "HS256"
      expect(claim["iss"]).to eq "app@example.com"
      expect(claim["scope"]).to eq "https://www.googleapis.com/auth/userinfo.profile"
      expect(claim["aud"]).to eq "https://oauth2.googleapis.com/token"
    end
  end
end

describe Signet::OAuth2::Client, "configured for Google userinfo API" do
  before do
    @client = Signet::OAuth2::Client.new(
      authorization_uri:    "https://accounts.google.com/o/oauth2/auth",
      token_credential_uri: "https://oauth2.googleapis.com/token",
      scope:                "https://www.googleapis.com/auth/userinfo.profile"
    )
  end

  it "should not have a grant type by default" do
    expect(@client.grant_type).to eq nil
  end

  it "should use the authorization_code grant type if given code" do
    @client.code = "00000"
    @client.redirect_uri = "http://www.example.com/"
    expect(@client.grant_type).to eq "authorization_code"
  end

  it "should use the refresh_token grant type if given refresh token" do
    @client.refresh_token = "54321"
    expect(@client.grant_type).to eq "refresh_token"
  end

  it "should use the password grant type if given username and password" do
    @client.username = "johndoe"
    @client.password = "incognito"
    expect(@client.grant_type).to eq "password"
  end

  it "should allow the grant type to be set manually" do
    @client.grant_type = "authorization_code"
    expect(@client.grant_type).to eq "authorization_code"
    @client.grant_type = "refresh_token"
    expect(@client.grant_type).to eq "refresh_token"
    @client.grant_type = "password"
    expect(@client.grant_type).to eq "password"
  end

  it "should allow the grant type to be set to an extension" do
    @client.grant_type = "urn:ietf:params:oauth:grant-type:saml2-bearer"
    @client.extension_parameters["assertion"] =
      "PEFzc2VydGlvbiBJc3N1ZUluc3RhbnQ9IjIwMTEtMDU"

    expect(@client.grant_type).to eq Addressable::URI.parse("urn:ietf:params:oauth:grant-type:saml2-bearer")
    expect(@client.extension_parameters).to eq ({ "assertion" => "PEFzc2VydGlvbiBJc3N1ZUluc3RhbnQ9IjIwMTEtMDU" })
  end

  it "should raise an error if extension parameters are bogus" do
    expect(lambda do
      @client.extension_parameters = :bogus
    end).to raise_error(TypeError)
  end

  it "should include extension parameters in token request" do
    @client.grant_type = "urn:ietf:params:oauth:grant-type:saml2-bearer"
    @client.extension_parameters["assertion"] =
      "PEFzc2VydGlvbiBJc3N1ZUluc3RhbnQ9IjIwMTEtMDU"

    request = @client.generate_access_token_request
    expect(request).to include("assertion" => "PEFzc2VydGlvbiBJc3N1ZUluc3RhbnQ9IjIwMTEtMDU")
  end

  it "should include the scope in token request" do
    @client.scope = ["https://www.googleapis.com/auth/userinfo.profile"]

    request = @client.generate_access_token_request use_configured_scope: true
    expect(request).to include("scope" => ["https://www.googleapis.com/auth/userinfo.profile"])
  end

  it "should allow the token to be updated" do
    issued_at = Time.now
    @client.update_token!(
      :access_token  => "12345",
      refresh_token: "54321",
      :expires_in    => 3600,
      :issued_at     => issued_at
    )
    expect(@client.access_token).to eq "12345"
    expect(@client.refresh_token).to eq "54321"
    expect(@client.expires_in).to eq 3600
    expect(@client.issued_at).to eq issued_at
    expect(@client).to_not be_expired
  end

  it "should handle expires as equivalent to expires_in" do
    issued_at = Time.now
    @client.update_token!(
      :access_token  => "12345",
      refresh_token: "54321",
      :expires       => 600,
      :issued_at     => issued_at
    )
    expect(@client.expires_in).to eq 600
  end

  it "should allow the token to be updated without an expiration" do
    @client.update_token!(
      :access_token  => "12345",
      refresh_token: "54321"
    )
    expect(@client.access_token).to eq "12345"
    expect(@client.refresh_token).to eq "54321"
    expect(@client.expires_in).to eq nil
    expect(@client.issued_at).to eq nil
    expect(@client).to_not be_expired
  end

  it "should allow the token expiration to be cleared" do
    issued_at = Time.now
    @client.update_token!(
      :access_token  => "12345",
      refresh_token: "54321",
      :expires_in    => 3600,
      :issued_at     => issued_at
    )
    @client.expires_in = nil
    @client.issued_at = nil
    expect(@client).to_not be_expired
  end

  it "should allow the expires_at time to be updated" do
    expires_at = Time.now
    @client.update_token!(
      expires_at: expires_at.to_i,
      expires_in: nil
    )
    expect(@client.expires_at).to be_within(1).of(expires_at)
    expect(@client).to be_expired
  end

  it "should calculate the expires_at from issued_at when issued_at is set" do
    expires_in = 3600
    issued_at = Time.now - expires_in
    @client.update_token!(
      :issued_at  => issued_at,
      expires_in: expires_in
    )
    expect(@client.expires_at).to eq issued_at + expires_in
    expect(@client).to be_expired
  end

  it "should calculate expires_at from Time.now when issed_at is NOT set" do
    expires_in = 3600
    expires_at = Time.now + expires_in
    @client.update_token! expires_in: expires_in
    expect(@client.expires_at).to be_within(1).of(expires_at)
    expect(@client).to_not be_expired
  end

  # This test is to document the way that expires_in has always been used:
  # If expires_in is set on the client, it always resets the issued_at time
  # to Time.now
  it "sets issued_at to Time.now when expires_in is not set through update_token!" do
    one_hour = 3600
    issued_at = Time.now - (2 * one_hour)
    current_time = Time.now

    @client.issued_at = issued_at
    @client.expires_in = one_hour

    expect(@client.issued_at).to_not eq issued_at
    expect(@client.issued_at).to be_within(1).of(current_time)
    expect(@client).to_not be_expired
  end

  it "should allow setting expires_at manually" do
    expires_at = Time.now + 100
    @client.expires_at = expires_at.to_i
    expect(@client.expires_at).to be_within(1).of(expires_at)
    expect(@client).to_not be_expired
  end

  it "should normalize values of expires_at to instances of time" do
    time_formats = [DateTime.new, "12:00", 100, Time.new]
    normalized_time_formats = []
    time_formats.each do |time|
      @client.expires_at = time
      normalized_time_formats << @client.expires_at
    end
    normalized_time_formats.each do |time|
      expect(time).to be_an_instance_of(Time)
    end
  end

  it "should set expires_in when expires_at is set" do
    issued_at = Time.now
    expires_at = Time.now + 100
    @client.expires_at = expires_at.to_i
    @client.issued_at = issued_at
    expect(@client.expires_in).to be_within(1).of (expires_at - issued_at).to_i
    @client.expires_at = nil
    expect(@client.expires_in).to be_nil
  end

  it "should set expires_in to nil when expires_at is set to nil" do
    @client.expires_at = nil
    expect(@client.expires_in).to be_nil
  end

  it "should set expires_at when expires_in is set" do
    expires_in = 100
    @client.expires_in = expires_in
    expect(@client.expires_at).to eq (@client.issued_at + expires_in)
    @client.expires_in = nil
    expect(@client.expires_at).to be_nil
  end

  it "should set expires_at to nil when expires_in is set to nil" do
    @client.expires_in = nil
    expect(@client.expires_at).to be_nil
  end

  it "should indicate the token is not expired if expired_at nil" do
    @client.expires_at = nil
    expect(@client.expires_within?(60)).to be false
    expect(@client.expired?).to be false
  end

  it "should indicate the token is not expiring when expiry beyond window" do
    @client.expires_at = Time.now + 100
    expect(@client.expires_within?(60)).to be false
  end

  it "should indicate the token is expiring soon when expiry within window" do
    @client.expires_at = Time.now + 30
    expect(@client.expires_within?(60)).to be true
  end

  it "should raise an error if the authorization endpoint is not secure" do
    @client.client_id = "client-12345"
    @client.client_secret = "secret-12345"
    @client.redirect_uri = "http://www.example.com/"
    @client.authorization_uri = "http://accounts.google.com/o/oauth2/auth"
    expect(lambda do
      @client.authorization_uri
    end).to raise_error(Signet::UnsafeOperationError)
  end

  it "should raise an error if token credential URI is missing" do
    @client.token_credential_uri = nil
    expect(lambda do
      @client.fetch_access_token!
    end).to raise_error(ArgumentError)
  end

  it "should raise an error if unauthorized" do
    @client.client_id = "client-12345"
    @client.client_secret = "secret-12345"
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.post "/token" do
        [401, {}, "User authorization failed or something."]
      end
    end
    expect(lambda do
      connection = Faraday.new url: "https://www.google.com" do |builder|
        builder.adapter :test, stubs
      end
      @client.fetch_access_token!(
        connection: connection
      )
    end).to raise_error(Signet::AuthorizationError)
    stubs.verify_stubbed_calls
  end

  it "should raise a remote server error if the server gives a 5xx status" do
    @client.client_id = "client-12345"
    @client.client_secret = "secret-12345"
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.post "/token" do
        [509, {}, "Rate limit hit or something."]
      end
    end
    expect(lambda do
      connection = Faraday.new url: "https://www.google.com" do |builder|
        builder.adapter :test, stubs
      end
      @client.fetch_access_token!(
        connection: connection
      )
    end).to raise_error(Signet::RemoteServerError)
    stubs.verify_stubbed_calls
  end

  it "should raise an unexpected error if the token server gives an unexpected status" do
    @client.client_id = "client-12345"
    @client.client_secret = "secret-12345"
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.post "/token" do
        [309, {}, "Rate limit hit or something."]
      end
    end
    expect(lambda do
      connection = Faraday.new url: "https://www.google.com" do |builder|
        builder.adapter :test, stubs
      end
      @client.fetch_access_token!(
        connection: connection
      )
    end).to raise_error(Signet::UnexpectedStatusError)
    stubs.verify_stubbed_calls
  end

  it "should correctly fetch an access token" do
    @client.client_id = "client-12345"
    @client.client_secret = "secret-12345"
    @client.code = "00000"
    @client.redirect_uri = "https://www.example.com/"
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.post "/token" do
        build_json_response(
          "access_token"  => "12345",
          "refresh_token" => "54321",
          "expires_in"    => "3600"
        )
      end
    end
    connection = Faraday.new url: "https://www.google.com" do |builder|
      builder.adapter :test, stubs
    end
    @client.fetch_access_token!(
      connection: connection
    )
    expect(@client.access_token).to eq "12345"
    expect(@client.refresh_token).to eq "54321"
    expect(@client.expires_in).to eq 3600
    stubs.verify_stubbed_calls
  end

  it "should correctly fetch an access token with a password" do
    @client.client_id = "client-12345"
    @client.client_secret = "secret-12345"
    @client.username = "johndoe"
    @client.password = "incognito"
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.post "/token" do
        build_json_response(
          "access_token"  => "12345",
          "refresh_token" => "54321",
          "expires_in"    => "3600"
        )
      end
    end
    connection = Faraday.new url: "https://www.google.com" do |builder|
      builder.adapter :test, stubs
    end
    @client.fetch_access_token!(
      connection: connection
    )
    expect(@client.access_token).to eq "12345"
    expect(@client.refresh_token).to eq "54321"
    expect(@client.expires_in).to eq 3600
    stubs.verify_stubbed_calls
  end

  it "should correctly refresh an access token" do
    @client.client_id = "client-12345"
    @client.client_secret = "secret-12345"
    @client.refresh_token = "54321"
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.post "/token" do
        build_json_response(
          "access_token"  => "12345",
          "refresh_token" => "54321",
          "expires_in"    => "3600"
        )
      end
    end
    connection = Faraday.new url: "https://www.google.com" do |builder|
      builder.adapter :test, stubs
    end
    @client.fetch_access_token!(
      connection: connection
    )
    expect(@client.access_token).to eq "12345"
    expect(@client.refresh_token).to eq "54321"
    expect(@client.expires_in).to eq 3600
    stubs.verify_stubbed_calls
  end

  it "should detect unintential grant type of none" do
    @client.client_id = "client-12345"
    @client.client_secret = "secret-12345"
    @client.redirect_uri = "https://www.example.com/"
    expect(lambda do
      @client.fetch_access_token!
    end).to raise_error(ArgumentError)
  end

  it "should correctly fetch protected resources" do
    @client.client_id = "client-12345"
    @client.client_secret = "secret-12345"
    @client.access_token = "12345"
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get "/oauth2/v1/userinfo?alt=json" do
        [200, {}, <<~JSON]
{
  "id": "116452824309856782163",
  "name": "Bob Aman",
  "given_name": "Bob",
  "family_name": "Aman",
  "link": "https://plus.google.com/116452824309856782163"
}
        JSON
      end
    end
    connection = Faraday.new url: "https://www.googleapis.com" do |builder|
      builder.adapter :test, stubs
    end
    response = @client.fetch_protected_resource(
      connection: connection,
      uri:        "https://www.googleapis.com/oauth2/v1/userinfo?alt=json"
    )
    expect(response.status).to eq 200
    expect(response.body).to eq <<~JSON
{
  "id": "116452824309856782163",
  "name": "Bob Aman",
  "given_name": "Bob",
  "family_name": "Aman",
  "link": "https://plus.google.com/116452824309856782163"
}
    JSON
    stubs.verify_stubbed_calls
  end

  it "should correctly send the realm in the Authorization header" do
    @client.client_id = "client-12345"
    @client.client_secret = "secret-12345"
    @client.access_token = "12345"
    connection = Faraday.new url: "https://www.googleapis.com" do |builder|
      builder.adapter :test
    end
    request = @client.generate_authenticated_request(
      connection: connection,
      realm:      "Example",
      request:    conn.build_request(:get) do |req|
        req.url "https://www.googleapis.com/oauth2/v1/userinfo?alt=json"
      end
    )
    expect(request.headers["Authorization"]).to eq 'Bearer 12345, realm="Example"'
  end

  it "should correctly send the realm in the Authorization header" do
    @client.client_id = "client-12345"
    @client.client_secret = "secret-12345"
    @client.access_token = "12345"
    connection = Faraday.new url: "https://www.googleapis.com" do |builder|
      builder.adapter :test
    end
    request = @client.generate_authenticated_request(
      connection: connection,
      realm:      "Example",
      request:    [
        "GET",
        "https://www.googleapis.com/oauth2/v1/userinfo?alt=json",
        {},
        [""]
      ]
    )
    expect(request.headers["Authorization"]).to eq 'Bearer 12345, realm="Example"'
  end

  it "should not raise an error if a request is " \
     "provided without a connection" do
    @client.client_id = "client-12345"
    @client.client_secret = "secret-12345"
    @client.access_token = "12345"
    request = @client.generate_authenticated_request(
      realm:   "Example",
      request: conn.build_request(:get) do |req|
        req.url "https://www.googleapis.com/oauth2/v1/userinfo?alt=json"
      end
    )
  end

  it "should raise an error if not enough information " \
     "is supplied to create a request" do
    @client.client_id = "client-12345"
    @client.client_secret = "secret-12345"
    @client.access_token = "12345"
    expect(lambda do
      @client.generate_authenticated_request(
        realm:  "Example",
        method: "POST"
      )
    end).to raise_error(ArgumentError)
  end

  it "should raise an error if the client does not have an access token" do
    @client.client_id = "client-12345"
    @client.client_secret = "secret-12345"
    expect(lambda do
      @client.fetch_protected_resource
    end).to raise_error(ArgumentError)
  end

  it "should not raise an error if the API server gives an error status" do
    @client.client_id = "client-12345"
    @client.client_secret = "secret-12345"
    @client.access_token = "12345"
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get "/oauth2/v1/userinfo?alt=json" do
        [509, {}, "Rate limit hit or something."]
      end
    end
    connection = Faraday.new url: "https://www.googleapis.com" do |builder|
      builder.adapter :test, stubs
    end
    response = @client.fetch_protected_resource(
      connection: connection,
      uri:        "https://www.googleapis.com/oauth2/v1/userinfo?alt=json"
    )
    expect(response.status).to eq 509
    expect(response.body).to eq "Rate limit hit or something."
    stubs.verify_stubbed_calls
  end

  it "should only raise an error if the API server " \
     "gives an authorization failed status" do
    @client.client_id = "client-12345"
    @client.client_secret = "secret-12345"
    @client.access_token = "12345"
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get "/oauth2/v1/userinfo?alt=json" do
        [401, {}, "User authorization failed or something."]
      end
    end
    expect(lambda do
      connection = Faraday.new(
        url: "https://www.googleapis.com"
      ) do |builder|
        builder.adapter :test, stubs
      end
      @client.fetch_protected_resource(
        connection: connection,
        uri:        "https://www.googleapis.com/oauth2/v1/userinfo?alt=json"
      )
    end).to raise_error(Signet::AuthorizationError)
    stubs.verify_stubbed_calls
  end

  it "should correctly handle an ID token" do
    @client.client_id = "client-12345"
    @client.client_secret = "secret-12345"
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.post "/token" do
        build_json_response(
          "access_token"  => "12345",
          "refresh_token" => "54321",
          "expires_in"    => "3600",
          "id_token"      => (
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl9oYXNoIjoidGdoRD" \
            "lKN244VjBOMnZjdzZlTWlqZyIsImF1ZCI6ImNsaWVudC0xMjM0NSIsImlkIjoiM" \
            "TIzNDUiLCJpYXQiOjEzMjA2NzA5NzgsImV4cCI6MTMyMDY3NDg3OCwiY2lkIjoi" \
            "Y2xpZW50LTEyMzQ1IiwiaXNzIjoiZXhhbXBsZS5jb20ifQ.tsF3srlBaAh6pV3U" \
            "wfRrHSA3-jwnvOw6MMsQ6sO4kjc"
          )
        )
      end
    end
    connection = Faraday.new url: "https://www.google.com" do |builder|
      builder.adapter :test, stubs
    end
    @client.fetch_access_token!(
      connection: connection
    )
    expect(@client.access_token).to eq "12345"
    expect(@client.refresh_token).to eq "54321"
    expect(@client.decoded_id_token(nil, verify_expiration: false)).to eq ({
      "token_hash" => "tghD9J7n8V0N2vcw6eMijg",
      "id"         => "12345",
      "aud"        => "client-12345",
      "iat"        => 1_320_670_978,
      "exp"        => 1_320_674_878,
      "cid"        => "client-12345",
      "iss"        => "example.com"
    })
    expect(@client.expires_in).to eq 3600
    stubs.verify_stubbed_calls
  end

  it "should correctly handle an ID token with `aud` array" do
    @client.client_id = "client-12345"
    @client.client_secret = "secret-12345"
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.post "/token" do
        build_json_response(
          "access_token"  => "12345",
          "refresh_token" => "54321",
          "expires_in"    => "3600",
          "id_token"      => (
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl9oYXNoIjoidGdoRD" \
            "lKN244VjBOMnZjdzZlTWlqZyIsImF1ZCI6WyJjbGllbnQtMTIzNDUiXSwiaWQiO" \
            "iIxMjM0NSIsImlhdCI6MTMyMDY3MDk3OCwiZXhwIjoxMzIwNjc0ODc4LCJjaWQi" \
            "OiJjbGllbnQtMTIzNDUiLCJpc3MiOiJleGFtcGxlLmNvbSJ9.rSaY-M9YlB4pcU" \
            "uNf21FeEtOM9pBGr_a7xe9fZrpWWU"
          )
        )
      end
    end
    connection = Faraday.new url: "https://www.google.com" do |builder|
      builder.adapter :test, stubs
    end
    @client.fetch_access_token!(
      connection: connection
    )
    expect(@client.access_token).to eq "12345"
    expect(@client.refresh_token).to eq "54321"
    expect(@client.decoded_id_token(nil, verify_expiration: false)).to eq ({
      "token_hash" => "tghD9J7n8V0N2vcw6eMijg",
      "id"         => "12345",
      "aud"        => ["client-12345"],
      "iat"        => 1_320_670_978,
      "exp"        => 1_320_674_878,
      "cid"        => "client-12345",
      "iss"        => "example.com"
    })
    expect(@client.expires_in).to eq 3600
    stubs.verify_stubbed_calls
  end

  it "should raise an error decoding an ID token if " \
     "audience does not match client ID" do
    @client.client_id = "client-54321"
    @client.client_secret = "secret-12345"
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.post "/token" do
        build_json_response(
          "access_token"  => "12345",
          "refresh_token" => "54321",
          "expires_in"    => "3600",
          "id_token"      => (
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl9oYXNoIjoidGdoRD" \
            "lKN244VjBOMnZjdzZlTWlqZyIsImF1ZCI6ImNsaWVudC0xMjM0NSIsImlkIjoiM" \
            "TIzNDUiLCJpYXQiOjEzMjA2NzA5NzgsImV4cCI6MTMyMDY3NDg3OCwiY2lkIjoi" \
            "Y2xpZW50LTEyMzQ1IiwiaXNzIjoiZXhhbXBsZS5jb20ifQ.tsF3srlBaAh6pV3U" \
            "wfRrHSA3-jwnvOw6MMsQ6sO4kjc"
          )
        )
      end
    end
    connection = Faraday.new url: "https://www.google.com" do |builder|
      builder.adapter :test, stubs
    end
    @client.fetch_access_token!(
      connection: connection
    )
    expect(@client.access_token).to eq "12345"
    expect(@client.refresh_token).to eq "54321"
    expect(@client.expires_in).to eq 3600
    expect(lambda do
      @client.decoded_id_token nil, verify_expiration: false
    end).to raise_error(Signet::UnsafeOperationError)
    stubs.verify_stubbed_calls
  end

  it "should raise an error decoding an ID token if " \
     "audience is missing" do
    @client.client_id = "client-12345"
    @client.client_secret = "secret-12345"
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.post "/token" do
        build_json_response(
          "access_token"  => "12345",
          "refresh_token" => "54321",
          "expires_in"    => "3600",
          "id_token"      => (
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl9oYXNoIjoidGdoRD" \
            "lKN244VjBOMnZjdzZlTWlqZyIsImlkIjoiMTIzNDUiLCJpYXQiOjEzMjA2NzA5N" \
            "zgsImV4cCI6MTMyMDY3NDg3OCwiY2lkIjoiY2xpZW50LTEyMzQ1IiwiaXNzIjoi" \
            "ZXhhbXBsZS5jb20ifQ.7qj85CKbQyVdDe5y2ScdJAZNkEeKMPW9LIonLxG1vu8"
          )
        )
      end
    end
    connection = Faraday.new url: "https://www.google.com" do |builder|
      builder.adapter :test, stubs
    end
    @client.fetch_access_token!(
      connection: connection
    )
    expect(@client.access_token).to eq "12345"
    expect(@client.refresh_token).to eq "54321"
    expect(@client.expires_in).to eq 3600
    expect(lambda do
      @client.decoded_id_token nil, verify_expiration: false
    end).to raise_error(Signet::UnsafeOperationError)
    stubs.verify_stubbed_calls
  end

  it "should raise an error if the id token cannot be verified" do
    pending "Need to set test data"
    @client.client_id = "client-12345"
    @client.client_secret = "secret-12345"
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.post "/token" do
        build_json_response(
          "access_token"  => "12345",
          "refresh_token" => "54321",
          "expires_in"    => "3600",
          "id_token"      => (
            "eyJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiY" \
            "XVkIjoiMTA2MDM1Nzg5MTY4OC5hcHBzLmdvb2dsZXVzZXJjb250ZW50LmNvbSI" \
            "sImNpZCI6IjEwNjAzNTc4OTE2ODguYXBwcy5nb29nbGV1c2VyY29udGVudC5jb" \
            "20iLCJpZCI6IjExNjQ1MjgyNDMwOTg1Njc4MjE2MyIsInRva2VuX2hhc2giOiJ" \
            "0Z2hEOUo4bjhWME4ydmN3NmVNaWpnIiwiaWF0IjoxMzIwNjcwOTc4LCJleHAiO" \
            "jEzMjA2NzQ4Nzh9.D8x_wirkxDElqKdJBcsIws3Ogesk38okz6MN7zqC7nEAA7" \
            "wcy1PxsROY1fmBvXSer0IQesAqOW-rPOCNReSn-eY8d53ph1x2HAF-AzEi3GOl" \
            "6hFycH8wj7Su6JqqyEbIVLxE7q7DkAZGaMPkxbTHs1EhSd5_oaKQ6O4xO3ZnnT4"
          )
        )
      end
    end
    connection = Faraday.new url: "https://www.google.com" do |builder|
      builder.adapter :test, stubs
    end
    @client.fetch_access_token!(
      connection: connection
    )
    expect(@client.access_token).to eq "12345"
    expect(@client.refresh_token).to eq "54321"
    expect(@client.expires_in).to eq 3600
    expect(lambda do
      pubkey = OpenSSL::PKey::RSA.new <<~PUBKEY
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxCaY7425h964bjaoLeUm
SlZ8sK7VtVk9zHbGmZh2ygGYwfuUf2bmMye2Ofv99yDE/rd4loVIAcu7RVvDRgHq
3/CZTnIrSvHsiJQsHBNa3d+F1ihPfzURzf1M5k7CFReBj2SBXhDXd57oRfBQj12w
CVhhwP6kGTAWuoppbIIIBfNF2lE/Nvm7lVVYQqL9xOrP/AQ4xRbpQlB8Ll9sO9Or
SvbWhCDa/LMOWxHdmrcJi6XoSg1vnOyCoKbyAoauTt/XqdkHbkDdQ6HFbJieu9il
LDZZNliPhfENuKeC2MCGVXTEu8Cqhy1w6e4axavLlXoYf4laJIZ/e7au8SqDbY0B
xwIDAQAB
-----END PUBLIC KEY-----
      PUBKEY
      @client.decoded_id_token pubkey
    end).to raise_error(JWT::ExpiredSignature)
    stubs.verify_stubbed_calls
  end
end

describe Signet::OAuth2::Client, "authorization_uri" do
  before do
    @client = Signet::OAuth2::Client.new(
      client_id:         "s6BhdRkqt3",
      redirect_uri:      "https://example.client.com/callback",
      authorization_uri: "https://example.com/authorize"
    )
  end

  it "should set access_type to offline by default" do
    expect(@client.authorization_uri.query_values["access_type"]).to eq "offline"
  end

  it "should set response_type to code by default" do
    expect(@client.authorization_uri.query_values["response_type"]).to eq "code"
  end

  it "should raise an error when setting both prompt and approval_prompt" do
    expect(lambda do
      @client.authorization_uri approval_prompt: "force", prompt: "consent"
    end).to raise_error(ArgumentError)
  end
end

describe Signet::OAuth2::Client, "configured with custom parameters" do
  before do
    @client = Signet::OAuth2::Client.new(
      client_id:             "s6BhdRkqt3",
      redirect_uri:          "https://example.client.com/callback",
      authorization_uri:     "https://example.com/authorize",
      token_credential_uri:  "https://example.com/token",
      additional_parameters: { "type" => "web_server" }
    )
  end

  # Normalizing to symbols - good test case example here for changes to normalized input.
  # Also tests Addressable's output.
  # Note: The only changes made here are to testing the **INTERNAL** representation of options.
  it "should allow custom parameters to be set on init" do
    expect(@client.additional_parameters).to eq({ type: "web_server" })
  end

  it "should allow custom parameters to be updated" do
    @client.update! additional_parameters: { type: "new_type" }
    expect(@client.additional_parameters).to eq ({ type: "new_type" })
  end

  it "should use custom parameters when generating authorization_uri" do
    expect(@client.authorization_uri.query_values).to eq ({
      "access_type"   => "offline",
      "client_id"     => "s6BhdRkqt3",
      "redirect_uri"  => "https://example.client.com/callback",
      "response_type" => "code",
      "type"          => "web_server"
 })
  end

  it "should merge new authorization_uri custom parameters" do
    expect(@client.authorization_uri(additional_parameters: { "type" => "new_type", "new_param" => "new_val" }).query_values).to eql({ "access_type" => "offline", "client_id" => "s6BhdRkqt3", "new_param" => "new_val", "response_type" => "code", "redirect_uri" => "https://example.client.com/callback", "type" => "new_type" })
  end

  it "should merge new generate_access_token_request custom parameters" do
    @client.update! code: "12345"
    params = @client.generate_access_token_request additional_parameters: { "type" => "new_type", "new_param" => "new_val" }
    expect(params).to include("type" => "new_type")
    expect(params).to include("new_param" => "new_val")
  end
end

describe Signet::OAuth2::Client, "configured with custom parameters" do
  before do
    @client = Signet::OAuth2::Client.new(
      "client_id"             => "s6BhdRkqt3",
      "redirect_uri"          => "https://example.client.com/callback",
      "authorization_uri"     => "https://example.com/authorize",
      "token_credential_uri"  => "https://example.com/token",
      "additional_parameters" => { "type" => "web_server" }
      )
  end

  # Normalizing to symbols - good test case example here for changes to normalized input.
  # Also tests Addressable's output.
  # Note: The only changes made here are to testing the **INTERNAL** representation of options.
  it "should allow custom parameters to be set on init" do
    expect(@client.additional_parameters).to eq ({ type: "web_server" })
  end

  it "should allow custom parameters to be updated" do
    @client.update! additional_parameters: { "type" => "new_type" }
    expect(@client.additional_parameters).to eql ({ type: "new_type" })
  end

  it "should use custom parameters when generating authorization_uri" do
    expect(@client.authorization_uri.query_values).to eq ({ "access_type" => "offline", "client_id" => "s6BhdRkqt3", "redirect_uri" => "https://example.client.com/callback", "response_type" => "code", "type" => "web_server" })
  end

  it "should have the correct authorization_uri" do
    expect(@client.authorization_uri.host).to eq "example.com"
    expect(@client.authorization_uri.path).to eq "/authorize"
  end

  it "should merge new authorization_uri custom parameters" do
    expect(@client.authorization_uri(additional_parameters: { "type" => "new_type", "new_param" => "new_val" }).query_values).to eq ({ "access_type" => "offline", "client_id" => "s6BhdRkqt3", "new_param" => "new_val", "response_type" => "code", "redirect_uri" => "https://example.client.com/callback", "type" => "new_type" })
  end

  it "should not have access_type parameter in authorization_uri when we set it to nil in client" do
    @client.update! access_type: nil
    expect(@client.authorization_uri.query_values).to eq ({ "client_id" => "s6BhdRkqt3", "response_type" => "code", "redirect_uri" => "https://example.client.com/callback" })
  end

  it "should use new access_type parameter as default for authorization_uri" do
    @client.update! access_type: :online
    expect(@client.authorization_uri.query_values).to eq ({ "access_type" => "online", "client_id" => "s6BhdRkqt3", "response_type" => "code", "redirect_uri" => "https://example.client.com/callback" })
  end

  it "should merge new generate_access_token_request custom parameters" do
    @client.update! code: "12345"
    params = @client.generate_access_token_request additional_parameters: { "type" => "new_type", "new_param" => "new_val" }
    expect(params).to include("type" => "new_type")
    expect(params).to include("new_param" => "new_val")
  end
end

describe Signet::OAuth2::Client, "configured with custom parameters a la JSON.load(credentials_file)" do
  before do
    @client = Signet::OAuth2::Client.new(
      "client_id"             => "s6BhdRkqt3",
      "redirect_uri"          => "https://example.client.com/callback",
      "authorization_uri"     => { "scheme" => "https", "user" => nil, "password" => nil, "host" => "accounts.google.com", "port" => nil, "path" => "/o/oauth2/auth", "query" => nil, "fragment" => nil },
      "token_credential_uri"  => "https://example.com/token",
      "additional_parameters" => { "type" => "web_server" }
      )
  end

  it "should allow custom parameters to be set on init" do
    expect(@client.additional_parameters).to eq ({ type: "web_server" })
  end

  it "should allow custom parameters to be updated" do
    @client.update! additional_parameters: { "type" => "new_type" }
    expect(@client.additional_parameters).to eql ({ type: "new_type" })
  end

  it "should have correct authorization_uri hash options" do
    expect(@client.authorization_uri.host).to eq "accounts.google.com"
    expect(@client.authorization_uri.path).to eq "/o/oauth2/auth"
  end

  it "should use custom parameters when generating authorization_uri" do
    expect(@client.authorization_uri.query_values).to eq ({ "access_type" => "offline", "client_id" => "s6BhdRkqt3", "redirect_uri" => "https://example.client.com/callback", "response_type" => "code", "type" => "web_server" })
  end

  # , "path" => "/o/oauth2/oauth", "host" => "accounts.google.com"

  it "should merge new authorization_uri custom parameters" do
    expect(@client.authorization_uri(additional_parameters: { "type" => "new_type", "new_param" => "new_val" }).query_values).to eq ({
      "access_type"   => "offline",
      "client_id"     => "s6BhdRkqt3",
      "new_param"     => "new_val",
      "response_type" => "code",
      "redirect_uri"  => "https://example.client.com/callback",
      "type"          => "new_type"
 })
  end

  it "should merge new generate_access_token_request custom parameters" do
    @client.update! code: "12345"
    params = @client.generate_access_token_request additional_parameters: { "type" => "new_type", "new_param" => "new_val" }
    expect(params).to include("type" => "new_type")
    expect(params).to include("new_param" => "new_val")
  end
end

describe Signet::OAuth2::Client, "configured for id tokens" do
  before do
    @key = OpenSSL::PKey::RSA.new 2048
    @client = Signet::OAuth2::Client.new(
      token_credential_uri: "https://oauth2.googleapis.com/token",
      target_audience:      "https://api.example.com",
      issuer:               "app@example.com",
      audience:             "https://hello.googleapis.com",
      signing_key:          @key
    )
  end

  it "should set target_audience" do
    expect(@client.target_audience).to eq "https://api.example.com"
  end

  it "should send a valid id token request" do
    stubs = Faraday::Adapter::Test::Stubs.new do |stub|
      stub.post "/token" do |env|
        params = Addressable::URI.form_unencode env[:body]
        claim, header = JWT.decode params.assoc("assertion").last, @key.public_key, true, algorithm: "RS256"
        expect(params.assoc("grant_type")).to eq ["grant_type", "urn:ietf:params:oauth:grant-type:jwt-bearer"]
        expect(claim["target_audience"]).to eq "https://api.example.com"
        expect(claim["iss"]).to eq "app@example.com"
        expect(claim["aud"]).to eq "https://hello.googleapis.com"
        build_json_response(
          "id_token"  => "12345id",
          "refresh_token" => "54321refresh",
          "expires_in"    => "3600"
        )
      end
    end
    connection = Faraday.new url: "https://www.google.com" do |builder|
      builder.adapter :test, stubs
    end
    @client.fetch_access_token! connection: connection
    expect(@client.id_token).to eq "12345id"
  end
end
