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

require "googleauth/iam"

describe Google::Auth::IAMCredentials do
  IAMCredentials = Google::Auth::IAMCredentials
  let(:test_selector) { "the-test-selector" }
  let(:test_token) { "the-test-token" }
  let(:test_creds) { IAMCredentials.new test_selector, test_token }

  describe "#apply!" do
    it "should update the target hash with the iam values" do
      md = { foo: "bar" }
      test_creds.apply! md
      expect(md[IAMCredentials::SELECTOR_KEY]).to eq test_selector
      expect(md[IAMCredentials::TOKEN_KEY]).to eq test_token
      expect(md[:foo]).to eq "bar"
    end
  end

  describe "updater_proc" do
    it "should provide a proc that updates a hash with the iam values" do
      md = { foo: "bar" }
      the_proc = test_creds.updater_proc
      got = the_proc.call md
      expect(got[IAMCredentials::SELECTOR_KEY]).to eq test_selector
      expect(got[IAMCredentials::TOKEN_KEY]).to eq test_token
      expect(got[:foo]).to eq "bar"
    end
  end

  describe "#apply" do
    it "should not update the original hash with the iam values" do
      md = { foo: "bar" }
      test_creds.apply md
      expect(md[IAMCredentials::SELECTOR_KEY]).to be_nil
      expect(md[IAMCredentials::TOKEN_KEY]).to be_nil
      expect(md[:foo]).to eq "bar"
    end

    it "should return a with the iam values" do
      md = { foo: "bar" }
      got = test_creds.apply md
      expect(got[IAMCredentials::SELECTOR_KEY]).to eq test_selector
      expect(got[IAMCredentials::TOKEN_KEY]).to eq test_token
      expect(got[:foo]).to eq "bar"
    end
  end
end
