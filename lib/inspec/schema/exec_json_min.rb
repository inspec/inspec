require "inspec/schema/primitives"

# These type occur only when running "exec --reporter json-min <file>".

module Inspec
  module Schema
    module ExecJsonMin
      # Represents a subset of the information about a control, designed for conciseness
      CONTROL = Primitives::SchemaType.new("Exec JSON-MIN Control", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => %w{id profile_id profile_sha256 status code_desc},
        "properties" => {
          "id" => Primitives::STRING,
          "profile_id" => { "type" => %w{string null} },
          "profile_sha256" => Primitives::STRING,
          "status" => Primitives::STRING,
          "code_desc" => Primitives::STRING,
          "skip_message" => Primitives::STRING,
          "resource" => Primitives::STRING,
          "message" => Primitives::STRING,
          "exception" => Primitives::STRING,
          "backtrace" => Primitives.array(Primitives::STRING),
        },
      }, [])

      # Result of exec jsonmin. Top level value
      OUTPUT = Primitives::SchemaType.new("Exec JSON-MIN output", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => %w{statistics controls version},
        "properties" => {
          "statistics" => Primitives::STATISTICS.ref,
          "version" => Primitives::STRING,
          "controls" => Primitives.array(CONTROL.ref),
        },
      }, [Primitives::STATISTICS, CONTROL])
    end
  end
end
