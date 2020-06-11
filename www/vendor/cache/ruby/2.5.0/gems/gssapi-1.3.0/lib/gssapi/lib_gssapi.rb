=begin
Copyright © 2010 Dan Wanek <dan.wanek@gmail.com>

Licensed under the MIT License: http://www.opensource.org/licenses/mit-license.php
=end
require 'gssapi/lib_gssapi_loader'
module GSSAPI
  module LibGSSAPI

    # Libc functions

    # void *malloc(size_t size);
    attach_function :malloc, [:size_t], :pointer

    # void *memcpy(void *dest, const void *src, size_t n);
    attach_function :memcpy, [:pointer, :pointer, :size_t], :pointer

    # This is a generic Managed Struct subclass that hides the [] methods.
    # Classes that implement this class should provide accessor methods to get to the attributes.
    class GssMStruct < FFI::ManagedStruct
      private

      def [](key)
        super(key)
      end

      def []=(key,val)
        super(key,val)
      end
    end

    # This is a generic Unmanaged Struct subclass that hides the [] methods.
    # Classes that implement this class should provide accessor methods to get to the attributes.
    class GssUMStruct < FFI::Struct
      private

      def [](key)
        super(key)
      end

      def []=(key,val)
        super(key,val)
      end
    end

    # This module provides a layout for both the managed and unmanaged GssBufferDesc structs.
    module GssBufferDescLayout
      def self.included(base)
        base.class_eval do
          layout :length, :OM_uint32,
            :value, :pointer # pointer of :void

          def length
            self[:length]
          end

          def value
            if(self[:length] == 0)
              nil
            else
              self[:value].read_string(self[:length])
            end
          end
        end
      end
    end

    # This class implements the gss_buffer_desc type.  Use #pointer to emulate gss_buffer_t
    # If you are setting the value of the buffer and it is not being set from the function
    # this is the type of buffer you should use. If the buffer is being allocated and set
    # inside the function you should use a ManagedGssBufferDesc instead so gss_release_buffer
    # is called for it. It states in the manpage for each gss function whether or not
    # gss_release_buffer needs to be called or not.
    # @example
    #   buff = UnManagedGssBufferDesc.new
    #   buff.value = "This is a test"
    class UnManagedGssBufferDesc < GssUMStruct
      include GssBufferDescLayout
      def initialize(ptr = nil)
        if(ptr.nil?)
          super(FFI::Pointer.new(FFI::MemoryPointer.new(self.size)))
        else
          super(ptr)
        end
      end

      # Set the value of the string for the "value" parameter.  This method also
      #   appropriately sets the length parameter.
      def value=(val)
        if(val.nil?)
          self[:length] = 0
          self[:value] = val
        elsif(val.is_a?(String))
          buff = FFI::MemoryPointer.from_string(val)
          self[:length] = val.length
          self[:value] = buff
        elsif(val.is_a?(Fixnum))
          buff = FFI::MemoryPointer.new :OM_uint32
          buff.write_int val
          self[:length] = FFI::type_size :OM_uint32
          self[:value] = buff
        else
          raise StandardError, "Can't handle type #{val.class.name}"
        end
      end
    end

    # This class implements the gss_buffer_desc type.  Use #pointer to emulate gss_buffer_t
    # Only functions that need to call gss_release_buffer should use this type. It states
    # in the manpage for each function whether or not it should be called. If it does not
    # you should be using UnManagedGssBufferDesc instead.
    class ManagedGssBufferDesc < GssMStruct
      include GssBufferDescLayout
      def initialize(ptr = nil)
        if(ptr.nil?)
          super(FFI::Pointer.new(FFI::MemoryPointer.new(self.size)))
        else
          super(ptr)
        end
      end

      def self.release(ptr)
        puts "Releasing ManagedGssBufferDesc at #{ptr.address.to_s(16)}" if $DEBUG
        min_stat = FFI::MemoryPointer.new :OM_uint32
        maj_stat = LibGSSAPI.gss_release_buffer(min_stat, ptr)
      end
    end

    # @example
    #   iov_buff = GssIOVBufferDesc.new
    #   str = FFI::MemoryPointer.from_string("This is the string")
    #   iov_buff[:type] = 1
    #   iov_buff[:buffer][:length] = str.size
    #   iov_buff[:buffer][:value] = str
    class GssIOVBufferDesc < FFI::Struct
      layout :type, :OM_uint32,
        :buffer, UnManagedGssBufferDesc
    end

    class GssChannelBindingsStruct < FFI::Struct
      layout :initiator_addrtype, :OM_uint32,
        :initiator_address, UnManagedGssBufferDesc,
        :acceptor_addrtype, :OM_uint32,
        :acceptor_address, UnManagedGssBufferDesc,
        :application_data, UnManagedGssBufferDesc

      no_chn_bind = FFI::MemoryPointer.new :pointer  #
      no_chn_bind.write_int 0
    end

    # This s a generic AutoPointer.  Gss pointers that implement this class should also implement a
    #   class method called release_ptr that releases the structure pointed to by this pointer.
    class GssPointer < FFI::AutoPointer
      def address_of
        ptr_p = FFI::MemoryPointer.new :pointer
        ptr_p.write_pointer(self)
      end

      def self.release(ptr)
        if( ptr.address == 0 )
          puts "Releasing #{self.name} NULL POINTER: Not freeing" if $DEBUG
          return
        else
          puts "Releasing #{self.name} at #{ptr.address.to_s(16)}" if $DEBUG
          self.release_ptr(ptr)
        end
      end
    end

    # A wrapper around gss_name_t so that it garbage collects
    class GssNameT < GssPointer
      def self.release_ptr(name_ptr)
        puts "Releasing gss_name_t at #{name_ptr.address.to_s(16)}" if $DEBUG
        min_stat = FFI::MemoryPointer.new :OM_uint32
        maj_stat = LibGSSAPI.gss_release_name(min_stat, name_ptr)
      end
    end

    class GssCtxIdT < GssPointer
      def self.release_ptr(context_ptr)
        min_stat = FFI::MemoryPointer.new :OM_uint32
        maj_stat = LibGSSAPI.gss_delete_sec_context(min_stat, context_ptr, LibGSSAPI::GSS_C_NO_BUFFER)
      end

      def self.gss_c_no_context
        self.new(GSSAPI::LibGSSAPI::GSS_C_NO_CONTEXT)
      end
    end

    # gss_cred_id_t
    class GssCredIdT < GssPointer
      def self.release_ptr(cred_ptr)
        puts "Releasing gss_cred_id_t at #{cred_ptr.address.to_s(16)}" if $DEBUG
        min_stat = FFI::MemoryPointer.new :OM_uint32
        maj_stat = LibGSSAPI.gss_release_cred(min_stat, cred_ptr)
      end
    end


    # OM_uint32 gss_release_buffer(OM_uint32 * minor_status, gss_buffer_t buffer);

    # Function definitions
    # --------------------

    # OM_uint32 gss_import_name(OM_uint32 * minor_status, const gss_buffer_t input_name_buffer, const gss_OID input_name_type, gss_name_t * output_name);
    # @example:
    #   host_str = 'host@example.com'
    #   buff_str = GSSAPI::LibGSSAPI::UnManagedGssBufferDesc.new
    #   buff_str[:length] = host_str.length
    #   buff_str[:value] = FFI::MemoryPointer.from_string(host_str)
    #   name = FFI::MemoryPointer.new :pointer # gss_name_t
    #   min_stat = FFI::MemoryPointer.new :OM_uint32
    #   maj_stat = GSSAPI::LibGSSAPI.gss_import_name(min_stat, buff_str.pointer, GSSAPI::LibGSSAPI.GSS_C_NT_HOSTBASED_SERVICE, name)
    #   name = name.get_pointer(0)
    # Remember to free the allocated name (gss_name_t) space with gss_release_name
    attach_function :gss_import_name, [:pointer, :pointer, :pointer, :pointer], :OM_uint32

    # OM_uint32 gss_export_name(OM_uint32 * minor_status, const gss_name_t input_name, gss_buffer_t exported_name);
    attach_function :gss_export_name, [:pointer, :pointer, :pointer], :OM_uint32

    # OM_uint32 gss_canonicalize_name(OM_uint32 * minor_status, const gss_name_t input_name, const gss_OID mech_type, gss_name_t * output_name)
    attach_function :gss_canonicalize_name, [:pointer, :pointer, :pointer, :pointer], :OM_uint32

    begin
      # OM_uint32 gss_oid_to_str(OM_uint32 *minor_status, const gss_OID oid, gss_buffer_t oid_str);
      # @example:
      #   min_stat = FFI::MemoryPointer.new :OM_uint32
      #   oidstr = GSSAPI::LibGSSAPI::ManagedGssBufferDesc.new
      #   maj_stat = GSSAPI::LibGSSAPI.gss_oid_to_str(min_stat, GSSAPI::LibGSSAPI.GSS_C_NT_HOSTBASED_SERVICE, oidstr.pointer)
      #   oidstr[:value].read_string
      attach_function :gss_oid_to_str, [:pointer, :pointer, :pointer], :OM_uint32

      # OM_uint32 gss_str_to_oid(OM_uint32 *minor_status, const gss_buffer_t oid_str, gss_OID *oid);
      # @example: Simulate GSS_C_NT_HOSTBASED_SERVICE
      #   min_stat = FFI::MemoryPointer.new :OM_uint32
      #   str = "{ 1 2 840 113554 1 2 1 4 }"
      #   oidstr = GSSAPI::LibGSSAPI::UnManagedGssBufferDesc.new
      #   oidstr[:length] = str.length
      #   oidstr[:value] = FFI::MemoryPointer.from_string str
      #   oid = FFI::MemoryPointer.new :pointer
      #   min_stat = FFI::MemoryPointer.new :OM_uint32
      #   maj_stat = GSSAPI::LibGSSAPI.gss_str_to_oid(min_stat, oidstr.pointer, oid)
      #   oid = GSSAPI::LibGSSAPI::GssOID.new(oid.get_pointer(0))
      attach_function :gss_str_to_oid, [:pointer, :pointer, :pointer], :OM_uint32
    rescue FFI::NotFoundError => ex
      warn "WARNING: Could not load OID conversion methods. Check your GSSAPI C library for an update"
    end

    # OM_uint32  gss_init_sec_context(OM_uint32  *  minor_status, const gss_cred_id_t initiator_cred_handle,
    #   gss_ctx_id_t * context_handle, const gss_name_t target_name, const gss_OID mech_type, OM_uint32 req_flags,
    #   OM_uint32 time_req, const gss_channel_bindings_t input_chan_bindings, const gss_buffer_t input_token,
    #   gss_OID * actual_mech_type, gss_buffer_t output_token, OM_uint32 * ret_flags, OM_uint32 * time_rec);
    attach_function :gss_init_sec_context, [:pointer, :pointer, :pointer, :pointer, :pointer, :OM_uint32, :OM_uint32, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], :OM_uint32

    # OM_uint32 gss_accept_sec_context(OM_uint32 *minor_status, gss_ctx_id_t *context_handle, const gss_cred_id_t acceptor_cred_handle,
    #   const gss_buffer_t input_token_buffer, const gss_channel_bindings_t input_chan_bindings, gss_name_t *src_name, gss_OID *mech_type,
    #   gss_buffer_t output_token, OM_uint32 *ret_flags, OM_uint32 *time_rec, gss_cred_id_t *delegated_cred_handle);
    attach_function :gss_accept_sec_context, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer], :OM_uint32

    # OM_uint32 gss_display_name(OM_uint32 * minor_status, gss_name_t input_name, gss_buffer_t output_name_buffer, gss_OID * output_name_type);
    attach_function :gss_display_name, [:pointer, :pointer, :pointer, :pointer], :OM_uint32

    # OM_uint32 gss_acquire_cred(OM_uint32 *minor_status, const gss_name_t desired_name, OM_uint32 time_req, const gss_OID_set desired_mechs,
    #   gss_cred_usage_t cred_usage, gss_cred_id_t *output_cred_handle, gss_OID_set *actual_mechs, OM_uint32 *time_rec);
    attach_function :gss_acquire_cred, [:pointer, :pointer, :OM_uint32, :pointer, :OM_uint32, :pointer, :pointer, :pointer], :OM_uint32

    # OM_uint32  gss_wrap(OM_uint32  *  minor_status, const gss_ctx_id_t context_handle, int conf_req_flag,
    #   gss_qop_t qop_req, const gss_buffer_t input_message_buffer, int * conf_state, gss_buffer_t output_message_buffer);
    # @example:
    #   min_stat = FFI::MemoryPointer.new :OM_uint32
    # Remember to free the allocated output_message_buffer with gss_release_buffer
    attach_function :gss_wrap, [:pointer, :pointer, :int, :OM_uint32, :pointer, :pointer, :pointer], :OM_uint32

    # OM_uint32  gss_unwrap(OM_uint32  *  minor_status, const gss_ctx_id_t context_handle,
    #   const gss_buffer_t input_message_buffer, gss_buffer_t output_message_buffer, int * conf_state, gss_qop_t * qop_state);
    # @example:
    #   min_stat = FFI::MemoryPointer.new :OM_uint32
    # Remember to free the allocated output_message_buffer with gss_release_buffer
    attach_function :gss_unwrap, [:pointer, :pointer, :pointer, :pointer, :pointer, :pointer], :OM_uint32

    # OM_uint32 gss_get_mic(OM_uint32 * minor_status, const gss_ctx_id_t context_handle, gss_qop_t qop_req, const gss_buffer_t input_message_buffer, gss_buffer_t output_message_buffer)
    attach_function :gss_get_mic, [:pointer, :pointer, :OM_uint32, :pointer, :pointer], :OM_uint32

    # OM_uint32 gss_verify_mic (OM_uint32          *minor_status,const gss_ctx_id_t context_handle, const gss_buffer_t message_buffer,const gss_buffer_t token_buffer, gss_qop_t          qop_state)
    attach_function :gss_verify_mic, [:pointer, :pointer, :pointer, :pointer, :OM_uint32], :OM_uint32

    # OM_uint32 gss_delete_sec_context(OM_uint32 * minor_status, gss_ctx_id_t * context_handle, gss_buffer_t output_token);
    attach_function :gss_delete_sec_context, [:pointer, :pointer, :pointer], :OM_uint32

    # OM_uint32 gss_release_name(OM_uint32 * minor_status, gss_name_t * name);
    attach_function :gss_release_name, [:pointer, :pointer], :OM_uint32

    # OM_uint32 gss_release_buffer(OM_uint32 * minor_status, gss_buffer_t buffer);
    attach_function :gss_release_buffer, [:pointer, :pointer], :OM_uint32

    # OM_uint32 gss_release_cred(OM_uint32 *minor_status, gss_cred_id_t *cred_handle);
    attach_function :gss_release_cred, [:pointer, :pointer], :OM_uint32

    # Used to register alternate keytabs
    # OM_uint32 krb5_gss_register_acceptor_identity(const char *);
    attach_function :krb5_gss_register_acceptor_identity, [:string], :OM_uint32

    # OM_uint32 gss_display_status(OM_uint32 *minor_status, OM_uint32 status_value, int status_type, gss_OID mech_type, OM_uint32 *message_context, gss_buffer_t status_string)
    attach_function :gss_display_status, [:pointer, :OM_uint32, :int, :pointer, :pointer, :pointer], :OM_uint32

    # OM_uint32 gss_krb5_copy_ccache(OM_uint32 *minor_status, gss_cred_id_t cred_handle, krb5_ccache out_ccache)
    attach_function :gss_krb5_copy_ccache, [:pointer, :pointer, :pointer], :OM_uint32

    # Variable definitions
    # --------------------

    # Flag bits for context-level services.
    GSS_C_DELEG_FLAG        = 1
    GSS_C_MUTUAL_FLAG       = 2
    GSS_C_REPLAY_FLAG       = 4
    GSS_C_SEQUENCE_FLAG     = 8
    GSS_C_CONF_FLAG         = 16
    GSS_C_INTEG_FLAG        = 32
    GSS_C_ANON_FLAG         = 64
    GSS_C_PROT_READY_FLAG   = 128
    GSS_C_TRANS_FLAG        = 256
    GSS_C_DELEG_POLICY_FLAG = 32768


    # Credential usage options
    GSS_C_BOTH      = 0
    GSS_C_INITIATE  = 1
    GSS_C_ACCEPT    = 2

    # Misc Constants
    GSS_C_INDEFINITE = 0xffffffff # Expiration time of 2^32-1 seconds means infinite lifetime for sec or cred context

    # Message Offsets
    GSS_C_CALLING_ERROR_OFFSET = 24
    GSS_C_ROUTINE_ERROR_OFFSET = 16
    GSS_C_SUPPLEMENTARY_OFFSET = 0
    # GSS_C_CALLING_ERROR_MASK ((OM_uint32) 0377ul)
    # GSS_C_ROUTINE_ERROR_MASK ((OM_uint32) 0377ul)
    # GSS_C_SUPPLEMENTARY_MASK ((OM_uint32) 0177777ul)


    # QOP (Quality of Protection)
    GSS_C_QOP_DEFAULT       = 0


    # GSSAPI Status & Error Codes
    GSS_S_COMPLETE  = 0
    GSS_C_GSS_CODE  = 1
    GSS_C_MECH_CODE = 2

    GSS_C_CALLING_ERRORS = {
      (1 << GSS_C_CALLING_ERROR_OFFSET) => "GSS_S_CALL_INACCESSIBLE_READ",
      (2 << GSS_C_CALLING_ERROR_OFFSET) => "GSS_S_CALL_INACCESSIBLE_WRITE",
      (3 << GSS_C_CALLING_ERROR_OFFSET) => "GSS_S_CALL_BAD_STRUCTURE"
    }

    GSS_C_SUPPLEMENTARY_CODES = {
      (1 << (GSS_C_SUPPLEMENTARY_OFFSET + 0)) => "GSS_S_CONTINUE_NEEDED",
      (1 << (GSS_C_SUPPLEMENTARY_OFFSET + 1)) => "GSS_S_DUPLICATE_TOKEN",
      (1 << (GSS_C_SUPPLEMENTARY_OFFSET + 2)) => "GSS_S_OLD_TOKEN",
      (1 << (GSS_C_SUPPLEMENTARY_OFFSET + 3)) => "GSS_S_UNSEQ_TOKEN",
      (1 << (GSS_C_SUPPLEMENTARY_OFFSET + 4)) => "GSS_S_GAP_TOKEN"
    }

    GSS_C_ROUTINE_ERRORS = {
      (1 << GSS_C_ROUTINE_ERROR_OFFSET) => "GSS_S_BAD_MECH",
      (2 << GSS_C_ROUTINE_ERROR_OFFSET) => "GSS_S_BAD_NAME",
      (3 << GSS_C_ROUTINE_ERROR_OFFSET) => "GSS_S_BAD_NAMETYPE",
      (4 << GSS_C_ROUTINE_ERROR_OFFSET) => "GSS_S_BAD_BINDINGS",
      (5 << GSS_C_ROUTINE_ERROR_OFFSET) => "GSS_S_BAD_STATUS",
      (6 << GSS_C_ROUTINE_ERROR_OFFSET) => "GSS_S_BAD_SIG",
      (7 << GSS_C_ROUTINE_ERROR_OFFSET) => "GSS_S_NO_CRED",
      (8 << GSS_C_ROUTINE_ERROR_OFFSET) => "GSS_S_NO_CONTEXT",
      (9 << GSS_C_ROUTINE_ERROR_OFFSET) => "GSS_S_DEFECTIVE_TOKEN",
      (10 << GSS_C_ROUTINE_ERROR_OFFSET) => "GSS_S_DEFECTIVE_CREDENTIAL",
      (11 << GSS_C_ROUTINE_ERROR_OFFSET) => "GSS_S_CREDENTIALS_EXPIRED",
      (12 << GSS_C_ROUTINE_ERROR_OFFSET) => "GSS_S_CONTEXT_EXPIRED",
      (13 << GSS_C_ROUTINE_ERROR_OFFSET) => "GSS_S_FAILURE",
      (14 << GSS_C_ROUTINE_ERROR_OFFSET) => "GSS_S_BAD_QOP",
      (15 << GSS_C_ROUTINE_ERROR_OFFSET) => "GSS_S_UNAUTHORIZED",
      (16 << GSS_C_ROUTINE_ERROR_OFFSET) => "GSS_S_UNAVAILABLE",
      (17 << GSS_C_ROUTINE_ERROR_OFFSET) => "GSS_S_DUPLICATE_ELEMENT",
      (18 << GSS_C_ROUTINE_ERROR_OFFSET) => "GSS_S_NAME_NOT_MN"
    }


    # IOV Buffer Types (gssapi_ext.h)
    GSS_IOV_BUFFER_TYPE_EMPTY       = 0
    GSS_IOV_BUFFER_TYPE_DATA        = 1 # Packet data
    GSS_IOV_BUFFER_TYPE_HEADER      = 2 # Mechanism header
    GSS_IOV_BUFFER_TYPE_MECH_PARAMS = 3 # Mechanism specific parameters
    GSS_IOV_BUFFER_TYPE_TRAILER     = 7 # Mechanism trailer
    GSS_IOV_BUFFER_TYPE_PADDING     = 9  # Padding
    GSS_IOV_BUFFER_TYPE_STREAM      = 10 # Complete wrap token
    GSS_IOV_BUFFER_TYPE_SIGN_ONLY   = 11 # Sign only packet data
    # Flags
    GSS_IOV_BUFFER_FLAG_MASK        = 0xFFFF0000
    GSS_IOV_BUFFER_FLAG_ALLOCATE    = 0x00010000 # indicates GSS should allocate
    GSS_IOV_BUFFER_FLAG_ALLOCATED   = 0x00020000 # indicates caller should free



    # Various Null values. (gssapi.h)
    GSS_C_NO_NAME           = FFI::Pointer.new(:pointer, 0) # ((gss_name_t) 0)
    GSS_C_NO_BUFFER         = FFI::Pointer.new(:pointer, 0) # ((gss_buffer_t) 0)
    GSS_C_NO_OID            = FFI::Pointer.new(:pointer, 0) # ((gss_OID) 0)
    GSS_C_NO_OID_SET        = FFI::Pointer.new(:pointer, 0) # ((gss_OID_set) 0)
    GSS_C_NO_CONTEXT        = FFI::Pointer.new(:pointer, 0) # ((gss_ctx_id_t) 0)
    GSS_C_NO_CREDENTIAL     = FFI::Pointer.new(:pointer, 0) # ((gss_cred_id_t) 0)
    GSS_C_NO_CHANNEL_BINDINGS = FFI::Pointer.new(:pointer, 0) # ((gss_channel_bindings_t) 0)
    GSS_C_EMPTY_BUFFER      = ManagedGssBufferDesc.new

  end #end LibGSSAPI
end #end GSSAPI
