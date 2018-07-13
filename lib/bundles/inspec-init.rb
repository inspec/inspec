# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

module Init
  autoload :Profile, 'inspec-init/profile'
end

require 'inspec-init/cli'
