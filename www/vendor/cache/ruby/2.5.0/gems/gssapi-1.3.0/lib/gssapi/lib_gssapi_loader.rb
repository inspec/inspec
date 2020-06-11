=begin
Copyright © 2010 Dan Wanek <dan.wanek@gmail.com>

Licensed under the MIT License: http://www.opensource.org/licenses/mit-license.php
=end
module GSSAPI
  module LibGSSAPI

    class GssOID < FFI::Struct
      layout  :length, :OM_uint32,
        :elements, :pointer # pointer of :void

      def self.gss_c_no_oid
        self.new(GSSAPI::LibGSSAPI::GSS_C_NO_OID)
      end
    end


    def self.load_mit
      host_os = RbConfig::CONFIG['host_os']
      case host_os
      when /linux/
        gssapi_lib = 'libgssapi_krb5.so.2'
        ffi_lib gssapi_lib, FFI::Library::LIBC
      when /darwin/
        gssapi_lib = '/usr/lib/libgssapi_krb5.dylib'
        ffi_lib gssapi_lib, FFI::Library::LIBC
      when /mswin|mingw32|windows/
        # Pull the gssapi32 path from the environment if it exist, otherwise use the default in Program Files
        gssapi32_path = ENV['gssapi32'] ? ENV['gssapi32'] : 'C:\Program Files (x86)\MIT\Kerberos\bin\gssapi32.dll'
        ffi_lib gssapi32_path, FFI::Library::LIBC  # Required the MIT Kerberos libraries to be installed
        ffi_convention :stdcall
      when /solaris/
        ffi_lib 'libgss.so', 'mech_krb5.so', FFI::Library::LIBC
      else
        raise LoadError, "This host OS (#{host_os}) is not supported by ruby gssapi and the MIT libraries."
      end

      # -------------------- MIT Specifics --------------------
      attach_variable :__GSS_C_NT_HOSTBASED_SERVICE, :GSS_C_NT_HOSTBASED_SERVICE, :pointer # type gss_OID
      attach_variable :__GSS_C_NT_EXPORT_NAME, :GSS_C_NT_EXPORT_NAME, :pointer # type gss_OID
      LibGSSAPI.const_set("GSS_C_NT_HOSTBASED_SERVICE", __GSS_C_NT_HOSTBASED_SERVICE)
      LibGSSAPI.const_set("GSS_C_NT_EXPORT_NAME", __GSS_C_NT_EXPORT_NAME)
    end

    def self.load_heimdal
      host_os = RbConfig::CONFIG['host_os']
      case host_os
      when /linux/
        gssapi_lib = 'libgssapi.so.3'
      when /darwin/
        # use Heimdal Kerberos since Mac MIT Kerberos is OLD. Do a "require 'gssapi/heimdal'" first
        gssapi_lib = '/usr/heimdal/lib/libgssapi.dylib'
      else
        raise LoadError, "This host OS (#{host_os}) is not supported by ruby gssapi and the Heimdal libraries."
      end
      ffi_lib gssapi_lib, FFI::Library::LIBC

      # ------------------ Heimdal Specifics ------------------
      attach_variable :__gss_c_nt_hostbased_service_oid_desc, GssOID
      attach_variable :__gss_c_nt_export_name_oid_desc, GssOID
      LibGSSAPI.const_set("GSS_C_NT_HOSTBASED_SERVICE", FFI::Pointer.new(__gss_c_nt_hostbased_service_oid_desc.to_ptr))
      LibGSSAPI.const_set("GSS_C_NT_EXPORT_NAME", FFI::Pointer.new(__gss_c_nt_export_name_oid_desc.to_ptr))
    end

    # Heimdal supported the *_iov functions before MIT did so in some OS distributions if
    # you need IOV support and MIT does not provide it try the Heimdal libs and then
    # before doing a "require 'gssapi'" do a "require 'gssapi/heimdal'" and that will attempt
    # to load the Heimdal libs
    case GSSAPI_LIB_TYPE
    when :mit
      load_mit
    when :heimdal
      load_heimdal
    else
      raise LoadError, "Unexpected Lib type: #{GSSAPI_LIB_TYPE}"
    end

  end
end
