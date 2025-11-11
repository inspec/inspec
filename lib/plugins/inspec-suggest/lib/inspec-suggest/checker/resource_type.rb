require_relative "base"

module InspecPlugins::Suggest
  class Checker::Check
    class ResourceType < Base
      name "resource-type"

      ALLOWED_RESOURCES = %w{
        file
        csv
        ini
        json
        yaml
        xml
      }.freeze

      def run(file)
        # This would be much easier if we were using RunData, which has the resource
        # type included; but since we are using the JSON export it does not. We have
        # to resort to regexing against the source code of the control. This can be
        # fooled.

        control_source = file[:as_json]["controls"][0]["code"]

        # Every time we see a describe, it must be followed either .one, or one of
        # the permitted resources.
        permitted_regex = Regexp.new("^(\.one)|(\s(" + ALLOWED_RESOURCES.join("|") + "))")

        strings_following_describe = control_source.split("describe")
        # Drop any string preceding the first describe.
        strings_following_describe.shift

        strings_following_describe.each do |str|
          unless str.match? permitted_regex
            file[:warnings] << "Possible use of a disallowed resource near 'describe#{str}'"
            # Don't return, keep searching
          end
        end

        true
      end
    end
  end
end
