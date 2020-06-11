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
require "signet/oauth_1/credential"

describe Signet::OAuth1::Credential, "with a Hash for initialization" do
  it 'should accept "oauth_token" and "oauth_token_secret" pairs' do
    token = Signet::OAuth1::Credential.new(
      "oauth_token"        => "dpf43f3p2l4k3l03",
      "oauth_token_secret" => "kd94hf93k423kf44"
    )
    expect(token.key).to eq "dpf43f3p2l4k3l03"
    expect(token.secret).to eq "kd94hf93k423kf44"
  end

  it "should accept :oauth_token and :oauth_token_secret pairs" do
    token = Signet::OAuth1::Credential.new(
      oauth_token:        "dpf43f3p2l4k3l03",
      oauth_token_secret: "kd94hf93k423kf44"
    )
    expect(token.key).to eq "dpf43f3p2l4k3l03"
    expect(token.secret).to eq "kd94hf93k423kf44"
  end

  it 'should accept "key" and "secret" pairs' do
    token = Signet::OAuth1::Credential.new(
      "key"    => "dpf43f3p2l4k3l03",
      "secret" => "kd94hf93k423kf44"
    )
    expect(token.key).to eq "dpf43f3p2l4k3l03"
    expect(token.secret).to eq "kd94hf93k423kf44"
  end

  it "should accept :key and :secret pairs" do
    token = Signet::OAuth1::Credential.new(
      key:    "dpf43f3p2l4k3l03",
      secret: "kd94hf93k423kf44"
    )
    expect(token.key).to eq "dpf43f3p2l4k3l03"
    expect(token.secret).to eq "kd94hf93k423kf44"
  end

  it "should not complain about additional parameters" do
    token = Signet::OAuth1::Credential.new(
      "oauth_token"        => "dpf43f3p2l4k3l03",
      "oauth_token_secret" => "kd94hf93k423kf44",
      "oauth_version"      => "1.0"
    )
    expect(token.key).to eq "dpf43f3p2l4k3l03"
    expect(token.secret).to eq "kd94hf93k423kf44"
  end

  it "should allow parameters to be specified as an implicit Hash" do
    class ParameterHashSet
      def initialize parameters
        @parameters = parameters.each_with_object({}) { |(k, v), h| h[k] = v; }
      end

      def to_hash
        @parameters
      end
    end

    token = Signet::OAuth1::Credential.new(
      ParameterHashSet.new(
        "oauth_token"        => "dpf43f3p2l4k3l03",
        "oauth_token_secret" => "kd94hf93k423kf44",
        "oauth_version"      => "1.0"
      )
    )
    expect(token.key).to eq "dpf43f3p2l4k3l03"
    expect(token.secret).to eq "kd94hf93k423kf44"
  end

  it "should allow parameters to be specified as an Enumerable" do
    token = Signet::OAuth1::Credential.new(
      [
        %w[oauth_token dpf43f3p2l4k3l03],
        %w[oauth_token_secret kd94hf93k423kf44],
        ["oauth_version", "1.0"]
      ]
    )
    expect(token.key).to eq "dpf43f3p2l4k3l03"
    expect(token.secret).to eq "kd94hf93k423kf44"
  end

  it "should allow parameters to be specified as an implicit Array" do
    class ParameterArraySet
      def initialize parameters
        @parameters = parameters
      end

      def to_ary
        @parameters
      end
    end

    token = Signet::OAuth1::Credential.new(
      ParameterArraySet.new(
        [
          %w[oauth_token dpf43f3p2l4k3l03],
          %w[oauth_token_secret kd94hf93k423kf44],
          ["oauth_version", "1.0"]
        ]
      )
    )
    expect(token.key).to eq "dpf43f3p2l4k3l03"
    expect(token.secret).to eq "kd94hf93k423kf44"
  end

  it "should raise an error if key and secret are not present" do
    expect(lambda do
      Signet::OAuth1::Credential.new({})
    end).to raise_error(ArgumentError)
  end

  it "should allow key and secret to be passed in as a tuple" do
    token = Signet::OAuth1::Credential.new(
      %w[dpf43f3p2l4k3l03 kd94hf93k423kf44]
    )
    expect(token.key).to eq "dpf43f3p2l4k3l03"
    expect(token.secret).to eq "kd94hf93k423kf44"
  end

  it "should allow key and secret to be passed in as normal parameters" do
    token = Signet::OAuth1::Credential.new(
      "dpf43f3p2l4k3l03", "kd94hf93k423kf44"
    )
    expect(token.key).to eq "dpf43f3p2l4k3l03"
    expect(token.secret).to eq "kd94hf93k423kf44"
  end

  it "should raise an error if key or secret are of the wrong type" do
    expect(lambda do
      Signet::OAuth1::Credential.new "dpf43f3p2l4k3l03", 42
    end).to raise_error(TypeError)
    expect(lambda do
      Signet::OAuth1::Credential.new 42, "kd94hf93k423kf44"
    end).to raise_error(TypeError)
  end

  it "should raise an error if the wrong number of arguments are passed" do
    expect(lambda do
      Signet::OAuth1::Credential.new(
        "dpf43f3p2l4k3l03", "kd94hf93k423kf44", "something else"
      )
    end).to raise_error(ArgumentError)
  end

  it "should convert to a Hash object" do
    token = Signet::OAuth1::Credential.new(
      "dpf43f3p2l4k3l03", "kd94hf93k423kf44"
    )
    parameters = token.to_h
    expect(parameters["oauth_token"]).to eq "dpf43f3p2l4k3l03"
    expect(parameters["oauth_token_secret"]).to eq "kd94hf93k423kf44"
  end
end
