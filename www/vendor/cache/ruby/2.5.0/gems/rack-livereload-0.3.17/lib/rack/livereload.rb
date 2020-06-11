require 'erb'
require 'rack/livereload/processing_skip_analyzer'
require 'rack/livereload/body_processor'

module Rack
  class LiveReload
    attr_reader :app

    def initialize(app, options = {})
      @app, @options = app, options
    end

    def call(env)
      dup._call(env)
    end

    def _call(env)
      _, path, file = (env['PATH_INFO'] || '').split('/')

      if path == '__rack' && ::File.file?(target = ::File.expand_path("../../../js/#{file}", __FILE__))
        deliver_file(target)
      else
        status, headers, body = result = @app.call(env)

        return result if ProcessingSkipAnalyzer.skip_processing?(result, env, @options)

        processor = BodyProcessor.new(body, @options)
        processor.process!(env)

        headers['Content-Length'] = processor.content_length.to_s

        if processor.livereload_added
          headers['X-Rack-LiveReload'] = '1'
        end

        [ status, headers, processor.new_body ]
      end
    end

    private
    def deliver_file(file)
      type = case ::File.extname(file)
             when '.js'
               'text/javascript'
             when '.swf'
               'application/swf'
             end

      [ 200, { 'Content-Type' => type, 'Content-Length' => ::File.size(file).to_s }, [ ::File.read(file) ] ]
    end
  end
end

