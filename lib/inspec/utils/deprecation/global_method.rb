require 'inspec/utils/deprecation/deprecator'

module Inspec
  def self.deprecate(group, msg = '', opts = {})
    config_io = opts.delete(:config_io)
    deprecator = Inspec::Deprecation::Deprecator.new(config_io: config_io)
    deprecator.handle_deprecation(group, msg, opts)
  end
end
