require "inspec/schema/primitives"

# These type occur only when running "inspec exec --reporter json <file>".

module Inspec
  module Schema
    module ExecJson
      # Represents a label and description, to provide human-readable info about a control
      CONTROL_DESCRIPTION = Primitives::SchemaType.new("Control Description", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => %w{label data},
        "properties" => {
          "label" => Primitives::STRING,
          "data" => Primitives::STRING,
        },
      }, [])

      # Lists the potential values for a control result
      CONTROL_RESULT_STATUS = Primitives::SchemaType.new("Control Result Status", {
        "type" => "string",
        "enum" => %w{passed failed skipped error},
      }, [])

      # Represents the statistics/result of a control"s execution
      CONTROL_RESULT = Primitives::SchemaType.new("Control Result", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => %w{code_desc run_time start_time},
        "properties" => {
          "status" => CONTROL_RESULT_STATUS.ref,
          "code_desc" => Primitives::STRING,
          "run_time" => Primitives::NUMBER,
          "start_time" => Primitives::STRING,

          # All optional
          "resource" => Primitives::STRING,
          "message" => Primitives::STRING,
          "skip_message" => Primitives::STRING,
          "exception" => Primitives::STRING,
          "backtrace" => {
            "anyOf" => [
              Primitives.array(Primitives::STRING),
              Primitives::NULL,
            ],
          },
        },
      }, [CONTROL_RESULT_STATUS])

      # Represents a control produced
      CONTROL = Primitives::SchemaType.new("Exec JSON Control", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => %w{id title desc impact refs tags code source_location results},
        "properties" => {
          "id" => Primitives.desc(Primitives::STRING, "The ID of this control"),
          "title" => { "type" => %w{string null} }, # Nullable string
          "desc" => { "type" => %w{string null} },
          "descriptions" => Primitives.array(CONTROL_DESCRIPTION.ref),
          "impact" => Primitives::IMPACT,
          "refs" => Primitives.array(Primitives::REFERENCE.ref),
          "tags" => Primitives::TAGS,
          "code" => Primitives.desc(Primitives::STRING, "The raw source code of the control. Note that if this is an overlay control, it does not include the underlying source code"),
          "source_location" => Primitives::SOURCE_LOCATION.ref,
          "results" => Primitives.desc(Primitives.array(CONTROL_RESULT.ref), %q{
              A list of all results of the controls describe blocks.

              For instance, if in the controls code we had the following:
                describe sshd_config do
                  its('Port') { should cmp 22 }
                end
              The result of this block as a ControlResult would be appended to the results list.
              }),
        },
      }, [CONTROL_DESCRIPTION, Primitives::REFERENCE, Primitives::SOURCE_LOCATION, CONTROL_RESULT])

      # Based loosely on https://docs.chef.io/inspec/profiles/ as of July 3, 2019
      # However, concessions were made to the reality of current reporters, specifically
      # with how description is omitted and version/inspec_version aren't as advertised online
      PROFILE = Primitives::SchemaType.new("Exec JSON Profile", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => %w{name sha256 supports attributes groups controls},
        # Name is mandatory in inspec.yml.
        # supports, controls, groups, and attributes are always present, even if empty
        # sha256, status, status_message
        "properties" => {
          # These are provided in inspec.yml
          "name" => Primitives::STRING,
          "title" => Primitives::STRING,
          "maintainer" => Primitives::STRING,
          "copyright" => Primitives::STRING,
          "copyright_email" => Primitives::STRING,
          "depends" => Primitives.array(Primitives::DEPENDENCY.ref),
          "parent_profile" => Primitives::STRING,
          "license" => Primitives::STRING,
          "summary" => Primitives::STRING,
          "version" => Primitives::STRING,
          "supports" => Primitives.array(Primitives::SUPPORT.ref),
          "description" => Primitives::STRING,
          "inspec_version" => Primitives::STRING,

          # These are generated at runtime, and all except status_message and skip_message are guaranteed
          "sha256" => Primitives::STRING,
          "status" => Primitives::STRING,
          "status_message" => Primitives::STRING, # If skipped or failed to load, why
          "skip_message" => Primitives::STRING,   # Deprecated field storing reason for skipping. status_message should be used instead.
          "controls" => Primitives.array(CONTROL.ref),
          "groups" => Primitives.array(Primitives::CONTROL_GROUP.ref),
          "attributes" => Primitives.array(Primitives::INPUT),
        },
      }, [CONTROL, Primitives::CONTROL_GROUP, Primitives::DEPENDENCY, Primitives::SUPPORT])

      # Result of exec json. Top level value
      # TODO: Include the format of top level controls. This was omitted for lack of sufficient examples
      OUTPUT = Primitives::SchemaType.new("Exec JSON Output", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => %w{platform profiles statistics version},
        "properties" => {
          "platform" => Primitives::PLATFORM.ref,
          "profiles" => Primitives.array(PROFILE.ref),
          "statistics" => Primitives::STATISTICS.ref,
          "version" => Primitives::STRING,
        },
      }, [Primitives::PLATFORM, PROFILE, Primitives::STATISTICS])
    end
  end
end
