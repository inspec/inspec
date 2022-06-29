require_relative "base"

module InspecPlugins::Suggest
  class Checker::Check
    class TrailingNewline < Base
      name "trailing-newline"

      def run(file)
        content = File.read(file[:full_path])

        unless content.match? /\n$/m
          file[:warnings] << "The file is missing a trailing newline."
        end
        true
      end
    end
  end
end
