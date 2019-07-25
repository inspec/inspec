require_relative "./primitives"

# We disable this for the sake of legibility
# rubocop:disable Layout/AlignHash

# These type occur only when running "exec --reporter json-min <file>".

module Schema
  module ExecJsonMin
    # Represents a subset of the information about a control, designed for conciseness
    CONTROL = SchemaType.new("Exec JSON-MIN Control", {
      "type" => "object",
      "additionalProperties"  => false,
      "required"              => %w{id profile_id profile_sha256 status code_desc},
      "properties"            => {
        "id"              => STRING,
        "profile_id"      => { "type" => %w{string null} },
        "profile_sha256"  => STRING,
        "status"          => STRING,
        "code_desc"       => STRING,
        "skip_message"    => STRING,
        "resource"        => STRING,
        "message"         => STRING,
        "exception"       => STRING,
        "backtrace"       => STRING,
      },
    }, [])

    # Result of exec jsonmin. Top level value
    OUTPUT = SchemaType.new("Exec JSON-MIN output", {
      "type" => "object",
      "additionalProperties"  => false,
      "required"              => %w{statistics controls version},
      "properties"            => {
        "statistics"   => STATISTICS.ref,
        "version"      => STRING,
        "controls"     => Schema.array(CONTROL.ref),
      },
    }, [STATISTICS, CONTROL])
  end
end
