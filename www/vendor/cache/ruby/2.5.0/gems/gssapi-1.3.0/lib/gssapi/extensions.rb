=begin
Copyright © 2014 Dan Wanek <dan.wanek@gmail.com>

Licensed under the MIT License: http://www.opensource.org/licenses/mit-license.php
=end
module GSSAPI
  module LibGSSAPI

    # Some versions of GSSAPI might not have support for IOV yet.
    begin
      # OM_uint32 GSSAPI_LIB_FUNCTION gss_wrap_iov( OM_uint32 * minor_status, gss_ctx_id_t  context_handle,
      #   int conf_req_flag, gss_qop_t  qop_req, int *  conf_state, gss_iov_buffer_desc *  iov, int  iov_count );
      attach_function :gss_wrap_iov, [:pointer, :pointer, :int, :OM_uint32, :pointer, :pointer, :int], :OM_uint32

      # OM_uint32 GSSAPI_LIB_FUNCTION gss_unwrap_iov ( OM_uint32 * minor_status, gss_ctx_id_t context_handle,
      #   int * conf_state, gss_qop_t * qop_state, gss_iov_buffer_desc * iov, int iov_count )
      attach_function :gss_unwrap_iov, [:pointer, :pointer, :pointer, :pointer, :pointer, :int], :OM_uint32

      # OM_uint32 GSSAPI_LIB_CALL gss_wrap_iov_length ( OM_uint32 * minor_status, gss_ctx_id_t context_handle,
      #   int conf_req_flag, gss_qop_t  qop_req, int *  conf_state, gss_iov_buffer_desc * iov, int iov_count)
      attach_function :gss_wrap_iov_length, [:pointer, :pointer, :int, :OM_uint32, :pointer, :pointer, :int], :OM_uint32
    rescue FFI::NotFoundError => ex
      warn "WARNING: Could not load IOV methods. Check your GSSAPI C library for an update"
    end

    begin
      # OM_uint32 gss_wrap_aead(OM_uint32 * minor_status, gss_ctx_id_t context_handle, int conf_req_flag,
      #   gss_qop_t qop_req, gss_buffer_t input_assoc_buffer,
      #   gss_buffer_t input_payload_buffer, int * conf_state, gss_buffer_t output_message_buffer);
      attach_function :gss_wrap_aead, [:pointer, :pointer, :int, :OM_uint32, :pointer, :pointer, :pointer, :pointer], :OM_uint32

      # OM_uint32 gss_unwrap_aead(OM_uint32 * minor_status, gss_ctx_id_t context_handle, gss_buffer_t input_message_buffer,
      #   gss_buffer_t input_assoc_buffer, gss_buffer_t output_payload_buffer, int * conf_state, gss_qop_t * qop_state);
      attach_function :gss_unwrap_aead, [:pointer,:pointer,:pointer,:pointer,:pointer,:pointer,:pointer], :OM_uint32
    rescue FFI::NotFoundError => ex
      warn "WARNING: Could not load AEAD methods. Check your GSSAPI C library for an update"
    end

  end
end
