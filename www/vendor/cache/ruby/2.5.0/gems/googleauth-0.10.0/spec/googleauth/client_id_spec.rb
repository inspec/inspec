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

require "spec_helper"
require "fakefs/safe"
require "googleauth"

describe Google::Auth::ClientId do
  shared_examples "it has a valid config" do
    it "should include a valid id" do
      expect(client_id.id).to eql "abc@example.com"
    end

    it "should include a valid secret" do
      expect(client_id.secret).to eql "notasecret"
    end
  end

  shared_examples "it can successfully load client_id" do
    context "loaded from hash" do
      let(:client_id) { Google::Auth::ClientId.from_hash config }

      it_behaves_like "it has a valid config"
    end

    context "loaded from file" do
      file_path = "/client_secrets.json"

      let :client_id do
        FakeFS do
          content = MultiJson.dump config
          File.write file_path, content
          Google::Auth::ClientId.from_file file_path
        end
      end

      it_behaves_like "it has a valid config"
    end
  end

  describe "with web config" do
    let :config do
      {
        "web" => {
          "client_id"     => "abc@example.com",
          "client_secret" => "notasecret"
        }
      }
    end
    it_behaves_like "it can successfully load client_id"
  end

  describe "with installed app config" do
    let :config do
      {
        "installed" => {
          "client_id"     => "abc@example.com",
          "client_secret" => "notasecret"
        }
      }
    end
    it_behaves_like "it can successfully load client_id"
  end

  context "with missing top level property" do
    let :config do
      {
        "notvalid" => {
          "client_id"     => "abc@example.com",
          "client_secret" => "notasecret"
        }
      }
    end

    it "should raise error" do
      expect { Google::Auth::ClientId.from_hash config }.to raise_error(
        /Expected top level property/
      )
    end
  end

  context "with missing client id" do
    let :config do
      {
        "web" => {
          "client_secret" => "notasecret"
        }
      }
    end

    it "should raise error" do
      expect { Google::Auth::ClientId.from_hash config }.to raise_error(
        /Client id can not be nil/
      )
    end
  end

  context "with missing client secret" do
    let :config do
      {
        "web" => {
          "client_id" => "abc@example.com"
        }
      }
    end

    it "should raise error" do
      expect { Google::Auth::ClientId.from_hash config }.to raise_error(
        /Client secret can not be nil/
      )
    end
  end

  context "with cloud sdk credentials" do
    let :config do
      {
        "web" => {
          "client_id"     => Google::Auth::CredentialsLoader::CLOUD_SDK_CLIENT_ID,
          "client_secret" => "notasecret"
        }
      }
    end

    it "should raise warning" do
      expect { Google::Auth::ClientId.from_hash config }.to output(
        Google::Auth::CredentialsLoader::CLOUD_SDK_CREDENTIALS_WARNING + "\n"
      ).to_stderr
    end
  end
end
