require "json"
require "lib/inspec/schema/primitives"
require "lib/inspec/schema/exec_json"
require "lib/inspec/schema/exec_json_min"
require "lib/inspec/schema/profile_json"

module Inspec
  module OutputSchema
    # Build our definitions
    def self.build_definitions(schema_type)
      # Init definition hash
      definitions = {}

      # Fetch all dependencies
      defined_types = schema_type.all_depends

      # Add them all to the definition hash
      defined_types.each do |type|
        definitions[type.name] = type.body
      end

      # Nest under "definitions" label
      {
        "definitions" => definitions,
      }
    end

    # Helper function to automatically bundle a type with its dependencies
    def self.finalize(schema_type)
      schema_type.body.merge(OutputSchema.build_definitions(schema_type))
    end

    # using a proc here so we can lazy load it when we need
    # TODO: Modernize
    PLATFORMS = lambda do
      require "train"
      Train.create("mock").connection
      Train::Platforms.export
    end

    LIST = {
      "profile-json" => OutputSchema.finalize(Schema::ProfileJson::PROFILE),
      "exec-json" => OutputSchema.finalize(Schema::ExecJson::OUTPUT),
      "exec-jsonmin" => OutputSchema.finalize(Schema::ExecJsonMin::OUTPUT),
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
