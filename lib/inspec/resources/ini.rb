# frozen_string_literal: true

require 'inspec/resources/json'
require 'inspec/utils/simpleconfig'
require 'json' unless defined?(JSON)

module Inspec
  module Resources
    # Thin wrapper around JsonConfig that swaps its JSON parser for
    # SimpleConfig, giving INI-file support with no duplicated traversal logic.
    #
    # Inherited API (from JsonConfig / ObjectTraverser):
    #   resource.params                    # => nested Hash of all sections/keys
    #   resource.value(%w{SECTION key})    # => String value, or nil if missing
    #   resource.resource_id               # => file path supplied by the caller
    #   resource.to_s                      # => "INI <path>"
    #
    # Usage in a profile:
    #   describe ini('/etc/myapp/app.ini') do
    #     its(['database', 'host']) { should eq 'localhost' }
    #   end
    class IniConfig < JsonConfig
      name 'ini'
      supports platform: 'os'
      desc 'Use the ini InSpec audit resource to test data in a INI file.'
      example <<~EXAMPLE
        descibe ini do
          its('auth_protocol') { should eq 'https' }
        end
      EXAMPLE

      # Overrides JsonConfig#parse to use SimpleConfig instead of JSON.parse.
      #
      # ENCODING RESILIENCE: Remote targets (especially Windows) often deliver
      # INI file content in CP1252/Latin-1 encoding. Without normalization,
      # SimpleConfig passes bytes through unchanged, producing ASCII-8BIT strings
      # inside the params hash. Downstream JSON serialization then raises:
      #   JSON::GeneratorError: "\xE9" from ASCII-8BIT to UTF-8
      # We transcode to UTF-8 before parsing, replacing unrecognised bytes with
      # '?' so that parse always succeeds and all result strings are serializable.
      #
      # Emits a structured debug log entry (JSON, one line) with fields:
      #   op          – always "ini_parse"
      #   status      – "ok" or "failed"
      #   elapsed_ms  – wall-clock milliseconds for the SimpleConfig parse step
      #   file        – resource path (nil when content was supplied inline)
      #   keys        – total leaf-key count across all sections (ok path only)
      #   error       – exception message (failed path only)
      #
      # Raises ResourceFailed if content is nil (see below) or if SimpleConfig
      # itself raises an unexpected error.
      def parse(content)
        if content.nil?
          raise Inspec::Exceptions::ResourceFailed,
                'INI file content is nil — check that the file exists and is readable'
        end

        # Transcode to UTF-8. Invalid/undefined bytes become '?' so that
        # downstream JSON serialization never raises JSON::GeneratorError.
        safe_content = content.encode('UTF-8', invalid: :replace, undef: :replace, replace: '?')

        start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)

        begin
          result = SimpleConfig.new(safe_content).params
        rescue StandardError => e
          log_parse_event(
            op: 'ini_parse',
            status: 'failed',
            elapsed_ms: elapsed_ms_since(start_time),
            file: @resource_name_supplement,
            error: e.message
          )
          raise Inspec::Exceptions::ResourceFailed, "Unable to parse INI content: #{e.message}"
        end

        log_parse_event(
          op: 'ini_parse',
          status: 'ok',
          elapsed_ms: elapsed_ms_since(start_time),
          file: @resource_name_supplement,
          keys: total_key_count(result)
        )
        result
      end

      private

      # Label used by JsonConfig#to_s and JsonConfig#resource_id.
      # Produces "INI <path>" in human-readable output and test failure messages.
      def resource_base_name
        'INI'
      end

      # Emits a single-line JSON debug log entry via Inspec::Log.
      # Visible when --log-level debug (or INSPEC_LOG_LEVEL=debug) is set.
      def log_parse_event(**fields)
        Inspec::Log.debug(JSON.generate(fields))
      end

      # Returns elapsed wall-clock milliseconds since start_time, rounded to 3 d.p.
      def elapsed_ms_since(start_time)
        ((Process.clock_gettime(Process::CLOCK_MONOTONIC) - start_time) * 1000).round(3)
      end

      # Counts total leaf keys across all sections for the "keys" log field.
      # Example: { "A" => { "x" => 1, "y" => 2 }, "B" => { "z" => 3 } } => 3
      def total_key_count(hash)
        return 0 unless hash.is_a?(Hash)

        hash.values.sum { |v| v.is_a?(Hash) ? v.size : 1 }
      end
    end
  end
end
