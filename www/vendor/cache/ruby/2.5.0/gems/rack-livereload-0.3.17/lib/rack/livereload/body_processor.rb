require 'rack/livereload'

module Rack
  class LiveReload
    class BodyProcessor
      LIVERELOAD_JS_PATH = '/__rack/livereload.js'
      HEAD_TAG_REGEX = /<head>|<head[^(er)][^<]*>/
      LIVERELOAD_PORT = 35729

      attr_reader :content_length, :new_body, :livereload_added

      def protocol
        @options[:protocol] || "http"
      end

      def livereload_local_uri
        "#{protocol}://localhost:#{@options[:live_reload_port]}/livereload.js"
      end

      def initialize(body, options)
        @body, @options = body, options
        @options[:live_reload_port] ||= LIVERELOAD_PORT

        @processed = false
      end

      def force_swf?
        @options[:force_swf]
      end

      def with_swf?
        !@options[:no_swf]
      end

      def use_vendored?
        return @use_vendored if @use_vendored

        if @options[:source]
          @use_vendored = (@options[:source] == :vendored)
        else
          require 'net/http'
          require 'uri'

          uri = URI.parse(livereload_local_uri)

          http = Net::HTTP.new(uri.host, uri.port)
          http.read_timeout = 1

          begin
            http.send_request('GET', uri.path)
            @use_vendored = false
          rescue ::Timeout::Error, Errno::ECONNREFUSED, EOFError, IOError
            @use_vendored = true
          rescue => e
            $stderr.puts e.inspect
            raise e
          end
        end

        @use_vendored
      end

      def processed?
        @processed
      end

      def process!(env)
        @env = env
        @body.close if @body.respond_to?(:close)

        @new_body = [] ; @body.each { |line| @new_body << line.to_s }

        @content_length = 0
        @livereload_added = false

        @new_body.each do |line|
          if !@livereload_added && line['<head']
            line.gsub!(HEAD_TAG_REGEX) { |match| %{#{match}#{template.result(binding)}} }

            @livereload_added = true
          end

          @content_length += line.bytesize
          @processed = true
        end
      end

      def app_root
        ENV['RAILS_RELATIVE_URL_ROOT'] || ''
      end

      def host_to_use
        (@options[:host] || @env['HTTP_HOST'] || 'localhost').gsub(%r{:.*}, '')
      end

      def template
        ERB.new(::File.read(::File.expand_path('../../../../skel/livereload.html.erb', __FILE__)))
      end

      def livereload_source
        if use_vendored?
          src = "#{app_root}#{LIVERELOAD_JS_PATH.dup}?host=#{host_to_use}"
        else
          src = livereload_local_uri.dup.gsub('localhost', host_to_use) + '?'
        end

        src << "&amp;mindelay=#{@options[:min_delay]}" if @options[:min_delay]
        src << "&amp;maxdelay=#{@options[:max_delay]}" if @options[:max_delay]
        src << "&amp;port=#{@options[:port]}" if @options[:port]

        src
      end
    end
  end
end

