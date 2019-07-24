require_relative "./primitives"

# We disable this for the sake of legibility
# rubocop:disable Layout/AlignHash

# These type occur only when running "inspec json <file>".

module Schema
  module ProfileJson
    # Represents descriptions. Can have any string => string pairing
    DESCRIPTIONS = SchemaType.new("Profile JSON Descriptions", {
      "aditionalProperties" => STRING,
      "required" => [],
    }, [])

    # Represents a control that hasn't been run
    # Differs slightly from a normal control, in that it lacks results, and its descriptions are different
    # TODO: Attempt to unify this with the CONTROL type
    CONTROL = SchemaType.new("Profile JSON Control", {
      "additionalProperties"  => false,
      "required"              => %w{title desc descriptions impact refs tags code source_location id},
      "properties"            => {
        "id"              => STRING,
        "title"           => { "type" => %w{string null} },
        "desc"            => { "type" => %w{string null} },
        "descriptions"    => DESCRIPTIONS.ref,
        "impact"          => IMPACT,
        "refs"            => Schema.array(REFERENCE.ref),
        "tags"            => TAGS,
        "code"            => STRING,
        "source_location" => SOURCE_LOCATION.ref,
      },
    }, [DESCRIPTIONS, REFERENCE, SOURCE_LOCATION])

    # A profile that has not been run.
    # TODO: Try to unify with the exec version
    PROFILE = SchemaType.new("Profile JSON Profile", {
      "additionalProperties"  => true, # Anything in the yaml will be put in here
      "required"              => %w{name supports controls groups inputs sha256 status},
      "properties"            => {
        "name"            => STRING,
        "supports"        => Schema.array(SUPPORT.ref),
        "controls"        => Schema.array(CONTROL.ref),
        "groups"          => Schema.array(CONTROL_GROUP.ref),
        "inputs"          => Schema.array(INPUT),
        "sha256"          => STRING,
        "status"          => STRING,
        "generator"       => GENERATOR.ref,

        # Other properties recommended in inspec docs, but that aren"t guaranteed
        "title"           => STRING,
        "maintainer"      => STRING,
        "copyright"       => STRING,
        "copyright_email" => STRING,
      },
    }, [SUPPORT, CONTROL, CONTROL_GROUP, GENERATOR])
  end
end
