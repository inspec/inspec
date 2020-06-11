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
require "signet/oauth_1"
require "signet/oauth_1/client"
require "signet/oauth_1/credential"

describe Signet::OAuth1 do
  it "should correctly normalize parameters" do
    parameters = [
      %w[a 1],
      ["c", "hi there"],
      %w[f 25],
      %w[f 50],
      %w[f a],
      %w[z p],
      %w[z t]
    ]
    expect(Signet::OAuth1.normalize_parameters(parameters)).to eq(
      "a=1&c=hi%20there&f=25&f=50&f=a&z=p&z=t"
    )
  end

  it "should correctly normalize parameters" do
    parameters = [
      ["b5", "=%3D"],
      %w[a3 a],
      ["c@", ""],
      ["a2", "r b"],
      %w[oauth_consumer_key 9djdj82h48djs9d2],
      %w[oauth_token kkk9d7dh3k39sjv7],
      ["oauth_signature_method", "HMAC-SHA1"],
      %w[oauth_timestamp 137131201],
      %w[oauth_nonce 7d8f3e4a],
      ["c2", ""],
      ["a3", "2 q"]
    ]
    expect(Signet::OAuth1.normalize_parameters(parameters)).to eq(
      "a2=r%20b&a3=2%20q&a3=a&b5=%3D%253D&c%40=&c2=&oauth_consumer_key=9dj" \
      "dj82h48djs9d2&oauth_nonce=7d8f3e4a&oauth_signature_method=HMAC-SHA1" \
      "&oauth_timestamp=137131201&oauth_token=kkk9d7dh3k39sjv7"
    )
  end

  it 'should exclude the "oauth_signature" parameter when normalizing' do
    parameters = [
      %w[a 1],
      %w[b 2],
      %w[c 3],
      %w[oauth_signature dpf43f3p2l4k3l03]
    ]
    expect(Signet::OAuth1.normalize_parameters(parameters)).to eq(
      "a=1&b=2&c=3"
    )
  end

  it "should raise an error if normalizing parameters with bogus values" do
    expect(lambda do
      Signet::OAuth1.normalize_parameters 42
    end).to raise_error(TypeError)
  end

  it "should raise an error if generating a base string with bogus values" do
    expect(lambda do
      Signet::OAuth1.generate_base_string(
        "GET", "http://photos.example.net/photos", 42
      )
    end).to raise_error(TypeError)
  end

  it "should correctly generate a base string" do
    method = "GET"
    uri = "http://photos.example.net/photos"
    parameters = {
      "oauth_consumer_key"     => "dpf43f3p2l4k3l03",
      "oauth_token"            => "nnch734d00sl2jdk",
      "oauth_signature_method" => "HMAC-SHA1",
      "oauth_timestamp"        => "1191242096",
      "oauth_nonce"            => "kllo9940pd9333jh",
      "oauth_version"          => "1.0",
      "file"                   => "vacation.jpg",
      "size"                   => "original"
    }
    expect(Signet::OAuth1.generate_base_string(method, uri, parameters)).to eq(
      "GET&http%3A%2F%2Fphotos.example.net%2Fphotos&file%3Dvacation.jpg%26" \
      "oauth_consumer_key%3Ddpf43f3p2l4k3l03%26" \
      "oauth_nonce%3Dkllo9940pd9333jh%26" \
      "oauth_signature_method%3DHMAC-SHA1%26" \
      "oauth_timestamp%3D1191242096%26oauth_token%3Dnnch734d00sl2jdk%26" \
      "oauth_version%3D1.0%26size%3Doriginal"
    )
  end

  it "should correctly generate a base string with an already encoded URI" do
    method = "GET"
    uri = "http://photos.example.net/https%3A%2F%2Fwww.example.com"
    parameters = {
      "oauth_consumer_key"     => "dpf43f3p2l4k3l03",
      "oauth_token"            => "nnch734d00sl2jdk",
      "oauth_signature_method" => "HMAC-SHA1",
      "oauth_timestamp"        => "1191242096",
      "oauth_nonce"            => "kllo9940pd9333jh",
      "oauth_version"          => "1.0",
      "file"                   => "vacation.jpg",
      "size"                   => "original"
    }
    expect(Signet::OAuth1.generate_base_string(method, uri, parameters)).to eq(
      "GET&http%3A%2F%2Fphotos.example.net%2F" \
      "https%253A%252F%252Fwww.example.com&file%3Dvacation.jpg%26" \
      "oauth_consumer_key%3Ddpf43f3p2l4k3l03%26" \
      "oauth_nonce%3Dkllo9940pd9333jh%26" \
      "oauth_signature_method%3DHMAC-SHA1%26" \
      "oauth_timestamp%3D1191242096%26oauth_token%3Dnnch734d00sl2jdk%26" \
      "oauth_version%3D1.0%26size%3Doriginal"
    )
  end

  it "should correctly generate a base string with an already encoded URI" do
    method = "GET"
    uri = "http://example.com/r%20v/X?id=123"
    parameters = {
      "oauth_consumer_key"     => "dpf43f3p2l4k3l03",
      "oauth_token"            => "nnch734d00sl2jdk",
      "oauth_signature_method" => "HMAC-SHA1",
      "oauth_timestamp"        => "1191242096",
      "oauth_nonce"            => "kllo9940pd9333jh",
      "oauth_version"          => "1.0"
    }
    expect(Signet::OAuth1.generate_base_string(method, uri, parameters)).to eq(
      "GET&http%3A%2F%2Fexample.com%2Fr%2520v%2FX&" \
      "id%3D123%26oauth_consumer_key%3Ddpf43f3p2l4k3l03%26" \
      "oauth_nonce%3Dkllo9940pd9333jh%26" \
      "oauth_signature_method%3DHMAC-SHA1%26" \
      "oauth_timestamp%3D1191242096%26oauth_token%3Dnnch734d00sl2jdk%26" \
      "oauth_version%3D1.0"
    )
  end

  it "should correctly generate a base string when port 8080 is specified" do
    method = "GET"
    uri = "http://www.example.net:8080/?q=1"
    parameters = {
      "oauth_consumer_key"     => "dpf43f3p2l4k3l03",
      "oauth_token"            => "nnch734d00sl2jdk",
      "oauth_signature_method" => "HMAC-SHA1",
      "oauth_timestamp"        => "1191242096",
      "oauth_nonce"            => "kllo9940pd9333jh",
      "oauth_version"          => "1.0"
    }
    expect(Signet::OAuth1.generate_base_string(method, uri, parameters)).to eq(
      "GET&http%3A%2F%2Fwww.example.net%3A8080%2F&" \
      "oauth_consumer_key%3Ddpf43f3p2l4k3l03%26" \
      "oauth_nonce%3Dkllo9940pd9333jh%26" \
      "oauth_signature_method%3DHMAC-SHA1%26oauth_timestamp%3D1191242096%26" \
      "oauth_token%3Dnnch734d00sl2jdk%26oauth_version%3D1.0%26q%3D1"
    )
  end

  it "should correctly generate a base string when port 80 is specified" do
    method = "GET"
    uri = "http://photos.example.net:80/photos"
    parameters = {
      "oauth_consumer_key"     => "dpf43f3p2l4k3l03",
      "oauth_token"            => "nnch734d00sl2jdk",
      "oauth_signature_method" => "HMAC-SHA1",
      "oauth_timestamp"        => "1191242096",
      "oauth_nonce"            => "kllo9940pd9333jh",
      "oauth_version"          => "1.0",
      "file"                   => "vacation.jpg",
      "size"                   => "original"
    }
    expect(Signet::OAuth1.generate_base_string(method, uri, parameters)).to eq(
      "GET&http%3A%2F%2Fphotos.example.net%2Fphotos&file%3Dvacation.jpg%26" \
      "oauth_consumer_key%3Ddpf43f3p2l4k3l03%26" \
      "oauth_nonce%3Dkllo9940pd9333jh%26" \
      "oauth_signature_method%3DHMAC-SHA1%26" \
      "oauth_timestamp%3D1191242096%26oauth_token%3Dnnch734d00sl2jdk%26" \
      "oauth_version%3D1.0%26size%3Doriginal"
    )
  end

  it "should correctly generate a base string when port 443 is specified" do
    method = "GET"
    uri = "https://photos.example.net:443/photos"
    parameters = {
      "oauth_consumer_key"     => "dpf43f3p2l4k3l03",
      "oauth_token"            => "nnch734d00sl2jdk",
      "oauth_signature_method" => "HMAC-SHA1",
      "oauth_timestamp"        => "1191242096",
      "oauth_nonce"            => "kllo9940pd9333jh",
      "oauth_version"          => "1.0",
      "file"                   => "vacation.jpg",
      "size"                   => "original"
    }
    expect(Signet::OAuth1.generate_base_string(method, uri, parameters)).to eq(
      "GET&https%3A%2F%2Fphotos.example.net%2Fphotos&file%3Dvacation.jpg%26" \
      "oauth_consumer_key%3Ddpf43f3p2l4k3l03%26" \
      "oauth_nonce%3Dkllo9940pd9333jh%26" \
      "oauth_signature_method%3DHMAC-SHA1%26" \
      "oauth_timestamp%3D1191242096%26oauth_token%3Dnnch734d00sl2jdk%26" \
      "oauth_version%3D1.0%26size%3Doriginal"
    )
  end

  it "should correctly generate a base signature with uppercase scheme" do
    method = "GET"
    uri =
      "HTTP://photos.example.net/photos?file=vacation.jpg"
    parameters = {
      "oauth_consumer_key"     => "dpf43f3p2l4k3l03",
      "oauth_token"            => "nnch734d00sl2jdk",
      "oauth_signature_method" => "HMAC-SHA1",
      "oauth_timestamp"        => "1191242096",
      "oauth_nonce"            => "kllo9940pd9333jh",
      "oauth_version"          => "1.0",
      "size"                   => "original"
    }
    expect(Signet::OAuth1.generate_base_string(method, uri, parameters)).to eq(
      "GET&http%3A%2F%2Fphotos.example.net%2Fphotos&file%3Dvacation.jpg%26" \
      "oauth_consumer_key%3Ddpf43f3p2l4k3l03%26" \
      "oauth_nonce%3Dkllo9940pd9333jh%26" \
      "oauth_signature_method%3DHMAC-SHA1%26" \
      "oauth_timestamp%3D1191242096%26oauth_token%3Dnnch734d00sl2jdk%26" \
      "oauth_version%3D1.0%26size%3Doriginal"
    )
  end

  it "should correctly generate a base signature with mixedcase authority" do
    method = "GET"
    uri =
      "http://photos.eXaMpLe.NET/photos?file=vacation.jpg"
    parameters = {
      "oauth_consumer_key"     => "dpf43f3p2l4k3l03",
      "oauth_token"            => "nnch734d00sl2jdk",
      "oauth_signature_method" => "HMAC-SHA1",
      "oauth_timestamp"        => "1191242096",
      "oauth_nonce"            => "kllo9940pd9333jh",
      "oauth_version"          => "1.0",
      "size"                   => "original"
    }
    expect(Signet::OAuth1.generate_base_string(method, uri, parameters)).to eq(
      "GET&http%3A%2F%2Fphotos.example.net%2Fphotos&file%3Dvacation.jpg%26" \
      "oauth_consumer_key%3Ddpf43f3p2l4k3l03%26" \
      "oauth_nonce%3Dkllo9940pd9333jh%26" \
      "oauth_signature_method%3DHMAC-SHA1%26" \
      "oauth_timestamp%3D1191242096%26oauth_token%3Dnnch734d00sl2jdk%26" \
      "oauth_version%3D1.0%26size%3Doriginal"
    )
  end

  it "should correctly generate a base signature with a method symbol" do
    method = :get
    uri =
      "http://photos.example.net/photos?file=vacation.jpg"
    parameters = {
      "oauth_consumer_key"     => "dpf43f3p2l4k3l03",
      "oauth_token"            => "nnch734d00sl2jdk",
      "oauth_signature_method" => "HMAC-SHA1",
      "oauth_timestamp"        => "1191242096",
      "oauth_nonce"            => "kllo9940pd9333jh",
      "oauth_version"          => "1.0",
      "size"                   => "original"
    }
    expect(Signet::OAuth1.generate_base_string(method, uri, parameters)).to eq(
      "GET&http%3A%2F%2Fphotos.example.net%2Fphotos&file%3Dvacation.jpg%26" \
      "oauth_consumer_key%3Ddpf43f3p2l4k3l03%26" \
      "oauth_nonce%3Dkllo9940pd9333jh%26" \
      "oauth_signature_method%3DHMAC-SHA1%26" \
      "oauth_timestamp%3D1191242096%26oauth_token%3Dnnch734d00sl2jdk%26" \
      "oauth_version%3D1.0%26size%3Doriginal"
    )
  end

  it "should correctly generate an authorization header" do
    parameters = [
      %w[oauth_consumer_key 0685bd9184jfhq22],
      %w[oauth_token ad180jjd733klru7],
      ["oauth_signature_method", "HMAC-SHA1"],
      ["oauth_signature", "wOJIO9A2W5mFwDgiDvZbTSMK/PY="],
      %w[oauth_timestamp 137131200],
      %w[oauth_nonce 4572616e48616d6d65724c61686176],
      ["oauth_version", "1.0"]
    ]
    expect(Signet::OAuth1.generate_authorization_header(
             parameters, "http://sp.example.com/"
           )).to eq(
             'OAuth realm="http://sp.example.com/", ' \
             'oauth_consumer_key="0685bd9184jfhq22", ' \
             'oauth_token="ad180jjd733klru7", ' \
             'oauth_signature_method="HMAC-SHA1", ' \
             'oauth_signature="wOJIO9A2W5mFwDgiDvZbTSMK%2FPY%3D", ' \
             'oauth_timestamp="137131200", ' \
             'oauth_nonce="4572616e48616d6d65724c61686176", ' \
             'oauth_version="1.0"'
           )
  end

  it "should raise an error if generating an authorization header " \
     "with bogus values" do
    expect(lambda do
      Signet::OAuth1.generate_authorization_header 42
    end).to raise_error(TypeError)
  end

  it "should raise an error if generating an authorization header " \
     'with the "realm" parameter specified the wrong way' do
    parameters = [
      ["realm", "http://sp.example.com/"],
      %w[oauth_consumer_key 0685bd9184jfhq22],
      %w[oauth_token ad180jjd733klru7],
      ["oauth_signature_method", "HMAC-SHA1"],
      ["oauth_signature", "wOJIO9A2W5mFwDgiDvZbTSMK/PY="],
      %w[oauth_timestamp 137131200],
      %w[oauth_nonce 4572616e48616d6d65724c61686176],
      ["oauth_version", "1.0"]
    ]
    expect(lambda do
      Signet::OAuth1.generate_authorization_header parameters
    end).to raise_error(ArgumentError)
  end

  it "should correctly parse an authorization header" do
    parameters = Signet::OAuth1.parse_authorization_header(
      'OAuth realm="http://sp.example.com/", ' \
      'oauth_consumer_key="0685bd9184jfhq22", ' \
      'oauth_token="ad180jjd733klru7", ' \
      'oauth_signature_method="HMAC-SHA1", ' \
      'oauth_signature="wOJIO9A2W5mFwDgiDvZbTSMK%2FPY%3D", ' \
      'oauth_timestamp="137131200", ' \
      'oauth_nonce="4572616e48616d6d65724c61686176", ' \
      'oauth_version="1.0"'
    ).each_with_object({}) { |(k, v), h| h[k] = v; }
    expect(parameters["realm"]).to eq "http://sp.example.com/"
    expect(parameters["oauth_consumer_key"]).to eq "0685bd9184jfhq22"
    expect(parameters["oauth_token"]).to eq "ad180jjd733klru7"
    expect(parameters["oauth_signature_method"]).to eq "HMAC-SHA1"
    expect(parameters["oauth_signature"]).to eq "wOJIO9A2W5mFwDgiDvZbTSMK/PY="
    expect(parameters["oauth_timestamp"]).to eq "137131200"
    expect(parameters["oauth_nonce"]).to eq "4572616e48616d6d65724c61686176"
    expect(parameters["oauth_version"]).to eq "1.0"
  end

  it "should not unescape a realm in an authorization header" do
    parameters = Signet::OAuth1.parse_authorization_header(
      'OAuth realm="http%3A%2F%2Fsp.example.com%2F", ' \
      'domain="http%3A%2F%2Fsp.example.com%2F", ' \
      'oauth_consumer_key="0685bd9184jfhq22", ' \
      'oauth_token="ad180jjd733klru7", ' \
      'oauth_signature_method="HMAC-SHA1", ' \
      'oauth_signature="wOJIO9A2W5mFwDgiDvZbTSMK%2FPY%3D", ' \
      'oauth_timestamp="137131200", ' \
      'oauth_nonce="4572616e48616d6d65724c61686176", ' \
      'oauth_version="1.0"'
    ).each_with_object({}) { |(k, v), h| h[k] = v; }
    expect(parameters["realm"]).to eq "http%3A%2F%2Fsp.example.com%2F"
    expect(parameters["domain"]).to eq "http://sp.example.com/"
    expect(parameters["oauth_consumer_key"]).to eq "0685bd9184jfhq22"
    expect(parameters["oauth_token"]).to eq "ad180jjd733klru7"
    expect(parameters["oauth_signature_method"]).to eq "HMAC-SHA1"
    expect(parameters["oauth_signature"]).to eq "wOJIO9A2W5mFwDgiDvZbTSMK/PY="
    expect(parameters["oauth_timestamp"]).to eq "137131200"
    expect(parameters["oauth_nonce"]).to eq "4572616e48616d6d65724c61686176"
    expect(parameters["oauth_version"]).to eq "1.0"
  end

  it "should raise an error if parsing an authorization header " \
     "with bogus values" do
    expect(lambda do
      Signet::OAuth1.parse_authorization_header 42
    end).to raise_error(TypeError)
  end

  it "should raise an error if parsing a non-OAuth authorization header" do
    expect(lambda do
      Signet::OAuth1.parse_authorization_header(
        "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ=="
      )
    end).to raise_error(Signet::ParseError)
  end

  it "should correctly parse a form encoded credential" do
    credential = Signet::OAuth1.parse_form_encoded_credentials(
      "oauth_token=hh5s93j4hdidpola&oauth_token_secret=hdhd0244k9j7ao03"
    )
    expect(credential.key).to eq "hh5s93j4hdidpola"
    expect(credential.secret).to eq "hdhd0244k9j7ao03"
  end

  it "should correctly parse a form encoded credential" do
    credential = Signet::OAuth1.parse_form_encoded_credentials(
      "oauth_token=hdk48Djdsa&oauth_token_secret=xyz4992k83j47x0b&" \
      "oauth_callback_confirmed=true"
    )
    expect(credential.key).to eq "hdk48Djdsa"
    expect(credential.secret).to eq "xyz4992k83j47x0b"
  end

  it "should raise an error if parsing a form encoded credential " \
     "with bogus values" do
    expect(lambda do
      Signet::OAuth1.parse_form_encoded_credentials 42
    end).to raise_error(TypeError)
  end

  it "should correctly generate a signature for a set of parameters" do
    method = :get
    uri = "http://photos.example.net/photos"
    client_credential_secret = "kd94hf93k423kf44"
    token_credential_secret = "pfkkdhi9sl3r4s00"
    parameters = {
      "oauth_consumer_key"     => "dpf43f3p2l4k3l03",
      "oauth_token"            => "nnch734d00sl2jdk",
      "oauth_signature_method" => "HMAC-SHA1",
      "oauth_timestamp"        => "1191242096",
      "oauth_nonce"            => "kllo9940pd9333jh",
      "oauth_version"          => "1.0",
      "file"                   => "vacation.jpg",
      "size"                   => "original"
    }
    expect(Signet::OAuth1.sign_parameters(
             method,
             uri,
             parameters,
             client_credential_secret,
             token_credential_secret
           )).to eq "tR3+Ty81lMeYAr/Fid0kMTYa/WM="
  end

  it "should raise an error when trying to sign with with unknown method" do
    method = :get
    uri = "http://photos.example.net/photos"
    client_credential_secret = "kd94hf93k423kf44"
    token_credential_secret = "pfkkdhi9sl3r4s00"
    parameters = {
      "oauth_consumer_key"     => "dpf43f3p2l4k3l03",
      "oauth_token"            => "nnch734d00sl2jdk",
      "oauth_signature_method" => "HMAC-BOGUS", # Unknown signature method
      "oauth_timestamp"        => "1191242096",
      "oauth_nonce"            => "kllo9940pd9333jh",
      "oauth_version"          => "1.0",
      "file"                   => "vacation.jpg",
      "size"                   => "original"
    }
    expect(lambda do
      Signet::OAuth1.sign_parameters(
        method,
        uri,
        parameters,
        client_credential_secret,
        token_credential_secret
      )
    end).to raise_error(NotImplementedError)
  end

  it "should correctly generate authorization URIs" do
    authorization_uri = "http://photos.example.net/authorize"
    temporary_credential_key = "hh5s93j4hdidpola"
    callback = "http://printer.example.com/request_token_ready"
    parsed_uri = Addressable::URI.parse(
      Signet::OAuth1.generate_authorization_uri(
        authorization_uri,
        temporary_credential_key: temporary_credential_key,
        callback:                 callback
      )
    )
    expect(parsed_uri.query_values).to have_key("oauth_token")
    expect(parsed_uri.query_values["oauth_token"]).to eq temporary_credential_key
    expect(parsed_uri.query_values).to have_key("oauth_callback")
    expect(parsed_uri.query_values["oauth_callback"]).to eq callback
  end
end

describe Signet::OAuth1, "when generating temporary credentials parameters" do
  before do
    @client_credential_key = "dpf43f3p2l4k3l03"
    @callback = "http://printer.example.com/request_token_ready"
    @signature_method = "HMAC-SHA1"
    @scope = "http://photos.example.com/full_access"
    @additional_parameters = [["scope", @scope]]
    @unsigned_parameters =
      Signet::OAuth1.unsigned_temporary_credential_parameters(
        client_credential_key: @client_credential_key,
        callback:              @callback,
        signature_method:      @signature_method,
        additional_parameters: @additional_parameters
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
  end

  it "should raise an error if the client credential key is missing" do
    expect(lambda do
      Signet::OAuth1.unsigned_temporary_credential_parameters(
        client_credential_key: nil,
        callback:              @callback,
        signature_method:      @signature_method,
        additional_parameters: @additional_parameters
      )
    end).to raise_error(ArgumentError)
  end

  it "should have the correct client credential key" do
    expect(@unsigned_parameters).to have_key("oauth_consumer_key")
    expect(@unsigned_parameters["oauth_consumer_key"]).to eq @client_credential_key
  end

  it "should have the correct signature method" do
    expect(@unsigned_parameters).to have_key("oauth_signature_method")
    expect(@unsigned_parameters["oauth_signature_method"]).to eq @signature_method
  end

  it "should have a valid timestamp" do
    # Verify that we have a timestamp, it's in the correct format and within
    # a reasonable range of the current time.
    expect(@unsigned_parameters).to have_key("oauth_timestamp")
    expect(@unsigned_parameters["oauth_timestamp"]).to match(/^[0-9]+$/)
    expect(@unsigned_parameters["oauth_timestamp"].to_i).to be <= Time.now.to_i
    expect(@unsigned_parameters["oauth_timestamp"].to_i).to be >= Time.now.to_i - 1
  end

  it "should have a valid nonce" do
    # Verify that we have a nonce and that it has sufficient length for
    # uniqueness.
    expect(@unsigned_parameters).to have_key("oauth_nonce")
    expect(@unsigned_parameters["oauth_nonce"]).to match(/^[0-9a-zA-Z]{16,100}$/)
  end

  it "should have the correct callback" do
    expect(@unsigned_parameters).to have_key("oauth_callback")
    expect(@unsigned_parameters["oauth_callback"]).to eq @callback
  end

  it "should have the correct scope parameter" do
    expect(@unsigned_parameters).to have_key("scope")
    expect(@unsigned_parameters["scope"]).to eq @scope
  end

  it "should have the correct OAuth version" do
    expect(@unsigned_parameters).to have_key("oauth_version")
    expect(@unsigned_parameters["oauth_version"]).to eq "1.0"
  end
end

describe Signet::OAuth1, "when generating token credential parameters" do
  before do
    @client_credential_key = "dpf43f3p2l4k3l03"
    @temporary_credential_key = "hh5s93j4hdidpola"
    @verifier = "473f82d3"
    @signature_method = "HMAC-SHA1"
    @unsigned_parameters =
      Signet::OAuth1.unsigned_token_credential_parameters(
        client_credential_key:    @client_credential_key,
        temporary_credential_key: @temporary_credential_key,
        signature_method:         @signature_method,
        verifier:                 @verifier
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
  end

  it "should raise an error if the client credential key is missing" do
    expect(lambda do
      Signet::OAuth1.unsigned_token_credential_parameters(
        client_credential_key:    nil,
        temporary_credential_key: @temporary_credential_key,
        signature_method:         @signature_method,
        verifier:                 @verifier
      )
    end).to raise_error(ArgumentError)
  end

  it "should raise an error if the temporary credential key is missing" do
    expect(lambda do
      Signet::OAuth1.unsigned_token_credential_parameters(
        client_credential_key:    @client_credential_key,
        temporary_credential_key: nil,
        signature_method:         @signature_method,
        verifier:                 @verifier
      )
    end).to raise_error(ArgumentError)
  end

  it "should raise an error if the verifier is missing" do
    expect(lambda do
      Signet::OAuth1.unsigned_token_credential_parameters(
        client_credential_key:    @client_credential_key,
        temporary_credential_key: @temporary_credential_key,
        signature_method:         @signature_method,
        verifier:                 nil
      )
    end).to raise_error(ArgumentError)
  end

  it "should have the correct client credential key" do
    expect(@unsigned_parameters).to have_key("oauth_consumer_key")
    expect(@unsigned_parameters["oauth_consumer_key"]).to eq @client_credential_key
  end

  it "should have the correct temporary credentials key" do
    expect(@unsigned_parameters).to have_key("oauth_token")
    expect(@unsigned_parameters["oauth_token"]).to eq @temporary_credential_key
  end

  it "should have the correct signature method" do
    expect(@unsigned_parameters).to have_key("oauth_signature_method")
    expect(@unsigned_parameters["oauth_signature_method"]).to eq @signature_method
  end

  it "should have a valid timestamp" do
    # Verify that we have a timestamp, it's in the correct format and within
    # a reasonable range of the current time.
    expect(@unsigned_parameters).to have_key("oauth_timestamp")
    expect(@unsigned_parameters["oauth_timestamp"]).to match(/^[0-9]+$/)
    expect(@unsigned_parameters["oauth_timestamp"].to_i).to be <= Time.now.to_i
    expect(@unsigned_parameters["oauth_timestamp"].to_i).to be >= Time.now.to_i - 1
  end

  it "should have a valid nonce" do
    # Verify that we have a nonce and that it has sufficient length for
    # uniqueness.
    expect(@unsigned_parameters).to have_key("oauth_nonce")
    expect(@unsigned_parameters["oauth_nonce"]).to match(/^[0-9a-zA-Z]{16,100}$/)
  end

  it "should have the verifier" do
    expect(@unsigned_parameters).to have_key("oauth_verifier")
    expect(@unsigned_parameters["oauth_verifier"]).to eq @verifier
  end

  it "should have the correct OAuth version" do
    expect(@unsigned_parameters).to have_key("oauth_version")
    expect(@unsigned_parameters["oauth_version"]).to eq "1.0"
  end
end

describe Signet::OAuth1, "when generating protected resource parameters" do
  before do
    @client_credential_key = "dpf43f3p2l4k3l03"
    @token_credential_key = "nnch734d00sl2jdk"
    @signature_method = "HMAC-SHA1"
    @unsigned_parameters =
      Signet::OAuth1.unsigned_resource_parameters(
        client_credential_key: @client_credential_key,
        token_credential_key:  @token_credential_key,
        signature_method:      @signature_method
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
  end

  it "should raise an error if the client credential key is missing" do
    expect(lambda do
      Signet::OAuth1.unsigned_resource_parameters(
        client_credential_key: nil,
        token_credential_key:  @token_credential_key,
        signature_method:      @signature_method
      )
    end).to raise_error(ArgumentError)
  end

  it "should raise an error if the token credential key is missing" do
    expect(lambda do
      Signet::OAuth1.unsigned_resource_parameters(
        client_credential_key: @client_credential_key,
        token_credential_key:  nil,
        signature_method:      @signature_method
      )
    end).to raise_error(ArgumentError)
  end

  it "should have the correct client credential key" do
    expect(@unsigned_parameters).to have_key("oauth_consumer_key")
    expect(@unsigned_parameters["oauth_consumer_key"]).to eq @client_credential_key
  end

  it "should have the correct token credentials key" do
    expect(@unsigned_parameters).to have_key("oauth_token")
    expect(@unsigned_parameters["oauth_token"]).to eq @token_credential_key
  end

  it "should have the correct signature method" do
    expect(@unsigned_parameters).to have_key("oauth_signature_method")
    expect(@unsigned_parameters["oauth_signature_method"]).to eq @signature_method
  end

  it "should have a valid timestamp" do
    # Verify that we have a timestamp, it's in the correct format and within
    # a reasonable range of the current time.
    expect(@unsigned_parameters).to have_key("oauth_timestamp")
    expect(@unsigned_parameters["oauth_timestamp"]).to match(/^[0-9]+$/)
    expect(@unsigned_parameters["oauth_timestamp"].to_i).to be <= Time.now.to_i
    expect(@unsigned_parameters["oauth_timestamp"].to_i).to be >= Time.now.to_i - 1
  end

  it "should have a valid nonce" do
    # Verify that we have a nonce and that it has sufficient length for
    # uniqueness.
    expect(@unsigned_parameters).to have_key("oauth_nonce")
    expect(@unsigned_parameters["oauth_nonce"]).to match(/^[0-9a-zA-Z]{16,100}$/)
  end

  it "should have the correct OAuth version" do
    expect(@unsigned_parameters).to have_key("oauth_version")
    expect(@unsigned_parameters["oauth_version"]).to eq "1.0"
  end
end

describe Signet::OAuth1, "when generating token credential parameters " \
                         "with Signet::OAuth1::Credential objects" do
  before do
    @client_credential = Signet::OAuth1::Credential.new(
      "dpf43f3p2l4k3l03", "kd94hf93k423kf44"
    )
    @temporary_credential = Signet::OAuth1::Credential.new(
      "hh5s93j4hdidpola", "hdhd0244k9j7ao03"
    )
    @verifier = "473f82d3"
    @signature_method = "HMAC-SHA1"
    @unsigned_parameters =
      Signet::OAuth1.unsigned_token_credential_parameters(
        client_credential:    @client_credential,
        temporary_credential: @temporary_credential,
        signature_method:     @signature_method,
        verifier:             @verifier
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
  end

  it "should have the correct client credential key" do
    expect(@unsigned_parameters).to have_key("oauth_consumer_key")
    expect(@unsigned_parameters["oauth_consumer_key"]).to eq @client_credential.key
  end

  it "should have the correct temporary credentials key" do
    expect(@unsigned_parameters).to have_key("oauth_token")
    expect(@unsigned_parameters["oauth_token"]).to eq @temporary_credential.key
  end

  it "should have the correct signature method" do
    expect(@unsigned_parameters).to have_key("oauth_signature_method")
    expect(@unsigned_parameters["oauth_signature_method"]).to eq @signature_method
  end

  it "should have a valid timestamp" do
    # Verify that we have a timestamp, it's in the correct format and within
    # a reasonable range of the current time.
    expect(@unsigned_parameters).to have_key("oauth_timestamp")
    expect(@unsigned_parameters["oauth_timestamp"]).to match(/^[0-9]+$/)
    expect(@unsigned_parameters["oauth_timestamp"].to_i).to be <= Time.now.to_i
    expect(@unsigned_parameters["oauth_timestamp"].to_i).to be >= Time.now.to_i - 1
  end

  it "should have a valid nonce" do
    # Verify that we have a nonce and that it has sufficient length for
    # uniqueness.
    expect(@unsigned_parameters).to have_key("oauth_nonce")
    expect(@unsigned_parameters["oauth_nonce"]).to match(/^[0-9a-zA-Z]{16,100}$/)
  end

  it "should have the correct OAuth version" do
    expect(@unsigned_parameters).to have_key("oauth_version")
    expect(@unsigned_parameters["oauth_version"]).to eq "1.0"
  end
end

describe Signet::OAuth1, "when generating token credential parameters " \
                         "with a Signet::OAuth1::Client object" do
  before do
    @client = Signet::OAuth1::Client.new
    @client.client_credential = Signet::OAuth1::Credential.new(
      "dpf43f3p2l4k3l03", "kd94hf93k423kf44"
    )
    @client.temporary_credential = Signet::OAuth1::Credential.new(
      "hh5s93j4hdidpola", "hdhd0244k9j7ao03"
    )
    @verifier = "473f82d3"
    @signature_method = "HMAC-SHA1"
    @unsigned_parameters =
      Signet::OAuth1.unsigned_token_credential_parameters(
        client:           @client,
        signature_method: @signature_method,
        verifier:         @verifier
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
  end

  it "should have the correct client credential key" do
    expect(@unsigned_parameters).to have_key("oauth_consumer_key")
    expect(@unsigned_parameters["oauth_consumer_key"]).to eq @client.client_credential_key
  end

  it "should have the correct temporary credentials key" do
    expect(@unsigned_parameters).to have_key("oauth_token")
    expect(@unsigned_parameters["oauth_token"]).to eq @client.temporary_credential_key
  end

  it "should have the correct signature method" do
    expect(@unsigned_parameters).to have_key("oauth_signature_method")
    expect(@unsigned_parameters["oauth_signature_method"]).to eq @signature_method
  end

  it "should have a valid timestamp" do
    # Verify that we have a timestamp, it's in the correct format and within
    # a reasonable range of the current time.
    expect(@unsigned_parameters).to have_key("oauth_timestamp")
    expect(@unsigned_parameters["oauth_timestamp"]).to match(/^[0-9]+$/)
    expect(@unsigned_parameters["oauth_timestamp"].to_i).to be <= Time.now.to_i
    expect(@unsigned_parameters["oauth_timestamp"].to_i).to be >= Time.now.to_i - 1
  end

  it "should have a valid nonce" do
    # Verify that we have a nonce and that it has sufficient length for
    # uniqueness.
    expect(@unsigned_parameters).to have_key("oauth_nonce")
    expect(@unsigned_parameters["oauth_nonce"]).to match(/^[0-9a-zA-Z]{16,100}$/)
  end

  it "should have the correct OAuth version" do
    expect(@unsigned_parameters).to have_key("oauth_version")
    expect(@unsigned_parameters["oauth_version"]).to eq "1.0"
  end
end

describe Signet::OAuth1, "when generating token credential parameters " \
                         "with Signet::OAuth1::Credential objects" do
  before do
    @client_credential = Signet::OAuth1::Credential.new(
      "dpf43f3p2l4k3l03", "kd94hf93k423kf44"
    )
    @temporary_credential = Signet::OAuth1::Credential.new(
      "hh5s93j4hdidpola", "hdhd0244k9j7ao03"
    )
    @verifier = "473f82d3"
    @signature_method = "HMAC-SHA1"
    @unsigned_parameters =
      Signet::OAuth1.unsigned_token_credential_parameters(
        client_credential:    @client_credential,
        temporary_credential: @temporary_credential,
        signature_method:     @signature_method,
        verifier:             @verifier
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
  end

  it "should have the correct client credential key" do
    expect(@unsigned_parameters).to have_key("oauth_consumer_key")
    expect(@unsigned_parameters["oauth_consumer_key"]).to eq @client_credential.key
  end

  it "should have the correct temporary credentials key" do
    expect(@unsigned_parameters).to have_key("oauth_token")
    expect(@unsigned_parameters["oauth_token"]).to eq @temporary_credential.key
  end

  it "should have the correct signature method" do
    expect(@unsigned_parameters).to have_key("oauth_signature_method")
    expect(@unsigned_parameters["oauth_signature_method"]).to eq @signature_method
  end

  it "should have a valid timestamp" do
    # Verify that we have a timestamp, it's in the correct format and within
    # a reasonable range of the current time.
    expect(@unsigned_parameters).to have_key("oauth_timestamp")
    expect(@unsigned_parameters["oauth_timestamp"]).to match(/^[0-9]+$/)
    expect(@unsigned_parameters["oauth_timestamp"].to_i).to be <= Time.now.to_i
    expect(@unsigned_parameters["oauth_timestamp"].to_i).to be >= Time.now.to_i - 1
  end

  it "should have a valid nonce" do
    # Verify that we have a nonce and that it has sufficient length for
    # uniqueness.
    expect(@unsigned_parameters).to have_key("oauth_nonce")
    expect(@unsigned_parameters["oauth_nonce"]).to match(/^[0-9a-zA-Z]{16,100}$/)
  end

  it "should have the correct OAuth version" do
    expect(@unsigned_parameters).to have_key("oauth_version")
    expect(@unsigned_parameters["oauth_version"]).to eq "1.0"
  end
end

describe Signet::OAuth1, "extracting credential keys from options" do
  it "should raise an error for bogus credentials" do
    expect(lambda do
      Signet::OAuth1.extract_credential_key_option(
        :client, client_credential_key: true
      )
    end).to raise_error(TypeError)
  end

  it "should raise an error for bogus credentials" do
    expect(lambda do
      Signet::OAuth1.extract_credential_key_option(
        :client, client_credential: 42
      )
    end).to raise_error(TypeError)
  end

  it "should raise an error for bogus credentials" do
    expect(lambda do
      Signet::OAuth1.extract_credential_key_option(
        :client, client: 42
      )
    end).to raise_error(TypeError)
  end

  it "should return nil for missing credential key" do
    expect(Signet::OAuth1.extract_credential_key_option(:client, {})).to eq nil
  end

  it "should find the correct credential key" do
    expect(Signet::OAuth1.extract_credential_key_option(
             :client, client_credential_key: "dpf43f3p2l4k3l03"
           )).to eq "dpf43f3p2l4k3l03"
  end

  it "should find the correct credential key" do
    expect(Signet::OAuth1.extract_credential_key_option(
             :client, client_credential: Signet::OAuth1::Credential.new(
               "dpf43f3p2l4k3l03", "kd94hf93k423kf44"
             )
           )).to eq "dpf43f3p2l4k3l03"
  end

  it "should find the correct credential key" do
    client = Signet::OAuth1::Client.new
    client.client_credential = Signet::OAuth1::Credential.new(
      "dpf43f3p2l4k3l03", "kd94hf93k423kf44"
    )
    expect(Signet::OAuth1.extract_credential_key_option(
             :client, client: client
           )).to eq "dpf43f3p2l4k3l03"
  end

  it "should find the correct credential key" do
    client = Signet::OAuth1::Client.new
    client.temporary_credential = Signet::OAuth1::Credential.new(
      "hh5s93j4hdidpola", "hdhd0244k9j7ao03"
    )
    expect(Signet::OAuth1.extract_credential_key_option(
             :temporary, client: client
           )).to eq "hh5s93j4hdidpola"
  end
end

describe Signet::OAuth1, "extracting credential secrets from options" do
  it "should raise an error for bogus credentials" do
    expect(lambda do
      Signet::OAuth1.extract_credential_secret_option(
        :client, client_credential_secret: true
      )
    end).to raise_error(TypeError)
  end

  it "should raise an error for bogus credentials" do
    expect(lambda do
      Signet::OAuth1.extract_credential_secret_option(
        :client, client_credential: 42
      )
    end).to raise_error(TypeError)
  end

  it "should raise an error for bogus credentials" do
    expect(lambda do
      Signet::OAuth1.extract_credential_secret_option(
        :client, client: 42
      )
    end).to raise_error(TypeError)
  end

  it "should raise an error for missing credential secret" do
    expect(Signet::OAuth1.extract_credential_secret_option(:client, {})).to eq nil
  end

  it "should find the correct credential secret" do
    expect(Signet::OAuth1.extract_credential_secret_option(
             :client, client_credential_secret: "kd94hf93k423kf44"
           )).to eq "kd94hf93k423kf44"
  end

  it "should find the correct credential secret" do
    expect(Signet::OAuth1.extract_credential_secret_option(
             :client, client_credential: Signet::OAuth1::Credential.new(
               "dpf43f3p2l4k3l03", "kd94hf93k423kf44"
             )
           )).to eq "kd94hf93k423kf44"
  end

  it "should find the correct credential secret" do
    client = Signet::OAuth1::Client.new
    client.client_credential = Signet::OAuth1::Credential.new(
      "dpf43f3p2l4k3l03", "kd94hf93k423kf44"
    )
    expect(Signet::OAuth1.extract_credential_secret_option(
             :client, client: client
           )).to eq "kd94hf93k423kf44"
  end

  it "should find the correct credential secret" do
    client = Signet::OAuth1::Client.new
    client.temporary_credential = Signet::OAuth1::Credential.new(
      "hh5s93j4hdidpola", "hdhd0244k9j7ao03"
    )
    expect(Signet::OAuth1.extract_credential_secret_option(
             :temporary, client: client
           )).to eq "hdhd0244k9j7ao03"
  end
end
