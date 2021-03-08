require "json" unless defined?(JSON)
require "inspec/schema/primitives"
require "inspec/schema/exec_json"
require "inspec/schema/exec_json_min"
require "inspec/schema/profile_json"

module Inspec
  module Schema
    module OutputSchema
      # Build our definitions
      def self.build_definitions(schema_type)
        {
          "definitions" => schema_type.all_depends.map { |t| [t.ref_name, t.body] }.to_h,
        }
      end

      # Helper function to automatically bundle a type with its dependencies
      def self.finalize(schema_type)
        schema_type.body.merge(OutputSchema.build_definitions(schema_type))
      end

      # using a proc here so we can lazy load it when we need
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
end
