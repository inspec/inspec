module InspecPlugins
  module MeaningOfLife
    class CliCommand < Inspec.plugin(2, :cli_command)

      # CLI test example
      def invoke(cli_opts = {})
        # exit immediately with code 42
        exit 42
      end
    end

  end
end