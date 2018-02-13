# encoding: utf-8
# copyright: 2017, Criteo
# copyright: 2017, Chef Software Inc
# author: Guilhem Lettron, Christoph Hartmann
# license: Apache v2

require 'faraday'
require 'hashie'

module Inspec::Resources
  class Http < Inspec.resource(1)
    name 'http'
    desc 'Use the http InSpec audit resource to test http call.'
    example "
      describe http('http://localhost:8080/ping', auth: {user: 'user', pass: 'test'}, params: {format: 'html'}) do
        its('status') { should cmp 200 }
        its('body') { should cmp 'pong' }
        its('headers.Content-Type') { should cmp 'text/html' }
      end

      describe http('http://example.com/ping').headers do
        its('Content-Length') { should cmp 258 }
        its('Content-Type') { should cmp 'text/html; charset=UTF-8' }
      end
    "

    def initialize(url, opts = {})
      @url = url
      @opts = opts

      # Prior to InSpec 2.0 the HTTP test had to be instructed to run on the
      # remote target machine. This warning will be removed after a few months
      # to give users an opportunity to remove the unused option from their
      # profiles.
      if opts.key?(:enable_remote_worker) && !inspec.local_transport?
        warn 'Ignoring `enable_remote_worker` option, the `http` resource ',
             'remote worker is enabled by default for remote targets and ',
             'cannot be disabled'
      end

      # Run locally if InSpec is ran locally and remotely if ran remotely
      if inspec.local_transport?
        @worker = Worker::Local.new(http_method, url, opts)
      else
        @worker = Worker::Remote.new(inspec, http_method, url, opts)
      end
    end

    def status
      @worker.status
    end

    def headers
      @headers ||= Inspec::Resources::Http::Headers.create(@worker.response_headers)
    end

    def body
      @worker.body
    end

    def http_method
      @opts.fetch(:method, 'GET')
    end

    def to_s
      "http #{http_method} on #{@url}"
    end

    class Worker
      class Base
        attr_reader :http_method, :opts, :url

        def initialize(http_method, url, opts)
          @http_method = http_method
          @url = url
          @opts = opts
        end

        private

        def params
          opts.fetch(:params, nil)
        end

        def username
          opts.fetch(:auth, {})[:user]
        end

        def password
          opts.fetch(:auth, {})[:pass]
        end

        def request_headers
          opts.fetch(:headers, {})
        end

        def request_body
          opts[:data]
        end

        def open_timeout
          opts.fetch(:open_timeout, 60)
        end

        def read_timeout
          opts.fetch(:read_timeout, 60)
        end

        def ssl_verify?
          opts.fetch(:ssl_verify, true)
        end
      end

      class Local < Base
        def status
          response.status
        end

        def body
          response.body
        end

        def response_headers
          response.headers.to_h
        end

        private

        def response
          return @response if @response
          conn = Faraday.new url: url, headers: request_headers, params: params, ssl: { verify: ssl_verify? }

          # set basic authentication
          conn.basic_auth username, password unless username.nil? || password.nil?

          # set default timeout
          conn.options.timeout      = read_timeout  # open/read timeout in seconds
          conn.options.open_timeout = open_timeout  # connection open timeout in seconds

          @response = conn.send(http_method.downcase) do |req|
            req.body = request_body
          end
        end
      end

      class Remote < Base
        attr_reader :inspec

        def initialize(inspec, http_method, url, opts)
          unless inspec.command('curl').exist?
            raise Inspec::Exceptions::ResourceSkipped,
                  'curl is not available on the target machine'
          end

          @inspec = inspec
          super(http_method, url, opts)
        end

        def status
          run_curl
          @status
        end

        def body
          run_curl
          @body&.strip
        end

        def response_headers
          run_curl
          @response_headers
        end

        private

        def run_curl
          return if @ran_curl

          response = inspec.command(curl_command).stdout
          @ran_curl = true
          return if response.nil?

          # strip any carriage returns to normalize output
          response.delete!("\r")

          # split the prelude (status line and headers) and the body
          prelude, @body = response.split("\n\n", 2)
          prelude = prelude.lines

          # grab the status off of the first line of the prelude
          status_line = prelude.shift
          @status = status_line.split(' ', 3)[1].to_i

          # parse the rest of the prelude which will be all the HTTP headers
          @response_headers = {}
          prelude.each do |line|
            line.strip!
            key, value = line.split(':', 2)
            @response_headers[key] = value.strip
          end
        end

        def curl_command # rubocop:disable Metrics/AbcSize
          cmd = ['curl -i']

          # Use curl's --head option when the method requested is HEAD. Otherwise,
          # the user may experience a timeout when curl does not properly close
          # the connection after the response is received.
          if http_method.casecmp('HEAD') == 0
            cmd << '--head'
          else
            cmd << "-X #{http_method}"
          end

          cmd << "--connect-timeout #{open_timeout}"
          cmd << "--max-time #{open_timeout+read_timeout}"
          cmd << "--user \'#{username}:#{password}\'" unless username.nil? || password.nil?
          cmd << '--insecure' unless ssl_verify?
          cmd << "--data #{Shellwords.shellescape(request_body)}" unless request_body.nil?

          request_headers.each do |k, v|
            cmd << "-H '#{k}: #{v}'"
          end

          if params.nil?
            cmd << "'#{url}'"
          else
            cmd << "'#{url}?#{params.map { |e| e.join('=') }.join('&')}'"
          end

          cmd.join(' ')
        end
      end
    end

    class Headers < Hash
      def self.create(header_data)
        header_data.each_with_object(new) { |(k, v), memo| memo[k.to_s.downcase] = v }
      end

      def [](requested_key)
        fetch(requested_key.downcase, nil)
      end

      def method_missing(requested_key)
        fetch(requested_key.to_s.downcase, nil)
      end
    end
  end
end
