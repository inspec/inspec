#
# Copyright:: Copyright (c) 2018 Chef Software Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require_relative "telemetry/version"
require "benchmark"
require "forwardable"
require "singleton"
require "json"
require "digest/sha1"
require "securerandom"
require "yaml"

class Chef
  # This definites the Telemeter interface. Implementation thoughts for
  # when we unstub it:
  # - let's track the call sequence; most of our calls will be nested inside
  # a main 'timed_capture', and it would be good to see ordering within nested calls.
  class Telemeter
    include Singleton
    DEFAULT_INSTALLATION_GUID = "00000000-0000-0000-0000-000000000000".freeze

    class << self
      extend Forwardable
      def_delegators :instance, :setup, :timed_capture, :capture, :commit, :timed_run_capture
      def_delegators :instance, :pending_event_count, :last_event, :enabled?
      def_delegators :instance, :make_event_payload, :config
    end

    attr_reader :events_to_send, :run_timestamp, :config

    def setup(config)
      # TODO validate required & correct keys
      # :payload_dir #required
      # :session_file # required
      # :installation_identifier_file # required
      # :enabled  # false, not required
      # :dev_mode # false, not required
      config[:dev_mode] ||= false
      config[:enabled] ||= false
      require_relative "telemeter/sender"
      @config = config
      Sender.start_upload_thread(config)
    end

    def enabled?
      require_relative "telemetry/decision"
      config[:enabled] && !Telemetry::Decision.env_opt_out?
    end

    def initialize
      @config = []
      @events_to_send = []
      @run_timestamp =  Time.now.utc.strftime("%FT%TZ")
    end

    def timed_run_capture(arguments, &block)
      timed_capture(:run, arguments: arguments, &block)
    end

    def timed_capture(name, data = {}, options = {})
      time = Benchmark.measure { yield }
      data[:duration] = time.real
      capture(name, data, options)
    end

    def capture(name, data = {}, options = {})
      # Adding it to the head of the list will ensure that the
      # sequence of events is preserved when we send the final payload
      payload = make_event_payload(name, data, options)
      @events_to_send.unshift payload
    end

    def commit
      if enabled?
        session = convert_events_to_session
        write_session(session)
      end
      @events_to_send = []
    end

    def make_event_payload(name, data, options = {})
      payload = {
        event: name,
        properties: {
          installation_id: installation_id,
          run_timestamp: run_timestamp,
          host_platform: host_platform,
        },
      }
      if options[:flatten]
        payload[:properties].merge! data
      else
        payload[:properties][:event_data] = data
      end
      payload
    end

    def installation_id
      @installation_id ||=
        begin
          File.read(config[:installation_identifier_file]).chomp
        rescue
          Telemeter::Log.info "could not read #{config[:installation_identifier_file]} - using default id"
          DEFAULT_INSTALLATION_GUID
        end
    end

    # For testing.
    def pending_event_count
      @events_to_send.length
    end

    def last_event
      @events_to_send.last
    end

    private

    def host_platform
      @host_platform ||= case RUBY_PLATFORM
                         when /mswin|mingw|windows/
                           "windows"
                         else
                           RUBY_PLATFORM.split("-")[1]
                         end
    end

    def convert_events_to_session
      YAML.dump("version" => Telemetry::VERSION,
                "entries" => @events_to_send)
    end

    def write_session(session)
      File.write(next_filename, convert_events_to_session)
    end

    def next_filename
      id = 0
      filename = ""
      loop do
        id += 1
        filename = File.join(config[:payload_dir], "telemetry-payload-#{id}.yml")
        break unless File.exist?(filename)
      end
      filename
    end

  end
end # Chef
