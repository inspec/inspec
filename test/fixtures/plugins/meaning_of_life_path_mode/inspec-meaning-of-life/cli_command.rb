module InspecPlugins
  module MeaningOfLife
    class CliCommand < Inspec.plugin(2, :cli_command)
      # Need to tell my superclass about my group description
      subcommand_desc "meaningoflife answer", "Get answers once and for all."

      # CLI test example
      desc "answer", "Exits immediately with an exit code reflecting the answer to life the universe, and everything."
      def answer
        # exit immediately with code 42
        exit 42
      end

    end
  end
end
