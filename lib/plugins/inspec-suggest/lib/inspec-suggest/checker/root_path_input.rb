require_relative "base"

module InspecPlugins::Suggest
  class Checker::Check
    class RootPathInput < Base
      name "root-path-input"

      def run(file)
        # There should be at least one input and its name should be root_path
        root_path_input = file[:as_json]["inputs"].detect { |i| i["name"] == "root_path" }
        unless root_path_input
          file[:warnings] << "Missing root_path input"
          return true
        end

        # Its default value should be "/"
        unless root_path_input.dig("options", "value") == "/"
          file[:warnings] << "root_path input default value should be '/'"
          return true
        end

        true
      end
    end
  end
end
