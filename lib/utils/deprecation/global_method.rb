require 'utils/deprecation/deprecator'

module Inspec
  def self.deprecate(group, msg, opts = {})
    deprecator = opts.delete(:deprecator) || Inspec::Deprecation::Deprecator.new
    deprecator.handle_deprecation(group, msg, opts)
  end
end
