module Excon
  VALID_REQUEST_KEYS << :hijack_block

  module Middleware
    # Hijack is an Excon middleware which parses response headers and then
    # yields the underlying TCP socket for raw TCP communication (used to
    # attach to STDIN of containers).
    class Hijack < Base
      def build_response(status, socket)
        response = {
          :body          => '',
          :headers       => Excon::Headers.new,
          :status        => status,
          :remote_ip     => socket.respond_to?(:remote_ip) &&
                            socket.remote_ip,
        }
        if socket.data[:scheme] =~ /^(https?|tcp)$/
          response.merge({
            :local_port    => socket.respond_to?(:local_port) &&
                              socket.local_port,
            :local_address => socket.respond_to?(:local_address) &&
                              socket.local_address
          })
        end
        response
      end

      def response_call(datum)
        if datum[:hijack_block]
          # Need to process the response headers here rather than in
          # Excon::Middleware::ResponseParser as the response parser will
          # block trying to read the body.
          socket = datum[:connection].send(:socket)

          # c.f. Excon::Response.parse
          until match = /^HTTP\/\d+\.\d+\s(\d{3})\s/.match(socket.readline); end
          status = match[1].to_i

          datum[:response] = build_response(status, socket)

          Excon::Response.parse_headers(socket, datum)
          datum[:hijack_block].call socket.instance_variable_get(:@socket)
        end

        @stack.response_call(datum)
      end
    end
  end
end
