=begin
Copyright © 2010 Dan Wanek <dan.wanek@gmail.com>

Licensed under the MIT License: http://www.opensource.org/licenses/mit-license.php
=end
module GSSAPI
  class GssApiError < StandardError

    include LibGSSAPI

    def message; to_s + ": " + @s; end

    def initialize(maj_stat = nil, min_stat = nil)

      # If raised as class (raise GssApiError, "msg) the error message is given
      # as the first parameter.
      if maj_stat.class == String
        @s = maj_stat
        return super maj_stat
      end

      if(maj_stat.nil? && min_stat.nil?)
        @s = '(no error info)'
      else
        min = FFI::MemoryPointer.new :OM_uint32
        message_context = FFI::MemoryPointer.new :OM_uint32
        @s = ''
        oid = GssOID.gss_c_no_oid
        min_stat = min_stat.read_uint32
        [[maj_stat, GSS_C_GSS_CODE], [min_stat, GSS_C_MECH_CODE]].each do |m, t|
          message_context.write_int 0
          begin
            out_buff = ManagedGssBufferDesc.new
            maj = gss_display_status(min, m, t, oid, message_context, out_buff.pointer)
            if (maj != 0)
              @s += "failed to retrieve GSSAPI display for status #{m}"
              @s += " of major status #{maj_stat}, minor_status #{min_stat}\n"
              @s += "(with major status #{maj}, minor status #{min.read_uint32}\n"
              break
            end
            @s += out_buff.value.to_s + "\n"
          end while message_context.read_int != 0
        end
      end

      # We need to call this so we can pass the message to the Error when we have no arguments
      super()
    end
  end
end
