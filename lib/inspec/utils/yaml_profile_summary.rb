# frozen_string_literal: true

module Inspec
  module Utils
    #
    # Inspec::Utils::YamlProfileSummary takes in certain information to identify a
    # profile and then produces a YAML-formatted summary of that profile. It can
    # return the results to STDOUT or a file.
    #
    #
    module YamlProfileSummary
      def self.produce_yaml(info:, write_path: "", suppress_output: false)
        # add in inspec version
        info[:generator] = {
          name: "inspec",
          version: Inspec::VERSION,
        }
        if write_path.empty?
          puts info.to_yaml
        else
          unless suppress_output
            if File.exist? write_path
              Inspec::Log.info "----> updating #{write_path}"
            else
              Inspec::Log.info "----> creating #{write_path}"
            end
          end
          full_write_path = File.expand_path(write_path)
          File.write(full_write_path, info.to_yaml)
        end
      end
    end
  end
end
