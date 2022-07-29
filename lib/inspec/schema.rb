require "json" unless defined?(JSON)

module Inspec
  class Schema
    STATISTICS = {
      "type" => "object",
      "additionalProperties" => false,
      "properties" => {
        "duration" => { "type" => "number" },
        "controls" => {
          "type" => "object",
          "optional" => true,
          "properties" => {
            "total" => { "type" => "number" },
            "passed" => {
              "type" => "object",
              "properties" => {
                "total" => { "type" => "number" },
              },
            },
            "skipped" => {
              "type" => "object",
              "properties" => {
                "total" => { "type" => "number" },
              },
            },
            "failed" => {
              "type" => "object",
              "properties" => {
                "total" => { "type" => "number" },
              },
            },
          },
        },
      },
    }.freeze

    PLATFORM = {
      "type" => "object",
      "additionalProperties" => false,
      "properties" => {
        "name" => { "type" => "string" },
        "release" => { "type" => "string" },
        "target_id" => { "type" => "string", "optional" => true },
      },
    }.freeze

    # Tags are open right, with simple key-value associations and not restrictions
    TAGS = { "type" => "object" }.freeze

    RESULT = {
      "type" => "object",
      "additionalProperties" => false,
      "properties" => {
        "status" => { "type" => "string" },
        "code_desc" => { "type" => "string" },
        "run_time" => { "type" => "number" },
        "start_time" => { "type" => "string" },
        "resource_class" => { "type" => "string", "optional" => true },
        "resource_id" => { "type" => "string", "optional" => true },
        "skip_message" => { "type" => "string", "optional" => true },
        "resource" => { "type" => "string", "optional" => true },
        "message" => { "type" => "string", "optional" => true },
        "exception" => { "type" => "string", "optional" => true },
        "backtrace" => { "type" => "object", "optional" => true },
      },
    }.freeze

    REF = {
      "type" => "object",
      "additionalProperties" => false,
      "properties" => {
        "ref" => { "type" => "string" },
        # TODO: One of these needs to be deprecated
        "uri" => { "type" => "string", "optional" => true },
        "url" => { "type" => "string", "optional" => true },
      },
    }.freeze
    REFS = { "type" => "array", "items" => REF }.freeze

    CONTROL = {
      "type" => "object",
      "additionalProperties" => false,
      "properties" => {
        "id" => { "type" => "string" },
        "title" => { "type" => %w{string null} },
        "desc" => { "type" => %w{string null} },
        "descriptions" => { "type" => %w{array} },
        "impact" => { "type" => "number" },
        "refs" => REFS,
        "tags" => TAGS,
        "code" => { "type" => "string" },
        "source_location" => {
          "type" => "object",
          "properties" => {
            "ref" => { "type" => "string" },
            "line" => { "type" => "number" },
          },
        },
        "results" => { "type" => "array", "items" => RESULT },
        "waiver_data" => {
          "type" => "object",
          "properties" => {
            "skipped_due_to_waiver" => { "type" => "string" },
            "run" => { "type" => "boolean" },
            "message" => { "type" => "string" },
            "expiration_date" => { "type" => "string" },
            "justification" => { "type" => "string" },
          },
        },
      },
    }.freeze

    CONTROL_ENHANCED_OUTCOME = {
      "type" => "object",
      "additionalProperties" => false,
      "properties" => {
        "id" => { "type" => "string" },
        "title" => { "type" => %w{string null} },
        "desc" => { "type" => %w{string null} },
        "descriptions" => { "type" => %w{array} },
        "impact" => { "type" => "number" },
        "status" => {
          "enum" => %w{passed failed not_applicable not_reviewed error},
          "description" => Primitives.desc(Primitives::STRING, "The enhanced outcome status of the control"),
        },
        "refs" => REFS,
        "tags" => TAGS,
        "code" => { "type" => "string" },
        "source_location" => {
          "type" => "object",
          "properties" => {
            "ref" => { "type" => "string" },
            "line" => { "type" => "number" },
          },
        },
        "results" => { "type" => "array", "items" => RESULT },
        "waiver_data" => {
          "type" => "object",
          "properties" => {
            "skipped_due_to_waiver" => { "type" => "string" },
            "run" => { "type" => "boolean" },
            "message" => { "type" => "string" },
            "expiration_date" => { "type" => "string" },
            "justification" => { "type" => "string" },
          },
        },
      },
    }.freeze

    SUPPORTS = {
      "type" => "object",
      "additionalProperties" => false,
      "properties" => {
        "platform-family" => { "type" => "string", "optional" => true },
        "platform-name" => { "type" => "string", "optional" => true },
        "platform" => { "type" => "string", "optional" => true },
        # os-* supports are being deprecated
        "os-family" => { "type" => "string", "optional" => true },
        "os-name" => { "type" => "string", "optional" => true },
      },
    }.freeze

    CONTROL_GROUP = {
      "type" => "object",
      "additionalProperties" => false,
      "properties" => {
        "id" => { "type" => "string" },
        "title" => { "type" => "string", "optional" => true },
        "controls" => { "type" => "array", "items" => { "type" => "string" } },
      },
    }.freeze

    PROFILE = {
      "type" => "object",
      "additionalProperties" => false,
      "properties" => {
        "name" => { "type" => "string" },
        "version" => { "type" => "string", "optional" => true },
        "sha256" => { "type" => "string", "optional" => false },

        "title" => { "type" => "string", "optional" => true },
        "maintainer" => { "type" => "string", "optional" => true },
        "copyright" => { "type" => "string", "optional" => true },
        "copyright_email" => { "type" => "string", "optional" => true },
        "license" => { "type" => "string", "optional" => true },
        "summary" => { "type" => "string", "optional" => true },
        "status" => { "type" => "string", "optional" => false },
        "status_message" => { "type" => "string", "optional" => true },
        # skip_message is deprecated, status_message should be used to store the reason for skipping
        "skip_message" => { "type" => "string", "optional" => true },

        "supports" => {
          "type" => "array",
          "items" => SUPPORTS,
          "optional" => true,
        },
        "controls" => {
          "type" => "array",
          "items" => CONTROL,
        },
        "groups" => {
          "type" => "array",
          "items" => CONTROL_GROUP,
        },
        "attributes" => { # TODO: rename to inputs, refs #3802
          "type" => "array",
          # TODO: more detailed specification needed
        },
      },
    }.freeze

    PROFILE_ENHANCED_OUTCOME = {
      "type" => "object",
      "additionalProperties" => false,
      "properties" => {
        "name" => { "type" => "string" },
        "version" => { "type" => "string", "optional" => true },
        "sha256" => { "type" => "string", "optional" => false },

        "title" => { "type" => "string", "optional" => true },
        "maintainer" => { "type" => "string", "optional" => true },
        "copyright" => { "type" => "string", "optional" => true },
        "copyright_email" => { "type" => "string", "optional" => true },
        "license" => { "type" => "string", "optional" => true },
        "summary" => { "type" => "string", "optional" => true },
        "status" => { "type" => "string", "optional" => false },
        "status_message" => { "type" => "string", "optional" => true },
        # skip_message is deprecated, status_message should be used to store the reason for skipping
        "skip_message" => { "type" => "string", "optional" => true },

        "supports" => {
          "type" => "array",
          "items" => SUPPORTS,
          "optional" => true,
        },
        "controls" => {
          "type" => "array",
          "items" => CONTROL_ENHANCED_OUTCOME,
        },
        "groups" => {
          "type" => "array",
          "items" => CONTROL_GROUP,
        },
        "attributes" => { # TODO: rename to inputs, refs #3802
          "type" => "array",
          # TODO: more detailed specification needed
        },
      },
    }.freeze

    EXEC_JSON = {
      "type" => "object",
      "additionalProperties" => false,
      "properties" => {
        "platform" => PLATFORM,
        "profiles" => {
          "type" => "array",
          "items" => PROFILE,
        },
        "statistics" => STATISTICS,
        "version" => { "type" => "string" },
      },
    }.freeze

    EXEC_JSON_ENHANCED_OUTCOME = {
      "type" => "object",
      "additionalProperties" => false,
      "properties" => {
        "platform" => PLATFORM,
        "profiles" => {
          "type" => "array",
          "items" => PROFILE_ENHANCED_OUTCOME,
        },
        "statistics" => STATISTICS,
        "version" => { "type" => "string" },
      },
    }.freeze

    MIN_CONTROL = {
      "type" => "object",
      "additionalProperties" => false,
      "properties" => {
        "id" => { "type" => "string" },
        "profile_id" => { "type" => %w{string null} },
        "profile_sha256" => { "type" => "string" },
        "status" => { "type" => "string" },
        "code_desc" => { "type" => "string" },
        "resource_class" => { "type" => "string", "optional" => true },
        "skip_message" => { "type" => "string", "optional" => true },
        "resource" => { "type" => "string", "optional" => true },
        "message" => { "type" => "string", "optional" => true },
        "exception" => { "type" => "string", "optional" => true },
        "backtrace" => { "type" => "object", "optional" => true },
      },
    }.freeze

    EXEC_JSONMIN = {
      "type" => "object",
      "additionalProperties" => false,
      "properties" => {
        "statistics" => STATISTICS,
        "version" => { "type" => "string" },
        "controls" => {
          "type" => "array",
          "items" => MIN_CONTROL,
        },
      },
    }.freeze

    # using a proc here so we can lazy load it when we need
    PLATFORMS = lambda do
      require "train"
      Train.create("mock").connection
      Train::Platforms.export
    end

    LIST = {
      "exec-json" => EXEC_JSON,
      "exec-jsonmin" => EXEC_JSONMIN,
      "exec-json-enhanced-outcome" => EXEC_JSON_ENHANCED_OUTCOME,
      "platforms" => PLATFORMS,
    }.freeze

    def self.names
      LIST.keys
    end

    def self.json(name)
      if !LIST.key?(name)
        raise("Cannot find schema #{name.inspect}.")
      elsif LIST[name].is_a?(Proc)
        v = LIST[name].call
      else
        v = LIST[name]
      end

      JSON.dump(v)
    end
  end
end
