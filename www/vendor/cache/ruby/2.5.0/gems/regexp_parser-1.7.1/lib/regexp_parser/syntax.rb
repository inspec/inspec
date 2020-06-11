require File.expand_path('../syntax/tokens', __FILE__)
require File.expand_path('../syntax/base', __FILE__)
require File.expand_path('../syntax/any', __FILE__)
require File.expand_path('../syntax/version_lookup', __FILE__)
require File.expand_path('../syntax/versions', __FILE__)

module Regexp::Syntax
  class SyntaxError < StandardError; end
end
