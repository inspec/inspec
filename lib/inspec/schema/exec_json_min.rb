require "inspec/schema/primitives"

# These type occur only when running "exec --reporter exec-jsonmin <file>".

module Inspec
  module Schema
    module ExecJsonMin
      # Represents a subset of the information about a control, designed for conciseness
      CONTROL = Primitives::SchemaType.new("Exec JSON-MIN Control", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => %w{id profile_id profile_sha256 status code_desc},
        "properties" => {
          "id" => Primitives.desc(Primitives::STRING, "The id."),
          "profile_id" => Primitives.desc({ "type" => %w{string null} }, "The name of the profile that can uniquely identify it - is nullable."),
          "profile_sha256" => Primitives.desc(Primitives::STRING, "The checksum of the profile."),
          "status" => Primitives.desc(Primitives::STRING, "The status of the control.  Example: 'failed'."),
          "code_desc" => Primitives.desc(Primitives::STRING, "A description of the control.  Example: 'limits.conf * is expected to include ['hard', 'maxlogins', '10']."),
          "message" => Primitives.desc(Primitives::STRING, "An explanation of the control status - usually only provided when the control fails."),
          "skip_message" => Primitives.desc(Primitives::STRING, "An explanation of the status if the status was 'skipped'."),
          "resource" => Primitives.desc(Primitives::STRING, "The resource used in the test.  Example: in Inspec, you can use the 'File' resource."),
          "exception" => Primitives.desc(Primitives::STRING, "The type of exception if an exception was thrown."),
          "backtrace" => Primitives.desc(Primitives.array(Primitives::STRING), "The stacktrace/backtrace of the exception if one occurred."), # shouldn't this also be an anyOf similar to the CONTROL_RESULT from exec_json?
        },
      }, [], "The set of all tests within the control and their results and findings.")

      # Result of exec jsonmin. Top level value
      OUTPUT = Primitives::SchemaType.new("Exec JSON-MIN Output", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => %w{statistics controls version},
        "properties" => {
          "statistics" => Primitives.desc(Primitives::STATISTICS.ref, "Statistics for the run(s) from the tool that generated the findings.  Example: the runtime duration."),
          "version" => Primitives.desc(Primitives::STRING, "Version number of the tool that generated the findings.  Example: '4.18.108' is a version of Chef Inspec."),
          "controls" => Primitives.desc(Primitives.array(CONTROL.ref), "The set of controls including any findings as reported by the tool."),
        },
      }, [Primitives::STATISTICS, CONTROL])
    end
  end
end
