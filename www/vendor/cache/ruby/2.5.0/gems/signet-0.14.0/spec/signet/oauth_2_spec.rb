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
require "signet/errors"
require "signet/oauth_2"

describe Signet::OAuth2 do
  # This behavior will almost certainly change in subsequent updates.
  describe "when parsing an Authorization header" do
    it "should correctly handle HTTP Basic auth-scheme" do
      parameters = Signet::OAuth2.parse_authorization_header(
        "Basic czZCaGRSa3F0MzpnWDFmQmF0M2JW"
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
      expect(parameters["client_id"]).to eq "s6BhdRkqt3"
      expect(parameters["client_secret"]).to eq "gX1fBat3bV"
    end

    it "should correctly handle OAuth auth-scheme" do
      parameters = Signet::OAuth2.parse_authorization_header(
        "OAuth vF9dft4qmT"
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
      expect(parameters["access_token"]).to eq "vF9dft4qmT"
    end

    it "should correctly handle OAuth auth-scheme with realm" do
      parameters = Signet::OAuth2.parse_authorization_header(
        'OAuth vF9dft4qmT, realm="http://sp.example.com/"'
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
      expect(parameters["access_token"]).to eq "vF9dft4qmT"
      expect(parameters["realm"]).to eq "http://sp.example.com/"
    end

    it "should correctly handle OAuth auth-scheme with multiple auth-params" do
      parameters = Signet::OAuth2.parse_authorization_header(
        'OAuth vF9dft4qmT, first="one", second="two"'
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
      expect(parameters["access_token"]).to eq "vF9dft4qmT"
      expect(parameters["first"]).to eq "one"
      expect(parameters["second"]).to eq "two"
    end

    it "should liberally handle auth-params with single-quoted strings" do
      parameters = Signet::OAuth2.parse_authorization_header(
        "OAuth vF9dft4qmT, first='one', second='two'"
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
      expect(parameters["access_token"]).to eq "vF9dft4qmT"
      expect(parameters["first"]).to eq "one"
      expect(parameters["second"]).to eq "two"
    end

    it "should liberally handle auth-params with unquoted strings" do
      parameters = Signet::OAuth2.parse_authorization_header(
        "OAuth vF9dft4qmT, first=one, second=two"
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
      expect(parameters["access_token"]).to eq "vF9dft4qmT"
      expect(parameters["first"]).to eq "one"
      expect(parameters["second"]).to eq "two"
    end

    it "should not allow unquoted strings that do not match tchar" do
      expect(lambda do
        parameters = Signet::OAuth2.parse_authorization_header(
          "OAuth vF9dft4qmT, first=one:1"
        )
      end).to raise_error(Signet::ParseError)
    end

    it "should not parse non-OAuth auth-schemes" do
      expect(lambda do
        Signet::OAuth2.parse_authorization_header(
          'AuthSub token="GD32CMCL25aZ-v____8B"'
        )
      end).to raise_error(Signet::ParseError)
    end
  end

  # This behavior will almost certainly change in subsequent updates.
  describe "when parsing a WWW-Authenticate header" do
    it "should correctly handle OAuth challenge with auth-params" do
      parameters = Signet::OAuth2.parse_www_authenticate_header(
        'OAuth realm="http://sp.example.com/", error="expired_token", ' \
        'error_description="The access token has expired."'
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
      expect(parameters["realm"]).to eq "http://sp.example.com/"
      expect(parameters["error"]).to eq "expired_token"
      expect(parameters["error_description"]).to eq "The access token has expired."
    end

    it "should liberally handle auth-params with single-quoted strings" do
      parameters = Signet::OAuth2.parse_www_authenticate_header(
        "OAuth realm='http://sp.example.com/', error='expired_token', " \
        "error_description='The access token has expired.'"
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
      expect(parameters["realm"]).to eq "http://sp.example.com/"
      expect(parameters["error"]).to eq "expired_token"
      expect(parameters["error_description"]).to eq "The access token has expired."
    end

    it "should liberally handle auth-params with token strings" do
      parameters = Signet::OAuth2.parse_www_authenticate_header(
        'OAuth realm="http://sp.example.com/", error=expired_token, ' \
        'error_description="The access token has expired."'
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
      expect(parameters["realm"]).to eq "http://sp.example.com/"
      expect(parameters["error"]).to eq "expired_token"
      expect(parameters["error_description"]).to eq "The access token has expired."
    end

    it "should liberally handle out-of-order auth-params" do
      parameters = Signet::OAuth2.parse_www_authenticate_header(
        "OAuth error_description='The access token has expired.', " \
        "error='expired_token', realm='http://sp.example.com/'"
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
      expect(parameters["realm"]).to eq "http://sp.example.com/"
      expect(parameters["error"]).to eq "expired_token"
      expect(parameters["error_description"]).to eq "The access token has expired."
    end

    it "should not allow unquoted strings that do not match tchar" do
      expect(lambda do
        Signet::OAuth2.parse_www_authenticate_header(
          "OAuth realm=http://sp.example.com/, error=expired_token, " \
          'error_description="The access token has expired."'
        )
      end).to raise_error(Signet::ParseError)
    end

    it "should not parse non-OAuth challenges" do
      expect(lambda do
        Signet::OAuth2.parse_www_authenticate_header(
          'AuthSub realm="https://www.google.com/accounts/AuthSubRequest"'
        )
      end).to raise_error(Signet::ParseError)
    end
  end

  describe "when generating a Basic Authorization header" do
    it "should correctly handle client ID and password pairs" do
      # Example from OAuth 2 spec
      expect(Signet::OAuth2.generate_basic_authorization_header(
               "s6BhdRkqt3", "gX1fBat3bV"
             )).to eq "Basic czZCaGRSa3F0MzpnWDFmQmF0M2JW"
    end

    it "should correctly encode using the alogrithm given in RFC 2617" do
      # Example from RFC 2617
      expect(Signet::OAuth2.generate_basic_authorization_header(
               "Aladdin", "open sesame"
             )).to eq "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ=="
    end
  end

  describe "when parsing a token response body" do
    it "should correctly handle just an access token" do
      expect(Signet::OAuth2.parse_credentials(
               '{"access_token": "12345"}',
               "application/json; charset=utf-8"
             )).to eq ({ "access_token" => "12345" })
    end

    it "should handle form encoded responses" do
      expect(Signet::OAuth2.parse_credentials(
               "access_token=12345&expires=1000",
               "application/x-www-form-urlencoded; charset=utf-8"
             )).to eq("access_token" => "12345", "expires" => "1000")
    end

    it "should raise an error for an invalid body" do
      expect(lambda do
        Signet::OAuth2.parse_credentials(
          "This is not JSON.",
          "application/json"
        )
      end).to raise_error(MultiJson::DecodeError)
    end

    it "should raise an error for a bogus body" do
      expect(lambda do
        Signet::OAuth2.parse_credentials :bogus, "application/json"
      end).to raise_error(TypeError)
    end
  end
end
