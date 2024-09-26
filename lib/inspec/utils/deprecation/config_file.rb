require "stringio" unless defined?(StringIO)
require "json" unless defined?(JSON)
require "inspec/globals"
require "inspec/config"

module Inspec
  module Deprecation
    class ConfigFile
      GroupEntry = Struct.new(:name, :action, :prefix, :suffix, :exit_status)
      FallbackEntry = Struct.new(:resource_name_regex, :gem_name, :message)

      # What actions may you specify to be taken when a deprecation is encountered?
      VALID_ACTIONS = [
        :exit, # Hard exit `inspec`, no stacktrace, exit code specified or Inspec::UI::EXIT_FATAL_DEPRECATION
        :fail_control, # Fail the control with a message. If not in a control, do :warn action instead.
        :ignore, # Do nothing.
        :warn, # Issue a warning
      ].freeze

      # Note that 'comment' is ignored, but listed here so you can have it present
      # and pass validation.
      VALID_GROUP_FIELDS = %w{action suffix prefix exit_status comment}.freeze

      attr_reader :fallback_resource_packs, :groups, :unknown_group_action

      def initialize(io = nil)
        io ||= open_default_config_io
        begin
          @raw_data = JSON.parse(io.read)
        rescue JSON::ParserError => e
          raise Inspec::Deprecation::MalformedConfigFileError, "Could not parse deprecation config file: #{e.message}"
        end

        @groups = {}
        @fallback_resource_packs = []
        @unknown_group_action = :warn
        validate!
        silence_deprecations_from_cli
      end

      private

      def open_default_config_io
        default_path = File.join(Inspec.src_root, "etc", "deprecations.json")
        unless File.exist?(default_path)
          raise Inspec::Deprecation::MalformedConfigError, "Missing deprecation config file: #{default_path}"
        end

        File.open(default_path)
      end

      def silence_deprecations_from_cli
        # Read --silence-deprecations CLI option
        cfg = Inspec::Config.cached
        return unless cfg[:silence_deprecations]

        groups_to_silence = cfg[:silence_deprecations]
        silence_all = groups_to_silence.include?("all")

        groups.each do |group_name, group|
          # Only silence things that warn. Don't silence things that exit;
          # those harsher measures are usually protecting removed code and ignoring
          # and continuing regardless would be perilous and lead to errors.
          if %i{warn fail_control}.include?(group.action) &&
              (silence_all || groups_to_silence.include?(group_name.to_s))
            group.action = :ignore
          end
        end
      end

      #====================================================================================================#
      #                                          Validation
      #====================================================================================================#
      def validate!
        validate_file_version
        validate_unknown_group_action

        unless @raw_data.key?("groups")
          raise Inspec::Deprecation::InvalidConfigFileError, "Missing groups field"
        end
        unless @raw_data["groups"].is_a?(Hash)
          raise Inspec::Deprecation::InvalidConfigFileError, "Groups field must be a Hash"
        end

        @raw_data["groups"].each do |group_name, group_info|
          validate_group_entry(group_name, group_info)
        end

        unless @raw_data.key?("fallback_resource_packs")
          raise Inspec::Deprecation::InvalidConfigFileError, "Missing fallback_resource_packs field"
        end
        unless @raw_data["fallback_resource_packs"].is_a?(Hash)
          raise Inspec::Deprecation::InvalidConfigFileError, "fallback_resource_packs field must be a Hash"
        end

        @raw_data["fallback_resource_packs"].each do |fallback_pat, fallback_info|
          validate_fallback(fallback_pat, fallback_info)
        end
      end

      def validate_file_version
        unless @raw_data.key?("file_version")
          raise Inspec::Deprecation::InvalidConfigFileError, "Missing file_version field"
        end
        unless @raw_data["file_version"] == "2.0.0"
          raise Inspec::Deprecation::InvalidConfigFileError, "Unrecognized file_version '#{@raw_data["file_version"]}' - supported versions: 2.0.0"
        end
      end

      def validate_unknown_group_action
        seen_action = (@raw_data["unknown_group_action"] || @unknown_group_action).to_sym
        unless VALID_ACTIONS.include?(seen_action)
          raise Inspec::Deprecation::UnrecognizedActionError, "Unrecognized value '#{seen_action}' for field 'unknown_group_action' - supported actions: #{VALID_ACTIONS.map(&:to_s).join(", ")}"
        end

        @unknown_group_action = seen_action
      end

      def validate_group_entry(name, opts)
        opts.each do |seen_field, _value|
          unless VALID_GROUP_FIELDS.include?(seen_field)
            raise Inspec::Deprecation::InvalidConfigFileError, "Unrecognized field for group '#{name}' - saw '#{seen_field}', supported fields: #{VALID_GROUP_FIELDS.map(&:to_s).join(", ")}"
          end
        end

        entry = GroupEntry.new(name.to_sym)

        opts["action"] = (opts["action"] || :warn).to_sym
        unless VALID_ACTIONS.include?(opts["action"])
          raise Inspec::Deprecation::UnrecognizedActionError, "Unrecognized action for group '#{name}' - saw '#{opts["action"]}', supported actions: #{VALID_ACTIONS.map(&:to_s).join(", ")}"
        end

        entry.action = opts["action"]

        entry.suffix = opts["suffix"]
        entry.prefix = opts["prefix"]
        entry.exit_status = opts["exit_status"]

        groups[name.to_sym] = entry
      end

      def validate_fallback(pattern, raw_info)
        fallback = FallbackEntry.new
        begin
          fallback.resource_name_regex = Regexp.new(pattern)
        rescue RegexpError
          raise Inspec::Deprecation::InvalidConfigFileError, "Invalid regular expression in resource pack fallback definition '#{pattern}'"
        end

        unless raw_info["gem"]
          raise Inspec::Deprecation::InvalidConfigFileError, "fallback_resource_packs missing gem name for pattern '#{pattern}'"
        end

        fallback.gem_name = raw_info["gem"]

        unless raw_info["message"]
          raise Inspec::Deprecation::InvalidConfigFileError, "fallback_resource_packs missing message for pattern '#{pattern}'"
        end

        fallback.message = raw_info["message"]

        fallback_resource_packs.push fallback
      end
    end
  end
end
