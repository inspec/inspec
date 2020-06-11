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
require "signet/oauth_2"

describe Signet do
  describe "when parsing an auth param list" do
    it "should correctly handle commas" do
      parameters = Signet.parse_auth_param_list(
        'a="1, 2" , b="3,4",c="5 , 6" ,d="7 ,8"'
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
      expect(parameters["a"]).to eq "1, 2"
      expect(parameters["b"]).to eq "3,4"
      expect(parameters["c"]).to eq "5 , 6"
      expect(parameters["d"]).to eq "7 ,8"
    end

    it "should correctly handle backslash-escaped pairs" do
      parameters = Signet.parse_auth_param_list(
        'token="\t\o\k\e\n" sigalg="\s\i\g\a\l\g" data="\d\a\t\a"'
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
      expect(parameters["token"]).to eq "token"
      expect(parameters["sigalg"]).to eq "sigalg"
      expect(parameters["data"]).to eq "data"
    end

    it "should liberally handle space-separated auth-param lists" do
      parameters = Signet.parse_auth_param_list(
        'token="token" sigalg="sigalg" data="data" sig="sig"'
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
      expect(parameters["token"]).to eq "token"
      expect(parameters["sigalg"]).to eq "sigalg"
      expect(parameters["data"]).to eq "data"
      expect(parameters["sig"]).to eq "sig"
    end

    it "should liberally handle single-quoted auth-param lists" do
      parameters = Signet.parse_auth_param_list(
        "token='token' sigalg='sigalg' data='data' sig='sig'"
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
      expect(parameters["token"]).to eq "token"
      expect(parameters["sigalg"]).to eq "sigalg"
      expect(parameters["data"]).to eq "data"
      expect(parameters["sig"]).to eq "sig"
    end

    it "should liberally handle unquoted auth-param lists" do
      parameters = Signet.parse_auth_param_list(
        "token=token sigalg=sigalg data=data sig=sig"
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
      expect(parameters["token"]).to eq "token"
      expect(parameters["sigalg"]).to eq "sigalg"
      expect(parameters["data"]).to eq "data"
      expect(parameters["sig"]).to eq "sig"
    end

    it "should liberally handle auth-param lists with empty sections" do
      parameters = Signet.parse_auth_param_list(
        "token=token, , sigalg=sigalg,, data=data, sig=sig"
      ).each_with_object({}) { |(k, v), h| h[k] = v; }
      expect(parameters["token"]).to eq "token"
      expect(parameters["sigalg"]).to eq "sigalg"
      expect(parameters["data"]).to eq "data"
      expect(parameters["sig"]).to eq "sig"
    end
  end
end
