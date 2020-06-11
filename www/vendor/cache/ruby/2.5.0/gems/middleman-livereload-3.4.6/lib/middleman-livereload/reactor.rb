require 'em-websocket'
require 'json'

module Middleman
  module LiveReload
    class Reactor
      attr_reader :thread, :web_sockets, :app

      def initialize(options, app)
        @app = app
        @web_sockets = []
        @options     = options
        @thread      = start_threaded_reactor(options)
        @mutex       = Thread::Mutex.new
      end

      def app= app
        @mutex.synchronize { @app = app }
      end

      def logger
        @mutex.synchronize { @app.logger }
      end

      def stop
        thread.kill
      end

      def reload_browser(paths = [])
        paths = Array(paths)
        logger.info "== LiveReloading path: #{paths.join(' ')}"
        paths.each do |path|
          data = JSON.dump(['refresh', {
            :path           => path,
            :apply_js_live  => @options[:apply_js_live],
            :apply_css_live => @options[:apply_css_live]
          }])

          @web_sockets.each { |ws| ws.send(data) }
        end
      end

      def start_threaded_reactor(options)
        Thread.new do
          EventMachine.run do
            logger.info "== LiveReload accepting connections from ws://#{options[:host]}:#{options[:port]}"
            EventMachine.start_server(options[:host], options[:port], EventMachine::WebSocket::Connection, {}) do |ws|
              ws.onopen do
                begin
                  ws.send "!!ver:1.6"
                  @web_sockets << ws
                  logger.debug "== LiveReload browser connected"
                rescue
                  logger.error $!
                  logger.error $!.backtrace
                end
              end

              ws.onmessage do |msg|
                logger.debug "LiveReload Browser URL: #{msg}"
              end

              ws.onclose do
                @web_sockets.delete ws
                logger.debug "== LiveReload browser disconnected"
              end
            end
          end
        end
      end
    end
  end
end
