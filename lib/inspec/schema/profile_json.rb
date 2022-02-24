require "inspec/schema/primitives"

# These type occur only when running "inspec json <file>".

module Inspec
  module Schema
    module ProfileJson
      # Represents descriptions. Can have any string => string pairing
      CONTROL_DESCRIPTIONS = Primitives::SchemaType.new("Profile JSON Control Descriptions", {
        "type" => "object",
        "additionalProperties" => Primitives::STRING,
        "required" => [],
      }, [], "An arbitrary set of descriptions for a control.")

      # Represents a control that hasn't been run
      # Differs slightly from a normal control, in that it lacks results, and its descriptions are different
      CONTROL = Primitives::SchemaType.new("Profile JSON Control", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => %w{id title desc impact tags code},
        "properties" => {
          "id" => Primitives.desc(Primitives::STRING, "The id."),
          "title" => Primitives.desc({ "type" => %w{string null} }, "The title - is nullable."),
          "desc" => Primitives.desc({ "type" => %w{string null} }, "The description for the overarching control."),
          "descriptions" => Primitives.desc(CONTROL_DESCRIPTIONS.ref, "A set of additional descriptions.  Example: the 'fix' text."),
          "impact" => Primitives.desc(Primitives::IMPACT, "The impactfulness or severity."),
          "refs" => Primitives.desc(Primitives.array(Primitives::REFERENCE.ref), "The set of references to external documents."),
          "tags" => Primitives.desc(Primitives::TAGS, "A set of tags - usually metadata."),
          "code" => Primitives.desc(Primitives::STRING, "The raw source code of the control. Note that if this is an overlay control, it does not include the underlying source code."),
          "source_location" => Primitives.desc(Primitives::SOURCE_LOCATION.ref, "The explicit location of the control within the source code."),
        },
      }, [CONTROL_DESCRIPTIONS, Primitives::REFERENCE, Primitives::SOURCE_LOCATION], "The set of all tests within the control.")

      # A profile that has not been run.
      PROFILE = Primitives::SchemaType.new("Profile JSON Profile", {
        "type" => "object",
        "additionalProperties" => true, # Anything in the yaml will be put in here. LTTODO: Make this stricter!
        "required" => %w{name supports controls groups sha256},
        "properties" => {
          "name" => Primitives.desc(Primitives::STRING, "The name - must be unique."),
          "supports" => Primitives.desc(Primitives.array(Primitives::SUPPORT.ref), "The set of supported platform targets."),
          "controls" => Primitives.desc(Primitives.array(CONTROL.ref), "The set of controls - contains no findings as the assessment has not yet occurred."),
          "groups" => Primitives.desc(Primitives.array(Primitives::CONTROL_GROUP.ref), "A set of descriptions for the control groups.  Example: the ids of the controls."),
          "inputs" => Primitives.desc(Primitives.array(Primitives::INPUT), "The input(s) or attribute(s) used to be in the run."),
          "sha256" => Primitives.desc(Primitives::STRING, "The checksum of the profile."),
          "status" => Primitives.desc(Primitives::STRING, "The status.  Example: skipped."),
          "generator" => Primitives.desc(Primitives::GENERATOR.ref, "The tool that generated this file.  Example: Chef Inspec."),
          "version" => Primitives.desc(Primitives::STRING, "The version of the profile."),

          # Other properties possible in inspec docs, but that aren"t guaranteed
          "title" => Primitives.desc(Primitives::STRING, "The title - should be human readable."),
          "maintainer" => Primitives.desc(Primitives::STRING, "The maintainer(s)."),
          "copyright" => Primitives.desc(Primitives::STRING, "The copyright holder(s)."),
          "copyright_email" => Primitives.desc(Primitives::STRING, "The email address or other contract information of the copyright holder(s)."),
          "depends" => Primitives.desc(Primitives.array(Primitives::DEPENDENCY.ref), "The set of dependencies this profile depends on.  Example: an overlay profile is dependent on another profile."), # Can have depends, but NOT a parentprofile
        },
      }, [Primitives::SUPPORT, CONTROL, Primitives::CONTROL_GROUP, Primitives::DEPENDENCY, Primitives::GENERATOR], "Information on the set of controls that can be assessed.  Example: it can include the name of the Inspec profile.")
    end
  end
end
