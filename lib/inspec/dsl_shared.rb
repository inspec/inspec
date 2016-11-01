# encoding: utf-8
module Inspec
  #
  # Contains methods we would like in multiple DSL
  #
  module DSL
    module RequireOverride
      # Save the toplevel require method to load all ruby dependencies.
      # It is used whenever the `require 'lib'` is not in libraries.
      alias __ruby_require require

      def require(path)
        rbpath = path + '.rb'
        return __ruby_require(path) if !@require_loader.exists?(rbpath)
        return false if @require_loader.loaded?(rbpath)

        # This is equivalent to calling `require 'lib'` with lib on disk.
        # We cannot rely on libraries residing on disk however.
        # TODO: Sandboxing.
        content, path, line = @require_loader.load(rbpath)
        eval(content, TOPLEVEL_BINDING, path, line) # rubocop:disable Lint/Eval
      end
    end
  end
end
