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
require "multi_json"
require "signet/oauth_1/client"
require "addressable/uri"
require "stringio"

conn = Faraday.default_connection

def merge_body chunked_body
  raise ArgumentError, "Expected chunked body, got nil." if chunked_body == nil
  merged_body = StringIO.new
  chunked_body.each do |chunk|
    merged_body.write chunk
  end
  merged_body.string
end

describe Signet::OAuth1::Client, "unconfigured" do
  before do
    @client = Signet::OAuth1::Client.new
  end

  it "should have no temporary_credential_uri" do
    expect(@client.temporary_credential_uri).to be_nil
  end

  it "should allow the temporary_credential_uri to be set to a String" do
    @client.temporary_credential_uri = "http://example.com/"
    expect(@client.temporary_credential_uri.to_s).to eq "http://example.com/"
  end

  it "should allow the temporary_credential_uri to be set to a URI" do
    @client.temporary_credential_uri =
      Addressable::URI.parse "http://example.com/"
    expect(@client.temporary_credential_uri.to_s).to eq "http://example.com/"
  end

  it "should have no authorization_uri" do
    expect(@client.authorization_uri).to be_nil
  end

  it "should allow the authorization_uri to be set to a String" do
    @client.authorization_uri = "http://example.com/authorize"
    expect(@client.authorization_uri.to_s).to include(
      "http://example.com/authorize"
    )
  end

  it "should allow the authorization_uri to be set to a Hash" do
    @client.authorization_uri = {
      scheme: "http", host: "example.com", path: "/authorize"
    }
    expect(@client.authorization_uri.to_s).to include(
      "http://example.com/authorize"
    )
  end

  it "should allow the authorization_uri to be set to a URI" do
    @client.authorization_uri =
      Addressable::URI.parse "http://example.com/authorize"
    expect(@client.authorization_uri.to_s).to include(
      "http://example.com/authorize"
    )
  end

  it "should have no token_credential_uri" do
    expect(@client.token_credential_uri).to be_nil
  end

  it "should allow the token_credential_uri to be set to a String" do
    @client.token_credential_uri = "http://example.com/"
    expect(@client.token_credential_uri.to_s).to eq "http://example.com/"
  end

  it "should allow the token_credential_uri to be set to a Hash" do
    @client.token_credential_uri = {
      scheme: "http", host: "example.com", path: "/token"
    }
    expect(@client.token_credential_uri.to_s).to eq "http://example.com/token"
  end

  it "should allow the token_credential_uri to be set to a URI" do
    @client.token_credential_uri =
      Addressable::URI.parse "http://example.com/"
    expect(@client.token_credential_uri.to_s).to eq "http://example.com/"
  end

  it "should have no client_credential" do
    expect(@client.client_credential).to be_nil
  end

  it "should raise an error for partially set client credentials" do
    @client.client_credential_key = "12345"
    @client.client_credential_secret = nil
    expect(lambda do
      @client.client_credential
    end).to raise_error(ArgumentError)
  end

  it "should raise an error for partially set client credentials" do
    @client.client_credential_key = nil
    @client.client_credential_secret = "54321"
    expect(lambda do
      @client.client_credential
    end).to raise_error(ArgumentError)
  end

  it "should allow the client_credential to be set to a " \
     "Signet::OAuth1::Credential" do
    @client.client_credential =
      Signet::OAuth1::Credential.new "12345", "54321"
    expect(@client.client_credential_key).to eq "12345"
    expect(@client.client_credential_secret).to eq "54321"
    expect(@client.client_credential).to eq Signet::OAuth1::Credential.new("12345", "54321")
  end

  it "should allow the client_credential to be set to nil" do
    @client.client_credential_key = "12345"
    @client.client_credential_secret = "54321"
    expect(@client.client_credential_key).to eq "12345"
    expect(@client.client_credential_secret).to eq "54321"
    @client.client_credential = nil
    expect(@client.client_credential).to be_nil
    expect(@client.client_credential_key).to be_nil
    expect(@client.client_credential_secret).to be_nil
  end

  it "should not allow the client_credential to be set to a bogus value" do
    expect(lambda do
      @client.client_credential = 42
    end).to raise_error(TypeError)
  end

  it "should have no client_credential_key" do
    expect(@client.client_credential_key).to be_nil
  end

  it "should allow the client_credential_key to be set to a String" do
    @client.client_credential_key = "12345"
    expect(@client.client_credential_key).to eq "12345"
  end

  it "should not allow the client_credential_key to be set to a non-String" do
    expect(lambda do
      @client.client_credential_key = 12_345
    end).to raise_error(TypeError)
  end

  it "should have no client_credential_secret" do
    expect(@client.client_credential_secret).to be_nil
  end

  it "should allow the client_credential_secret to be set to a String" do
    @client.client_credential_secret = "54321"
    expect(@client.client_credential_secret).to eq "54321"
  end

  it "should not allow the client_credential_secret " \
     "to be set to a non-String" do
    expect(lambda do
      @client.client_credential_secret = 54_321
    end).to raise_error(TypeError)
  end

  it "should have an out-of-band callback" do
    expect(@client.callback).to eq ::Signet::OAuth1::OUT_OF_BAND
  end

  it "should allow the callback to be set to a String" do
    @client.callback = "http://example.com/callback"
    expect(@client.callback).to eq "http://example.com/callback"
  end

  it "should allow the callback to be set to a URI" do
    @client.callback =
      Addressable::URI.parse "http://example.com/callback"
    expect(@client.callback).to eq "http://example.com/callback"
  end

  it "should not allow the callback to be set to a non-String" do
    expect(lambda do
      @client.callback = 12_345
    end).to raise_error(TypeError)
  end

  it "should raise an error if the temporary credentials URI is not set" do
    @client.client_credential_key = "dpf43f3p2l4k3l03"
    @client.client_credential_secret = "kd94hf93k423kf44"
    expect(lambda do
      @client.generate_temporary_credential_request
    end).to raise_error(ArgumentError)
  end

  it "should raise an error if the client credential key is not set" do
    @client.temporary_credential_uri =
      "http://example.com/temporary_credentials"
    @client.client_credential_secret = "kd94hf93k423kf44"
    expect(lambda do
      @client.generate_temporary_credential_request
    end).to raise_error(ArgumentError)
  end

  it "should raise an error if the client credential secret is not set" do
    @client.temporary_credential_uri =
      "http://example.com/temporary_credentials"
    @client.client_credential_key = "dpf43f3p2l4k3l03"
    expect(lambda do
      @client.generate_temporary_credential_request
    end).to raise_error(ArgumentError)
  end

  it "should have no temporary_credential" do
    expect(@client.temporary_credential).to be_nil
  end

  it "should raise an error for partially set temporary credentials" do
    @client.temporary_credential_key = "12345"
    @client.temporary_credential_secret = nil
    expect(lambda do
      @client.temporary_credential
    end).to raise_error(ArgumentError)
  end

  it "should raise an error for partially set temporary credentials" do
    @client.temporary_credential_key = nil
    @client.temporary_credential_secret = "54321"
    expect(lambda do
      @client.temporary_credential
    end).to raise_error(ArgumentError)
  end

  it "should allow the temporary_credential to be set to a " \
     "Signet::OAuth1::Credential" do
    @client.temporary_credential =
      Signet::OAuth1::Credential.new "12345", "54321"
    expect(@client.temporary_credential_key).to eq "12345"
    expect(@client.temporary_credential_secret).to eq "54321"
    expect(@client.temporary_credential).to eq Signet::OAuth1::Credential.new("12345", "54321")
  end

  it "should allow the temporary_credential to be set to nil" do
    @client.temporary_credential_key = "12345"
    @client.temporary_credential_secret = "54321"
    expect(@client.temporary_credential_key).to eq "12345"
    expect(@client.temporary_credential_secret).to eq "54321"
    @client.temporary_credential = nil
    expect(@client.temporary_credential).to be_nil
    expect(@client.temporary_credential_key).to be_nil
    expect(@client.temporary_credential_secret).to be_nil
  end

  it "should not allow the temporary_credential to be set to a bogus value" do
    expect(lambda do
      @client.temporary_credential = 42
    end).to raise_error(TypeError)
  end

  it "should have no temporary_credential_key" do
    expect(@client.temporary_credential_key).to be_nil
  end

  it "should allow the temporary_credential_key to be set to a String" do
    @client.temporary_credential_key = "12345"
    expect(@client.temporary_credential_key).to eq "12345"
  end

  it "should not allow the temporary_credential_key " \
     "to be set to a non-String" do
    expect(lambda do
      @client.temporary_credential_key = 12_345
    end).to raise_error(TypeError)
  end

  it "should have no temporary_credential_secret" do
    expect(@client.temporary_credential_secret).to be_nil
  end

  it "should allow the temporary_credential_secret to be set to a String" do
    @client.temporary_credential_secret = "54321"
    expect(@client.temporary_credential_secret).to eq "54321"
  end

  it "should not allow the temporary_credential_secret " \
     "to be set to a non-String" do
    expect(lambda do
      @client.temporary_credential_secret = 54_321
    end).to raise_error(TypeError)
  end

  it "should have no token_credential" do
    expect(@client.token_credential).to be_nil
  end

  it "should raise an error for partially set token credentials" do
    @client.token_credential_key = "12345"
    @client.token_credential_secret = nil
    expect(lambda do
      @client.token_credential
    end).to raise_error(ArgumentError)
  end

  it "should raise an error for partially set token credentials" do
    @client.token_credential_key = nil
    @client.token_credential_secret = "54321"
    expect(lambda do
      @client.token_credential
    end).to raise_error(ArgumentError)
  end

  it "should allow the token_credential to be set to a " \
     "Signet::OAuth1::Credential" do
    @client.token_credential =
      Signet::OAuth1::Credential.new "12345", "54321"
    expect(@client.token_credential_key).to eq "12345"
    expect(@client.token_credential_secret).to eq "54321"
    expect(@client.token_credential).to eq Signet::OAuth1::Credential.new("12345", "54321")
  end

  it "should allow the token_credential to be set to nil" do
    @client.token_credential_key = "12345"
    @client.token_credential_secret = "54321"
    expect(@client.token_credential_key).to eq "12345"
    expect(@client.token_credential_secret).to eq "54321"
    @client.token_credential = nil
    expect(@client.token_credential).to be_nil
    expect(@client.token_credential_key).to be_nil
    expect(@client.token_credential_secret).to be_nil
  end

  it "should not allow the token_credential to be set to a bogus value" do
    expect(lambda do
      @client.token_credential = 42
    end).to raise_error(TypeError)
  end

  it "should have no token_credential_key" do
    expect(@client.token_credential_key).to be_nil
  end

  it "should allow the token_credential_key to be set to a String" do
    @client.token_credential_key = "12345"
    expect(@client.token_credential_key).to eq "12345"
  end

  it "should not allow the token_credential_key " \
     "to be set to a non-String" do
    expect(lambda do
      @client.token_credential_key = 12_345
    end).to raise_error(TypeError)
  end

  it "should have no token_credential_secret" do
    expect(@client.token_credential_secret).to be_nil
  end

  it "should allow the token_credential_secret to be set to a String" do
    @client.token_credential_secret = "54321"
    expect(@client.token_credential_secret).to eq "54321"
  end

  it "should not allow the token_credential_secret " \
     "to be set to a non-String" do
    expect(lambda do
      @client.token_credential_secret = 54_321
    end).to raise_error(TypeError)
  end

  it "should not allow the two_legged flag " \
     "to be set to a non-Boolean" do
    expect(lambda do
      @client.two_legged = 42
    end).to raise_error(TypeError)
  end
end

describe Signet::OAuth1::Client, "configured" do
  before do
    @client = Signet::OAuth1::Client.new
    @client.temporary_credential_uri =
      "http://example.com/temporary_credentials"
    @client.authorization_uri =
      "http://example.com/authorize"
    @client.token_credential_uri =
      "http://example.com/token_credentials"
    @client.callback = "http://example.com/callback"
    @client.client_credential_key = "dpf43f3p2l4k3l03"
    @client.client_credential_secret = "kd94hf93k423kf44"
    @client.temporary_credential_key = "hh5s93j4hdidpola"
    @client.temporary_credential_secret = "hdhd0244k9j7ao03"
    @client.token_credential_key = "nnch734d00sl2jdk"
    @client.token_credential_secret = "pfkkdhi9sl3r4s00"
  end

  it "should generate a JSON representation of the client" do
    json = @client.to_json
    expect(json).not_to be_nil

    deserialized = MultiJson.load json
    expect(deserialized["temporary_credential_uri"]).to eq "http://example.com/temporary_credentials"
    expect(deserialized["authorization_uri"]).to include(
      "http://example.com/authorize"
)
    expect(deserialized["token_credential_uri"]).to eq "http://example.com/token_credentials"
    expect(deserialized["callback"]).to eq "http://example.com/callback"
    expect(deserialized["client_credential_key"]).to eq "dpf43f3p2l4k3l03"
    expect(deserialized["client_credential_secret"]).to eq "kd94hf93k423kf44"
    expect(deserialized["temporary_credential_key"]).to eq "hh5s93j4hdidpola"
    expect(deserialized["temporary_credential_secret"]).to eq "hdhd0244k9j7ao03"
    expect(deserialized["token_credential_key"]).to eq "nnch734d00sl2jdk"
    expect(deserialized["token_credential_secret"]).to eq "pfkkdhi9sl3r4s00"
  end

  it "should generate an authorization URI with a callback" do
    @client.temporary_credential_key = nil
    expect(@client.authorization_uri.to_s).to eq "http://example.com/authorize?oauth_callback=http://example.com/callback"
  end

  it "should generate an authorization URI with a temporary credential" do
    @client.callback = nil
    expect(@client.authorization_uri.to_s).to include(
      "oauth_token=hh5s93j4hdidpola"
    )
  end

  it "should generate an authorization URI both a callback and " \
     "a temporary credential" do
    expect(@client.authorization_uri.to_s).to include(
      "oauth_callback=http://example.com/callback"
    )
    expect(@client.authorization_uri.to_s).to include(
      "oauth_token=hh5s93j4hdidpola"
    )
  end

  it "should generate an authorization URI with additional parameters" do
    authorization_uri = @client.authorization_uri(
      additional_parameters: { domain: "www.example.com" }
    )
    expect(authorization_uri.to_s).to include(
      "oauth_callback=http://example.com/callback"
    )
    expect(authorization_uri.to_s).to include(
      "oauth_token=hh5s93j4hdidpola"
    )
    expect(authorization_uri.to_s).to include(
      "domain=www.example.com"
    )
  end

  it "should raise an error if the verifier is not provided" do
    expect(lambda do
      @client.generate_token_credential_request
    end).to raise_error(ArgumentError)
    expect(lambda do
      @client.generate_token_credential_request verifier: nil
    end).to raise_error(ArgumentError)
  end

  it "should raise an error if the token credentials URI is not set" do
    @client.token_credential_uri = nil
    expect(lambda do
      @client.generate_token_credential_request verifier: "12345"
    end).to raise_error(ArgumentError)
  end

  it "should raise an error if the client credential key is not set" do
    @client.client_credential_key = nil
    expect(lambda do
      @client.generate_token_credential_request verifier: "12345"
    end).to raise_error(ArgumentError)
  end

  it "should raise an error if the client credential secret is not set" do
    @client.client_credential_secret = nil
    expect(lambda do
      @client.generate_token_credential_request verifier: "12345"
    end).to raise_error(ArgumentError)
  end

  it "should raise an error if the temporary credential key is not set" do
    @client.temporary_credential_key = nil
    expect(lambda do
      @client.generate_token_credential_request verifier: "12345"
    end).to raise_error(ArgumentError)
  end

  it "should raise an error if the temporary credential secret is not set" do
    @client.temporary_credential_secret = nil
    expect(lambda do
      @client.generate_token_credential_request verifier: "12345"
    end).to raise_error(ArgumentError)
  end

  it "should raise an error if the client credential key is not set" do
    @client.client_credential_key = nil
    expect(lambda do
      @client.generate_authenticated_request
    end).to raise_error(ArgumentError)
  end

  it "should raise an error if the client credential secret is not set" do
    @client.client_credential_secret = nil
    expect(lambda do
      @client.generate_authenticated_request
    end).to raise_error(ArgumentError)
  end

  it "should raise an error if the token credential key is not set" do
    @client.token_credential_key = nil
    expect(lambda do
      @client.generate_authenticated_request
    end).to raise_error(ArgumentError)
  end

  it "should raise an error if the token credential secret is not set" do
    @client.token_credential_secret = nil
    expect(lambda do
      @client.generate_authenticated_request
    end).to raise_error(ArgumentError)
  end

  it "should raise an error if no request is provided" do
    expect(lambda do
      @client.generate_authenticated_request
    end).to raise_error(ArgumentError)
  end

  it "should raise an error if a bogus request is provided" do
    expect do
        @client.generate_authenticated_request(
          request: []
        )
    end.to raise_error(ArgumentError)
  end

  it "should not raise an error if a request is "\
     "provided without a connection" do
    request = @client.generate_authenticated_request(
      request: conn.build_request(:get) do |req|
        req.url "http://www.example.com/"
      end
    )
  end

  it "should raise an error if no URI is provided" do
    expect(lambda do
      @client.generate_authenticated_request(
        :method  => "GET",
        headers: [],
        :body    => ""
      )
    end).to raise_error(ArgumentError)
  end

  it "should not raise an error if a request body is chunked" do
    request = @client.generate_authenticated_request(
      method: "POST",
      :uri    => "https://photos.example.net/photos",
      :body   => ["A chunked body."]
    )
    expect(request).to be_kind_of(Faraday::Request)
    expect(request.body).to eq "A chunked body."
  end

  it "should not raise an error if a request body is chunked" do
    chunked_body = StringIO.new
    chunked_body.write "A chunked body."
    chunked_body.rewind
    request = @client.generate_authenticated_request(
      method: "POST",
      :uri    => "https://photos.example.net/photos",
      :body   => chunked_body
    )
    expect(request).to be_kind_of(Faraday::Request)
    expect(request.body).to eq "A chunked body."
  end

  it "should raise an error if a request body is of a bogus type" do
    expect(lambda do
      @client.generate_authenticated_request(
        method: "POST",
        :uri    => "https://photos.example.net/photos",
        :body   => 42
      )
    end).to raise_error(TypeError)
  end

  it "should correctly fetch the temporary credentials" do
    # Repeat this because signatures change from test to test
    10.times do
      request = @client.generate_temporary_credential_request
      expect(request.method).to eq :post
      expect(request.path).to eq "http://example.com/temporary_credentials"
      authorization_header = request.headers["Authorization"]
      parameters = ::Signet::OAuth1.parse_authorization_header(
        authorization_header
      ).inject({}) { |h, (k, v)| h[k] = v; h }
      expect(parameters).not_to have_key("oauth_client_credential_key")
      expect(parameters).not_to have_key("oauth_temporary_credential_key")
      expect(parameters).not_to have_key("oauth_token")
      expect(parameters["oauth_nonce"]).to match(/^\w+$/)
      expect(parameters["oauth_callback"]).to eq @client.callback
      expect(parameters["oauth_timestamp"]).to match(/^\d+$/)
      expect(parameters["oauth_signature_method"]).to eq "HMAC-SHA1"
      expect(parameters["oauth_consumer_key"]).to eq @client.client_credential_key
      expect(parameters["oauth_signature"]).to match(%r{^[a-zA-Z0-9\=/\+]+$})
      expect(parameters["oauth_version"]).to eq "1.0"
    end
  end

  it "should correctly fetch the token credentials" do
    # Repeat this because signatures change from test to test
    10.times do
      request = @client.generate_token_credential_request(
        verifier: "473f82d3"
      )
      expect(request.method).to eq :post
      expect(request.path).to eq "http://example.com/token_credentials"
      authorization_header = request.headers["Authorization"]
      parameters = ::Signet::OAuth1.parse_authorization_header(
        authorization_header
      ).inject({}) { |h, (k, v)| h[k] = v; h }
      expect(parameters).not_to have_key("oauth_client_credential_key")
      expect(parameters).not_to have_key("oauth_temporary_credential_key")
      expect(parameters).not_to have_key("oauth_callback")
      expect(parameters["oauth_nonce"]).to match(/^\w+$/)
      expect(parameters["oauth_timestamp"]).to match(/^\d+$/)
      expect(parameters["oauth_signature_method"]).to eq "HMAC-SHA1"
      expect(parameters["oauth_consumer_key"]).to eq @client.client_credential_key
      expect(parameters["oauth_token"]).to eq @client.temporary_credential_key
      expect(parameters["oauth_signature"]).to match(%r{^[a-zA-Z0-9\=/\+]+$})
      expect(parameters["oauth_verifier"]).to eq "473f82d3"
      expect(parameters["oauth_version"]).to eq "1.0"
    end
  end

  it "should correctly fetch the protected resource" do
    # Repeat this because signatures change from test to test
    10.times do
      original_request = [
        "GET",
        "https://photos.example.net/photos?file=vacation.jpg&size=original",
        [["Host", "photos.example.net"]],
        [""]
      ]
      signed_request = @client.generate_authenticated_request(
        request: original_request
      )
      expect(signed_request.method).to eq :get
      expect(signed_request.path).to eq "https://photos.example.net/photos"
      expect(signed_request.params).to eq({ "file" => "vacation.jpg", "size" => "original" })
      authorization_header = signed_request.headers["Authorization"]
      expect(signed_request.body).to eq ""
      parameters = ::Signet::OAuth1.parse_authorization_header(
        authorization_header
      ).inject({}) { |h, (k, v)| h[k] = v; h }
      expect(parameters).not_to have_key("oauth_client_credential_key")
      expect(parameters).not_to have_key("oauth_temporary_credential_key")
      expect(parameters).not_to have_key("oauth_token_credential_key")
      expect(parameters).not_to have_key("oauth_callback")
      expect(parameters["oauth_nonce"]).to match(/^\w+$/)
      expect(parameters["oauth_timestamp"]).to match(/^\d+$/)
      expect(parameters["oauth_signature_method"]).to eq "HMAC-SHA1"
      expect(parameters["oauth_consumer_key"]).to eq @client.client_credential_key
      expect(parameters["oauth_token"]).to eq @client.token_credential_key
      expect(parameters["oauth_signature"]).to match(%r{^[a-zA-Z0-9\=/\+]+$})
      expect(parameters["oauth_version"]).to eq "1.0"
    end
  end

  it "should correctly fetch the protected resource" do
    # Repeat this because signatures change from test to test
    10.times do
      original_request = [
        "POST",
        "https://photos.example.net/photos",
        [
          ["Host", "photos.example.net"],
          ["Content-Type", "application/x-www-form-urlencoded; charset=utf-8"],
          ["Content-Length", "31"]
        ],
        ["file=vacation.jpg&size=original"]
      ]
      signed_request = @client.generate_authenticated_request(
        request: original_request
      )
      expect(signed_request.method).to eq :post
      expect(signed_request.path).to eq "https://photos.example.net/photos"
      authorization_header = signed_request.headers["Authorization"]
      expect(signed_request.body).to eq "file=vacation.jpg&size=original"
      parameters = ::Signet::OAuth1.parse_authorization_header(
        authorization_header
      ).inject({}) { |h, (k, v)| h[k] = v; h }
      expect(parameters).not_to have_key("oauth_client_credential_key")
      expect(parameters).not_to have_key("oauth_temporary_credential_key")
      expect(parameters).not_to have_key("oauth_token_credential_key")
      expect(parameters).not_to have_key("oauth_callback")
      expect(parameters["oauth_nonce"]).to match(/^\w+$/)
      expect(parameters["oauth_timestamp"]).to match(/^\d+$/)
      expect(parameters["oauth_signature_method"]).to eq "HMAC-SHA1"
      expect(parameters["oauth_consumer_key"]).to eq @client.client_credential_key
      expect(parameters["oauth_token"]).to eq @client.token_credential_key
      expect(parameters["oauth_signature"]).to match(%r{^[a-zA-Z0-9\=/\+]+$})
      expect(parameters["oauth_version"]).to eq "1.0"
    end
  end

  describe "with Faraday requests" do
    it "should correctly get the protected resource" do
      # Repeat this because signatures change from test to test
      10.times do
        original_request = conn.build_request :get do |req|
          req.url(
            "https://photos.example.net/photos?file=vacation.jpg&size=original"
          )
          req.headers = Faraday::Utils::Headers.new(
            [["Host", "photos.example.net"]]
          )
          req.body = ""
        end

        signed_request = @client.generate_authenticated_request(
          request: original_request
        )

        # Should be same request object
        expect(original_request["Authorization"]).to eq signed_request["Authorization"]

        expect(signed_request.method).to eq :get
        expect(signed_request.path).to eq "https://photos.example.net/photos"
        expect(signed_request.params).to eq ({ "file" => "vacation.jpg", "size" => "original" })
        authorization_header = signed_request.headers["Authorization"]
        expect(signed_request.body).to eq ""
        parameters = ::Signet::OAuth1.parse_authorization_header(
          authorization_header
        ).inject({}) { |h, (k, v)| h[k] = v; h }
        expect(parameters).not_to have_key("oauth_client_credential_key")
        expect(parameters).not_to have_key("oauth_temporary_credential_key")
        expect(parameters).not_to have_key("oauth_token_credential_key")
        expect(parameters).not_to have_key("oauth_callback")
        expect(parameters["oauth_nonce"]).to match(/^\w+$/)
        expect(parameters["oauth_timestamp"]).to match(/^\d+$/)
        expect(parameters["oauth_signature_method"]).to eq "HMAC-SHA1"
        expect(parameters["oauth_consumer_key"]).to eq @client.client_credential_key
        expect(parameters["oauth_token"]).to eq @client.token_credential_key
        expect(parameters["oauth_signature"]).to match(%r{^[a-zA-Z0-9\=/\+]+$})
        expect(parameters["oauth_version"]).to eq "1.0"
      end
    end

    it "should correctly post the protected resource" do
      # Repeat this because signatures change from test to test
      10.times do
        original_request = conn.build_request :post do |req|
          req.url "https://photos.example.net/photos"
          req.headers = Faraday::Utils::Headers.new([
                                                      ["Host", "photos.example.net"],
            ["Content-Type", "application/x-www-form-urlencoded; charset=utf-8"],
            ["Content-Length", "31"]
                                                    ])
          req.body = {
            "size" => "original",
            "file" => "vacation.jpg"
          }
        end

        signed_request = @client.generate_authenticated_request(
          request: original_request
        )

        # Should be same request object
        expect(original_request["Authorization"]).to eq signed_request["Authorization"]

        expect(signed_request.method).to eq :post
        expect(signed_request.path).to eq "https://photos.example.net/photos"
        authorization_header = signed_request.headers["Authorization"]
        # Can't rely on the order post parameters are encoded in.
        expect(signed_request.body).to include("file=vacation.jpg")
        expect(signed_request.body).to include("size=original")
        parameters = ::Signet::OAuth1.parse_authorization_header(
          authorization_header
        ).inject({}) { |h, (k, v)| h[k] = v; h }
        expect(parameters).not_to have_key("oauth_client_credential_key")
        expect(parameters).not_to have_key("oauth_temporary_credential_key")
        expect(parameters).not_to have_key("oauth_token_credential_key")
        expect(parameters).not_to have_key("oauth_callback")
        expect(parameters["oauth_nonce"]).to match(/^\w+$/)
        expect(parameters["oauth_timestamp"]).to match(/^\d+$/)
        expect(parameters["oauth_signature_method"]).to eq "HMAC-SHA1"
        expect(parameters["oauth_consumer_key"]).to eq @client.client_credential_key
        expect(parameters["oauth_token"]).to eq @client.token_credential_key
        expect(parameters["oauth_signature"]).to match(%r{^[a-zA-Z0-9\=/\+]+$})
        expect(parameters["oauth_version"]).to eq "1.0"
      end
    end
  end
end
