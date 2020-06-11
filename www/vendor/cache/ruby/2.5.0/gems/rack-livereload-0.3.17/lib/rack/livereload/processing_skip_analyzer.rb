require 'rack/livereload'

module Rack
  class LiveReload
    class ProcessingSkipAnalyzer
      BAD_USER_AGENTS = [ %r{MSIE} ]

      def self.skip_processing?(result, env, options)
        new(result, env, options).skip_processing?
      end

      def initialize(result, env, options)
        @env, @options = env, options

        @status, @headers, @body = result
      end

      def skip_processing?
        !html? || chunked? || inline? || ignored? || bad_browser? || !get?
      end

      def chunked?
        @headers['Transfer-Encoding'] == 'chunked'
      end

      def inline?
        @headers['Content-Disposition'] =~ %r{^inline}
      end

      def ignored?
        path = @env['QUERY_STRING'].empty? ? @env['PATH_INFO'] : "#{@env['PATH_INFO']}?#{@env['QUERY_STRING']}"
        @options[:ignore] and @options[:ignore].any? { |filter| path[filter] }
      end

      def bad_browser?
        BAD_USER_AGENTS.any? { |pattern| @env['HTTP_USER_AGENT'] =~ pattern }
      end

      def html?
        @headers['Content-Type'] =~ %r{text/html}
      end

      def get?
        @env['REQUEST_METHOD'] == 'GET'
      end
    end
  end
end

