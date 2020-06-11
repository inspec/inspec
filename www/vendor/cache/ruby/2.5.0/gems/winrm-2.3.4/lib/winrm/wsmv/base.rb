# Copyright 2016 Shawn Neal <sneal@sneal.net>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'base64'
require 'builder'
require 'gyoku'
require_relative 'soap'
require_relative 'header'

module WinRM
  module WSMV
    # Base class for all WSMV message classes
    class Base
      include WinRM::WSMV::SOAP
      include WinRM::WSMV::Header

      # Builds the WSMV message XML payload
      def build
        builder = Builder::XmlMarkup.new
        builder.instruct!(:xml, encoding: 'UTF-8')
        builder.tag! :env, :Envelope, namespaces do |env|
          env.tag!(:env, :Header) do |env_header|
            create_header(env_header)
          end
          env.tag!(:env, :Body) do |env_body|
            create_body(env_body)
          end
        end
      end

      protected

      def create_header
        raise NotImplementedError
      end

      def create_body
        raise NotImplementedError
      end

      def encode_bytes(bytes)
        Base64.strict_encode64(bytes.pack('C*'))
      end
    end
  end
end
