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
require "signet"
require "signet/oauth_1"
require "signet/oauth_1/signature_methods/hmac_sha1"

describe Signet::OAuth1::HMACSHA1 do
  it "should correctly generate a signature" do
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
    client_credential_secret = "kd94hf93k423kf44"
    token_credential_secret = "pfkkdhi9sl3r4s00"
    base_string = Signet::OAuth1.generate_base_string method, uri, parameters
    expect(Signet::OAuth1::HMACSHA1.generate_signature(
             base_string, client_credential_secret, token_credential_secret
           )).to eq "tR3+Ty81lMeYAr/Fid0kMTYa/WM="
  end

  it "should correctly generate a signature" do
    method = "GET"
    uri = "http://photos.example.net/photos"
    parameters = {
      "oauth_consumer_key"     => "www.example.com",
      "oauth_token"            => "4/QL2GT6b5uznYem1ZGH6v+-9mMvRL",
      "oauth_signature_method" => "HMAC-SHA1",
      "oauth_timestamp"        => "1191242096",
      "oauth_nonce"            => "kllo9940pd9333jh",
      "oauth_version"          => "1.0",
      "file"                   => "vacation.jpg",
      "size"                   => "original"
    }
    client_credential_secret = "Kv+o2XXL/9RxkQW3lO3QTVlH"
    token_credential_secret = "QllSuL9eQ5FXFO1Z/HcgL4ON"
    base_string = Signet::OAuth1.generate_base_string method, uri, parameters
    expect(Signet::OAuth1::HMACSHA1.generate_signature(
             base_string, client_credential_secret, token_credential_secret
           )).to eq "G/nkdbmbpEA+6RD1Sc5uIefhFfQ="
  end
end
