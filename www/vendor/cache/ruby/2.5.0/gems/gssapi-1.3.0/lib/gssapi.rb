=begin
Copyright © 2010 Dan Wanek <dan.wanek@gmail.com>

Licensed under the MIT License: http://www.opensource.org/licenses/mit-license.php
=end
require 'ffi'
module GSSAPI
  module LibGSSAPI
    extend FFI::Library
    FFI::add_typedef(:uint32, :OM_uint32)

    GSSAPI_LIB_TYPE = :mit unless defined?(GSSAPI_LIB_TYPE)
  end
end

require 'gssapi/exceptions'
require 'gssapi/lib_gssapi'
require 'gssapi/simple'
