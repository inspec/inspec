require 'middleman-core'

Middleman::Extensions.register(:sprockets) do
  require 'middleman-sprockets/extension'
  Middleman::Sprockets::Extension
end
