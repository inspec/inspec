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

require "apply_auth_examples"
require "faraday"
require "googleauth/compute_engine"
require "spec_helper"

describe Google::Auth::GCECredentials do
  MD_URI = "http://169.254.169.254/computeMetadata/v1/instance/service-accounts/default/token".freeze
  GCECredentials = Google::Auth::GCECredentials

  before :example do
    @client = GCECredentials.new
  end

  def make_auth_stubs opts = {}
    access_token = opts[:access_token] || ""
    body = MultiJson.dump("access_token" => access_token,
                          "token_type"   => "Bearer",
                          "expires_in"   => 3600)
    stub_request(:get, MD_URI)
      .with(headers: { "Metadata-Flavor" => "Google" })
      .to_return(body:    body,
                 status:  200,
                 headers: { "Content-Type" => "application/json" })
  end

  it_behaves_like "apply/apply! are OK"

  context "metadata is unavailable" do
    describe "#fetch_access_token" do
      it "should fail if the metadata request returns a 404" do
        stub = stub_request(:get, MD_URI)
               .to_return(status:  404,
                          headers: { "Metadata-Flavor" => "Google" })
        expect { @client.fetch_access_token! }
          .to raise_error Signet::AuthorizationError
        expect(stub).to have_been_requested
      end

      it "should fail if the metadata request returns an unexpected code" do
        stub = stub_request(:get, MD_URI)
               .to_return(status:  503,
                          headers: { "Metadata-Flavor" => "Google" })
        expect { @client.fetch_access_token! }
          .to raise_error Signet::AuthorizationError
        expect(stub).to have_been_requested
      end

      it "should fail with Signet::AuthorizationError if request times out" do
        allow_any_instance_of(Faraday::Connection).to receive(:get)
          .and_raise(Faraday::TimeoutError)
        expect { @client.fetch_access_token! }
          .to raise_error Signet::AuthorizationError
      end

      it "should fail with Signet::AuthorizationError if request fails" do
        allow_any_instance_of(Faraday::Connection).to receive(:get)
          .and_raise(Faraday::ConnectionFailed, nil)
        expect { @client.fetch_access_token! }
          .to raise_error Signet::AuthorizationError
      end
    end
  end

  describe "#on_gce?" do
    it "should be true when Metadata-Flavor is Google" do
      stub = stub_request(:get, "http://169.254.169.254")
             .with(headers: { "Metadata-Flavor" => "Google" })
             .to_return(status:  200,
                        headers: { "Metadata-Flavor" => "Google" })
      expect(GCECredentials.on_gce?({}, true)).to eq(true)
      expect(stub).to have_been_requested
    end

    it "should be false when Metadata-Flavor is not Google" do
      stub = stub_request(:get, "http://169.254.169.254")
             .with(headers: { "Metadata-Flavor" => "Google" })
             .to_return(status:  200,
                        headers: { "Metadata-Flavor" => "NotGoogle" })
      expect(GCECredentials.on_gce?({}, true)).to eq(false)
      expect(stub).to have_been_requested
    end

    it "should be false if the response is not 200" do
      stub = stub_request(:get, "http://169.254.169.254")
             .with(headers: { "Metadata-Flavor" => "Google" })
             .to_return(status:  404,
                        headers: { "Metadata-Flavor" => "NotGoogle" })
      expect(GCECredentials.on_gce?({}, true)).to eq(false)
      expect(stub).to have_been_requested
    end
  end
end
