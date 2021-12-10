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
          "label" => Primitives.desc(Primitives::STRING, "The type of description.  Examples: 'fix' or 'check'."),
          "data" => Primitives.desc(Primitives::STRING, "The text of the description."),
        },
      }, [], "A description for a control.")

      # Lists the potential values for a control result
      CONTROL_RESULT_STATUS = Primitives::SchemaType.new("Control Result Status", {
        "type" => "string",
        "enum" => %w{passed failed skipped error},
      }, [], "The status of a control.  Should be one of 'passed', 'failed', 'skipped', or 'error'.")

      # Represents the statistics/result of a control"s execution
      CONTROL_RESULT = Primitives::SchemaType.new("Control Result", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => %w{code_desc run_time start_time},
        "properties" => {
          "status" => Primitives.desc(CONTROL_RESULT_STATUS.ref, "The status of this test within the control.  Example: 'failed'."),
          "code_desc" => Primitives.desc(Primitives::STRING, "A description of this test.  Example: 'limits.conf * is expected to include ['hard', 'maxlogins', '10']."),
          "run_time" => Primitives.desc(Primitives::NUMBER, "The execution time in seconds for the test."),
          "start_time" => Primitives.desc(Primitives::STRING, "The time at which the test started."),

          # All optional
          "resource" => Primitives.desc(Primitives::STRING, "The resource used in the test.  Example: in Inspec, you can use the 'File' resource."),
          "message" => Primitives.desc(Primitives::STRING, "An explanation of the test status - usually only provided when the test fails."),
          "skip_message" => Primitives.desc(Primitives::STRING, "An explanation of the test status if the status was 'skipped."),
          "exception" => Primitives.desc(Primitives::STRING, "The type of exception if an exception was thrown."),
          "backtrace" => {
            "anyOf" => [
              Primitives.array(Primitives::STRING),
              Primitives::NULL,
            ],
            "description" => "The stacktrace/backtrace of the exception if one occurred.",
          },
        },
      }, [CONTROL_RESULT_STATUS], "A test within a control and its results and findings such as how long it took to run.")

      # Represents a control produced
      CONTROL = Primitives::SchemaType.new("Exec JSON Control", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => %w{id title desc impact refs tags code source_location results},
        "properties" => {
          "id" => Primitives.desc(Primitives::STRING, "The id."),
          "title" => Primitives.desc({ "type" => %w{string null} }, "The title - is nullable."), # Nullable string
          "desc" => Primitives.desc({ "type" => %w{string null} }, "The description for the overarching control."),
          "descriptions" => Primitives.desc(Primitives.array(CONTROL_DESCRIPTION.ref), "A set of additional descriptions.  Example: the 'fix' text."),
          "impact" => Primitives.desc(Primitives::IMPACT, "The impactfulness or severity."),
          "refs" => Primitives.desc(Primitives.array(Primitives::REFERENCE.ref), "The set of references to external documents."),
          "tags" => Primitives.desc(Primitives::TAGS, "A set of tags - usually metadata."),
          "code" => Primitives.desc(Primitives::STRING, "The raw source code of the control. Note that if this is an overlay control, it does not include the underlying source code."),
          "source_location" => Primitives.desc(Primitives::SOURCE_LOCATION.ref, "The explicit location of the control within the source code."),
          "results" => Primitives.desc(Primitives.array(CONTROL_RESULT.ref), %q(
             The set of all tests within the control and their results and findings.  Example:
             For Chef Inspec, if in the control's code we had the following:
               describe sshd_config do
                 its('Port') { should cmp 22 }
               end
             The findings from this block would be appended to the results, as well as those of any other blocks within the control.
          )),
        },
      }, [CONTROL_DESCRIPTION, Primitives::REFERENCE, Primitives::SOURCE_LOCATION, CONTROL_RESULT], "Describes a control and any findings it has.")

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
          "name" => Primitives.desc(Primitives::STRING, "The name - must be unique."),
          "title" => Primitives.desc(Primitives::STRING, "The title - should be human readable."),
          "maintainer" => Primitives.desc(Primitives::STRING, "The maintainer(s)."),
          "copyright" => Primitives.desc(Primitives::STRING, "The copyright holder(s)."),
          "copyright_email" => Primitives.desc(Primitives::STRING, "The email address or other contact information of the copyright holder(s)."),
          "depends" => Primitives.desc(Primitives.array(Primitives::DEPENDENCY.ref), "The set of dependencies this profile depends on.  Example: an overlay profile is dependent on another profile."),
          "parent_profile" => Primitives.desc(Primitives::STRING, "The name of the parent profile if the profile is a dependency of another."),
          "license" => Primitives.desc(Primitives::STRING, "The copyright license.  Example: the full text or the name, such as 'Apache License, Version 2.0'."),
          "summary" => Primitives.desc(Primitives::STRING, "The summary.  Example: the Security Technical Implementation Guide (STIG) header."),
          "version" => Primitives.desc(Primitives::STRING, "The version of the profile."),
          "supports" => Primitives.desc(Primitives.array(Primitives::SUPPORT.ref), "The set of supported platform targets."),
          "description" => Primitives.desc(Primitives::STRING, "The description - should be more detailed than the summary."),
          "inspec_version" => Primitives.desc(Primitives::STRING, "The version of Inspec."),

          # These are generated at runtime, and all except status_message and skip_message are guaranteed
          "sha256" => Primitives.desc(Primitives::STRING, "The checksum of the profile."),
          "status" => Primitives.desc(Primitives::STRING, "The status.  Example: skipped."),
          "status_message" => Primitives.desc(Primitives::STRING, "The reason for the status.  Example: why it was skipped or failed to load."),
          "skip_message" => Primitives.desc(Primitives::STRING, "The reason for skipping if it was skipped."), # Deprecated field - status_message should be used instead.
          "controls" => Primitives.desc(Primitives.array(CONTROL.ref), "The set of controls including any findings."),
          "groups" => Primitives.desc(Primitives.array(Primitives::CONTROL_GROUP.ref), "A set of descriptions for the control groups.  Example: the ids of the controls."),
          "attributes" => Primitives.desc(Primitives.array(Primitives::INPUT), "The input(s) or attribute(s) used in the run."),
        },
      }, [CONTROL, Primitives::CONTROL_GROUP, Primitives::DEPENDENCY, Primitives::SUPPORT], "Information on the set of controls assessed.  Example: it can include the name of the Inspec profile and any findings.")

      # Result of exec json. Top level value
      # TODO: Include the format of top level controls. This was omitted for lack of sufficient examples
      OUTPUT = Primitives::SchemaType.new("Exec JSON Output", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => %w{platform profiles statistics version},
        "properties" => {
          "platform" => Primitives.desc(Primitives::PLATFORM.ref, "Information on the platform the run from the tool that generated the findings was from.  Example: the name of the operating system."),
          "profiles" => Primitives.desc(Primitives.array(PROFILE.ref), "Information on the run(s) from the tool that generated the findings.  Example: the findings."),
          "statistics" => Primitives.desc(Primitives::STATISTICS.ref, "Statistics for the run(s) from the tool that generated the findings.  Example: the runtime duration."),
          "version" => Primitives.desc(Primitives::STRING, "Version number of the tool that generated the findings.  Example: '4.18.108' is a version of Chef InSpec."),
        },
      }, [Primitives::PLATFORM, PROFILE, Primitives::STATISTICS], "The top level value containing all of the results.")
    end
  end
end
