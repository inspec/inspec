module InspecPlugins
  module MeaningOfLife
    class Cli < Inspec.plugin(2, :cli)

      # Do cli-ish things
      def execute(opts)
        puts 'The answer to life, the universe, and everything:'
        puts '42'
      end
    end

  end
end