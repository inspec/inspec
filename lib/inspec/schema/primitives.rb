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
        def initialize(name, body, dependencies, description = nil)
          # Validate the schema
          Primitives.validate_schema(body)
          # The title of the type
          @name = name
          # The body of the type
          @body = body
          # What SchemaType[]s it depends on. In essence, any thing that you .ref in the body
          @depends = Set.new(dependencies)
          # The description of the type
          @description = description
        end

        # Produce this schema types generated body.
        # Use to actually define the ref!
        def body
          @body.merge({
              "description" => @description,
              "title" => @name,
          }).compact
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
      TAGS = {
        "type" => "object",
        "additionalProperties" => true,
        "description" => "A set of any number of tags - they can have any sort of value and are usually metadata.  Example: 'nist' => ['AC-10'].",
      }.freeze

      # Attributes/Inputs specify the inputs to a profile.
      INPUT = {
        "type" => "object",
        "additionalProperties" => true,
        "description" => "An input or attribute used in the run."
      }.freeze

      IMPACT = {
        "type" => "number",
        "minimum" => 0.0,
        "maximum" => 1.0,
        "description" => %q(
           Within a control file, impacts can be a decimal number in the range [0,1] or a string that is one of [none,low,medium,high,critical].
           However, the string will be automatically converted as follows:
           none      -> 0    to 0.01
           low       -> 0.01 to 0.4
           medium    -> 0.4  to 0.7
           high      -> 0.7  to 0.9
           critical  -> 0.9  to 1.0
        )
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
          "total" => desc(NUMBER, "The total.  Example: the total number of controls in a given category for a run."),
        },
      }, [], "Statistics for a given item, such as the total.")

      # Bundles several results statistics, representing distinct groups of controls
      STATISTIC_GROUPING = SchemaType.new("Statistic Hash", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => [],
        "properties" => {
          "passed" => desc(STATISTIC_ITEM.ref, "Statistics for the controls that passed."),
          "skipped" => desc(STATISTIC_ITEM.ref, "Statistics for the controls that were skipped."),
          "failed" => desc(STATISTIC_ITEM.ref, "Statistics for the controls that failed."),
        },
      }, [STATISTIC_ITEM], "Statistics for the control results.")

      # Contains statistics of an exec run.
      STATISTICS = SchemaType.new("Statistics", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => ["duration"],
        "properties" => {
          "duration" => desc(NUMBER, "How long (in seconds) this run by the tool was."),
          "controls" => desc(STATISTIC_GROUPING.ref, "Breakdowns of control statistics by result"),
        },
      }, [STATISTIC_GROUPING], "Statistics for the run(s) such as how long it took.")

      # Profile dependencies
      DEPENDENCY = SchemaType.new("Dependency", {
        "type" => "object",
        "additionalProperties" => true, # Weird stuff shows up here sometimes
        "required" => [], # Mysteriously even in a run profile we can have no status
        "properties" => {
          "name" => desc(STRING, "The name/assigned alias."),
          "url" => desc(URL, "The address of the dependency."),
          "branch" => desc(STRING, "The branch name for a git repo."),
          "path" => desc(STRING, "The relative path if the dependency is locally available."),
          "status_message" => desc(STRING, "The reason for the status if it is 'failed' or 'skipped'."),
          "status" => desc(STRING, "The status.  Should be: 'loaded', 'failed', or 'skipped'."), # NOTE: enum?
          "git" => desc(URL, "The location of the git repo.  Example: 'https://github.com/mitre/canonical-ubuntu-18.04-lts-stig-baseline.git'."),
          "supermarket" => desc(STRING, "The 'user/profilename' attribute for a Supermarket server."),
          "compliance" => desc(STRING, "The 'user/profilename' attribute for an Automate server."),
        },
      }, [], "A dependency for a profile.  Can include relative paths or urls for where to find the dependency.")

      # Represents the platform the test was run on
      PLATFORM = SchemaType.new("Platform", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => %w{name release},
        "properties" => {
          "name" => desc(STRING, "The name of the platform this was run on."),
          "release" => desc(STRING, "The version of the platform this was run on."),
          "target_id" => desc(STRING, "The id of the target.  Example: the name and version of the operating system were not sufficient to identify the platform so a release identifier can additionally be provided like '21H2' for the release version of MS Windows 10."),
        },
      }, [], "Platform information such as its name.")

      # Explains what software ran the inspec profile/made this file. Typically inspec but could in theory be a different software
      GENERATOR = SchemaType.new("Generator", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => %w{name version},
        "properties" => {
          "name" => desc(STRING, "The name.  Example: Chef Inspec."),
          "version" => desc(STRING, "The version.  Example: 4.18.108."),
        },
      }, [], "The tool that generated this file.  Example: Chef Inspec.")

      # Occurs from "exec --reporter json" and "inspec json"
      # Denotes what file this control comes from, and where within
      SOURCE_LOCATION = SchemaType.new("Source Location", {
        "type" => "object",
        "additionalProperties" => true,
        "properties" => {
          "ref" => desc(STRING, "Path to the file that this control originates from."),
          "line" => desc(NUMBER, "The line on which this control is located."),
        },
        "required" => %w{ref line},
      }, [], "The explicit location of the control.")

      # References an external document
      REFERENCE = SchemaType.new("Reference", {
        # Needs at least one of title (ref), url, or uri.
        "anyOf" => [
          {
            "type" => "object",
            "required" => ["ref"],
            "properties" => { "ref" => STRING },
            "description" => "A human readable/meaningful reference.  Example: a book title.",
          },
          {
            "type" => "object",
            "required" => ["url"],
            "properties" => { "url" => STRING }, # NOTE: should this be a URL?
            "description" => "A url pointing at the reference.",
          },
          {
            "type" => "object",
            "required" => ["uri"],
            "properties" => { "uri" => STRING }, # NOTE: should this be a URL?
            "description" => "A uri pointing at the reference.",
          },
          # I am of the opinion that this is just an error in the codebase itself. See profiles/wrapper-override to uncover new mysteries!
          {
            "type" => "object",
            "required" => ["ref"],
            "properties" => { "ref" => array(OBJECT) },
            "description" => "", # TODO: I'm not sure what goes here.  Maybe it's supposed to be objects similar to { "title" => "blah", "text" => "blah" }?

          },
        ],
      }, [], "A reference to an external document.")

      # Represents a group of controls within a profile/.rb file
      CONTROL_GROUP = SchemaType.new("Control Group", {
        "type" => "object",
        "additionalProperties" => true,
        "required" => %w{id controls},
        "properties" => {
          "id" => desc(STRING, "The unique identifier for the group.  Example: the relative path to the file specifying the controls."),
          "title" => desc({ type: %w{string null} }, "The title of the group - should be human readable."), # NOTE: pretty unique type like this - wouldn't it be better to have it be a STRING and then continue to not make it required?
          "controls" => desc(array(STRING), "The set of controls as specified by their ids in this group.  Example: 'V-75443'."),
        },
      }, [], "Descriptions for controls in a group, such as the list of all the controls.")

      # Occurs from "inspec exec --reporter json" and "inspec json"
      # Represents a platfrom or group of platforms that this profile supports
      SUPPORT = SchemaType.new("Supported Platform", {
        "type" => "object",
        "additionalProperties" => true, # NOTE: This should really be false, and inspec should validate profiles to ensure people don't make dumb mistakes like platform_family
        "required" => [],
        "properties" => {
          "platform-family" => desc(STRING, "The platform family.  Example: 'redhat'."),
          "platform-name" => desc(STRING, "The platform name - can include wildcards.  Example: 'debian'."),
          "platform" => desc(STRING, "The location of the platform.  Can be: 'os', 'aws', 'azure', or 'gcp'."), # NOTE: enum?
          "release" => desc(STRING, "The release of the platform.  Example: '20.04' for 'ubuntu'."),
          # os-* supports are being deprecated
          "os-family" => desc(STRING, "Deprecated in favor of platform-family."),
          "os-name" => desc(STRING, "Deprecated in favor of platform-name."),
        },
      }, [], "A supported platform target.  Example: the platform name being 'ubuntu'.")

    end
  end
end
