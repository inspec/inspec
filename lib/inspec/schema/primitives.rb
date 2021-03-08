require "set" unless defined?(Set)

# These elements are shared between more than one output type

module Inspec
  module Schema
    module Primitives
      ######################### Establish simple helpers for this schema ########################################
      # Use this function to easily make described types
      def self.desc(obj, description)
        obj.merge({ "description" => description })
      end

      # Use this function to easily make an array of a type
      def self.array(of_type)
        {
          "type" => "array",
          "items" => of_type,
        }
      end

      # This function performs some simple validation on schemas, to catch obvious missed requirements
      def self.validate_schema(schema)
        return if schema["type"] != "object"
        raise "Objects in schema must have a \"required\" property, even if it is empty." unless schema.key?("required")

        return if schema["required"].empty?
        raise "An object with required properties must have a properties hash." unless schema.key?("properties")

        return if Set.new(schema["required"]) <= Set.new(schema["properties"].keys)

        raise "Not all required properties are present."
      end

      # Use this class to quickly add/use object types to/in a definition block
      class SchemaType
        attr_accessor :name, :depends
        def initialize(name, body, dependencies)
          # Validate the schema
          Primitives.validate_schema(body)
          # The title of the type
          @name = name
          # The body of the type
          @body = body
          # What SchemaType[]s it depends on. In essence, any thing that you .ref in the body
          @depends = Set.new(dependencies)
        end

        # Produce this schema types generated body.
        # Use to actually define the ref!
        def body
          @body.merge({
              "title" => @name,
          })
        end

        # Formats this to have a JSON pointer compatible title
        def ref_name
          @name.gsub(/\s+/, "_")
        end

        # Yields this type as a json schema ref
        def ref
          { "$ref" => "#/definitions/#{ref_name}" }
        end

        # Recursively acquire all depends for this schema. Return them sorted by name
        def all_depends
          result = @depends
          # Fetch all from children
          @depends.each do |nested_type|
            # Yes, converting back to set here does some duplicate sorting.
            # But here, performance really isn't our concern.
            result += Set.new(nested_type.all_depends)
          end
          # Return the results as a sorted array
          Array(result).sort_by(&:name)
        end
      end

      ######################### Establish basic type shorthands for this schema ########################################
      # These three are essentially primitives, used as shorthand
      OBJECT = { "type" => "object", "additionalProperties" => true }.freeze
      NUMBER = { "type" => "number" }.freeze
      STRING = { "type" => "string" }.freeze
      NULL = { "type" => "null" }.freeze

      # We might eventually enforce string format stuff on this
      URL = { "type" => "string" }.freeze

      # A controls tags can have any number of properties, and any sorts of values
      TAGS = { "type" => "object", "additionalProperties" => true }.freeze

      # Attributes/Inputs specify the inputs to a profile.
      INPUT = { "type" => "object", "additionalProperties" => true }.freeze

      # Within a control file, impacts can be numeric 0-1 or string in [none,low,medium,high,critical]
      # However, when they are output, the string types are automatically converted as follows:
      # none      -> 0    to 0.01
      # low       -> 0.01 to 0.4
      # medium    -> 0.4  to 0.7
      # high      -> 0.7  to 0.9
      # Critical  -> 0.9  to 1.0 (inclusive)
      IMPACT = {
        "type" => "number",
        "minimum" => 0.0,
        "maximum" => 1.0,
      }.freeze

      # A status for a control
      STATUS = {
        "type" => "string",
        "enum" => %w{passed failed skipped error},
      }.freeze

      ######################### Establish inspec types common to several schemas helpers for this schema #######################################

      # We use "title" to name the type.
      # and "description" (via the describe function) to describe its particular usage
      # Summary item containing run statistics about a subset of the controls
      STATISTIC_ITEM = SchemaType.new("Statistic Block", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => ["total"],
        "properties" => {
          "total" => desc(NUMBER, "Total number of controls (in this category) for this inspec execution."),
        },
      }, [])

      # Bundles several results statistics, representing distinct groups of controls
      STATISTIC_GROUPING = SchemaType.new("Statistic Hash", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => [],
        "properties" => {
            "passed" => STATISTIC_ITEM.ref,
            "skipped" => STATISTIC_ITEM.ref,
            "failed" => STATISTIC_ITEM.ref,
        },
      }, [STATISTIC_ITEM])

      # Contains statistics of an exec run.
      STATISTICS = SchemaType.new("Statistics", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => ["duration"],
        "properties" => {
          "duration" => desc(NUMBER, "How long (in seconds) this inspec exec ran for."),
          "controls" => desc(STATISTIC_GROUPING.ref, "Breakdowns of control statistics by result"),
        },
      }, [STATISTIC_GROUPING])

      # Profile dependencies
      DEPENDENCY = SchemaType.new("Dependency", {
        "type" => "object",
        "additionalProperties" => true, # Weird stuff shows up here sometimes
        "required" => [], # Mysteriously even in a run profile we can have no status
        "properties" => {
          "name" => STRING,
          "url" => URL,
          "branch" => STRING,
          "path" => STRING,
          "status_message" => STRING,
          "status" => STRING,
          "git" => URL,
          "supermarket" => STRING,
          "compliance" => STRING,
        },
      }, [])

      # Represents the platform the test was run on
      PLATFORM = SchemaType.new("Platform", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => %w{name release},
        "properties" => {
          "name" => desc(STRING, "The name of the platform this was run on."),
          "release" => desc(STRING, "The version of the platform this was run on."),
          "target_id" => STRING,
        },
      }, [])

      # Explains what software ran the inspec profile/made this file. Typically inspec but could in theory be a different software
      GENERATOR = SchemaType.new("Generator", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => %w{name version},
        "properties" => {
          "name" => desc(STRING, "The name of the software that generated this report."),
          "version" => desc(STRING, "The version of the software that generated this report."),
        },
      }, [])

      # Occurs from "exec --reporter json" and "inspec json"
      # Denotes what file this control comes from, and where within
      SOURCE_LOCATION = SchemaType.new("Source Location", {
        "type" => "object",
        "additionalProperties" => true,
        "properties" => {
          "ref" => desc(STRING, "Path to the file that this statement originates from"),
          "line" => desc(NUMBER, "The line at which this statement is located in the file"),
        },
        "required" => %w{ref line},
      }, [])

      # References an external document
      REFERENCE = SchemaType.new("Reference", {
        # Needs at least one of title (ref), url, or uri.
        "anyOf" => [
          {
            "type" => "object",
            "required" => ["ref"],
            "properties" => { "ref" => STRING },
          },
          {
            "type" => "object",
            "required" => ["url"],
            "properties" => { "url" => STRING },
          },
          {
            "type" => "object",
            "required" => ["uri"],
            "properties" => { "uri" => STRING },
          },
          # I am of the opinion that this is just an error in the codebase itself. See profiles/wrapper-override to uncover new mysteries!
          {
            "type" => "object",
            "required" => ["ref"],
            "properties" => { "ref" => array(OBJECT) },

          },
        ],
      }, [])

      # Represents a group of controls within a profile/.rb file
      CONTROL_GROUP = SchemaType.new("Control Group", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => %w{id controls},
        "properties" => {
          "id" => desc(STRING, "The unique identifier of the group"),
          "title" => desc({ type: %w{string null} }, "The name of the group"),
          "controls" => desc(array(STRING), "The control IDs in this group"),
        },
      }, [])

      # Occurs from "inspec exec --reporter json" and "inspec json"
      # Represents a platfrom or group of platforms that this profile supports
      SUPPORT = SchemaType.new("Supported Platform", {
        "type" => "object",
        "additionalProperties" => true, # NOTE: This should really be false, and inspec should validate profiles to ensure people don't make dumb mistakes like platform_family
        "required" => [],
        "properties" => {
          "platform-family" => STRING,
          "platform-name" => STRING,
          "platform" => STRING,
          "release" => STRING,
          # os-* supports are being deprecated
          "os-family" => STRING,
          "os-name" => STRING,
        },
      }, [])

    end
  end
end
