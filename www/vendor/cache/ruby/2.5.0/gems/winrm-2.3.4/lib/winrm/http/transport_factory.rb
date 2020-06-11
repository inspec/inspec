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

require_relative 'transport'

module WinRM
  module HTTP
    # Factory for creating a HTTP transport that can be used for WinRM SOAP calls.
    class TransportFactory
      # Creates a new WinRM HTTP transport using the specified connection options.
      # @param connection_opts [ConnectionOpts|Hash] The connection ConnectionOpts.
      # @return [HttpTransport] A transport instance for making WinRM calls.
      def create_transport(connection_opts)
        transport = connection_opts[:transport]
        validate_transport!(transport)
        send "init_#{transport}_transport", connection_opts
      end

      private

      def init_negotiate_transport(opts)
        HTTP::HttpNegotiate.new(opts[:endpoint], opts[:user], opts[:password], opts)
      end

      def init_kerberos_transport(opts)
        HTTP::HttpGSSAPI.new(opts[:endpoint], opts[:realm], opts, opts[:service])
      end

      def init_plaintext_transport(opts)
        HTTP::HttpPlaintext.new(opts[:endpoint], opts[:user], opts[:password], opts)
      end

      def init_ssl_transport(opts)
        if opts[:basic_auth_only]
          HTTP::BasicAuthSSL.new(opts[:endpoint], opts[:user], opts[:password], opts)
        elsif opts[:client_cert]
          HTTP::ClientCertAuthSSL.new(opts[:endpoint], opts[:client_cert],
                                      opts[:client_key], opts[:key_pass], opts)
        else
          HTTP::HttpNegotiate.new(opts[:endpoint], opts[:user], opts[:password], opts)
        end
      end

      def validate_transport!(transport)
        valid = private_methods
                .select { |m| m.to_s.start_with?('init_') && m.to_s.end_with?('_transport') }
                .map { |tm| tm.to_s.split('_')[1] }

        raise WinRM::InvalidTransportError.new(transport, valid) unless valid.include?(transport.to_s)
      end
    end
  end
end
