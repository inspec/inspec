module InspecPlugins::Parallelism
  class ListReporter < Inspec.plugin(2, :streaming_reporter)
    class ResourceFormatter

      class Base

        @@formatter_class_by_name = {}

        def self.list_formatter_name(name)
          @@formatter_class_by_name[name] = self
        end

        def self.formatter_for(name, opts)
          @@formatter_class_by_name[name].new(opts)
        end

        attr_reader :raw_parameters, :raw_query
        def initialize(opts)
          @raw_parameters = opts[:parameters]
          @raw_query = opts[:query]
          interpret_parameters!
        end
      end

      # TODO: figure out a way to move this logic into inspec-aws
      class AwsEcrImages < Base

        list_formatter_name "aws_ecr_images"

        attr_reader :repository_name
        def interpret_parameters!
          @raw_parameters = "{#{raw_parameters}}" unless raw_parameters.match?(/^\{.+\}$/)
          cooked_params = eval raw_parameters # rubocop:disable Security/Eval
          # Should include respository name
          # TODO - handle errors here?
          @repository_name = cooked_params[:repository_name]
        end

        def format_id_for_list(raw_id)
          # Trim off sha256: prefix
          id = raw_id.sub("sha256:", "")
          "ecr-image://#{repository_name}/#{id}"
        end
      end
    end
  end
end
