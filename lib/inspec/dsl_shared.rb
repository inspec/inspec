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
        rbpath = path + ".rb"
        return __ruby_require(path) unless @require_loader.exists?(rbpath)
        return false if @require_loader.loaded?(rbpath)

        # This is equivalent to calling `require 'lib'` with lib on disk.
        # We cannot rely on libraries residing on disk however.
        # TODO: Sandboxing.
        content, path, line = @require_loader.load(rbpath)

        # If we are in the realm of libraries and the LibraryEvalContext
        # we should have access to the __inspec_binding, which is a Binding
        # context that provides the correct plane to evaluate all required files to.
        # It will ensure that embedded calls to `require` still call this
        # method and get loaded from their correct paths.
        return __inspec_binding.eval(content, path, line) if defined?(__inspec_binding)

        eval(content, TOPLEVEL_BINDING, path, line) # rubocop:disable Security/Eval
      end
    end
  end
end
