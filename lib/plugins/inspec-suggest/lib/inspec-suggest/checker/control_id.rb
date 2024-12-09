require_relative "base"

module InspecPlugins::Suggest
  class Checker::Check
    class ControlID < Base
      name "control-id"

      def run(file)
        # There should be exactly one control
        if file[:as_json]["controls"].length == 0
          file[:errors] << "No controls detected in the file."
          return false
        end
        unless file[:as_json]["controls"].length == 1
          file[:errors] << "Too many controls detected in the file - should be exactly 1"
          return false
        end

        control_id = file[:as_json]["controls"][0]["id"]

        # It should have a name that ends in a semver version number
        unless control_id.match(/v\d+\.\d+\.\d+$/)
          file[:errors] << "Control ID '#{control_id}' does not end in vN.N.N - should be a version"
          return false
        end

        # Its name should match the profile name
        profile_dir_name = File.basename(File.dirname(File.dirname(file[:rel_path])))
        unless profile_dir_name == control_id
          file[:errors] << "Control ID '#{control_id}' does not match profile dir name '#{profile_dir_name}'"
          return false
        end

        true
      end
    end
  end
end
