require "middleman-core"
require "middleman-syntax/version"

::Middleman::Extensions.register(:syntax) do
  require "middleman-syntax/extension"
  ::Middleman::Syntax::SyntaxExtension
end
