require 'middleman-core'
require_relative 'middleman-autoprefixer/version'

::Middleman::Extensions.register(:autoprefixer) do
  require_relative 'middleman-autoprefixer/extension'
  ::Middleman::Autoprefixer::Extension
end
