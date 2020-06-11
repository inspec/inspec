module GssIOVHelpers

  def iov_encrypt(str)
    iov_cnt = 3
    iov = FFI::MemoryPointer.new(GSSAPI::LibGSSAPI::GssIOVBufferDesc.size * iov_cnt)

    iov0 = GSSAPI::LibGSSAPI::GssIOVBufferDesc.new(FFI::Pointer.new(iov.address))
    iov0[:type] = (GSSAPI::LibGSSAPI::GSS_IOV_BUFFER_TYPE_HEADER | GSSAPI::LibGSSAPI::GSS_IOV_BUFFER_FLAG_ALLOCATE)

    iov1 = GSSAPI::LibGSSAPI::GssIOVBufferDesc.new(FFI::Pointer.new(iov.address + (GSSAPI::LibGSSAPI::GssIOVBufferDesc.size * 1)))
    iov1[:type] =  (GSSAPI::LibGSSAPI::GSS_IOV_BUFFER_TYPE_DATA)
    iov1[:buffer].value = str

    iov2 = GSSAPI::LibGSSAPI::GssIOVBufferDesc.new(FFI::Pointer.new(iov.address + (GSSAPI::LibGSSAPI::GssIOVBufferDesc.size * 2)))
    iov2[:type] = (GSSAPI::LibGSSAPI::GSS_IOV_BUFFER_TYPE_PADDING | GSSAPI::LibGSSAPI::GSS_IOV_BUFFER_FLAG_ALLOCATE)

    conf_state = FFI::MemoryPointer.new :uint32
    min_stat = FFI::MemoryPointer.new :uint32

    maj_stat = GSSAPI::LibGSSAPI.gss_wrap_iov(min_stat, @gss.context, 1, GSSAPI::LibGSSAPI::GSS_C_QOP_DEFAULT, conf_state, iov, iov_cnt)

    token = [iov0[:buffer].length].pack('L')
    token += iov0[:buffer].value
    token += iov1[:buffer].value
    pad_len = iov2[:buffer].length
    token += iov2[:buffer].value if pad_len > 0
    [pad_len, token]
  end

  # @return [String] the unencrypted response string
  def iov_decrypt(str)
    puts "Decrypting message:\n#{str}"
    iov_cnt = 3
    iov = FFI::MemoryPointer.new(GSSAPI::LibGSSAPI::GssIOVBufferDesc.size * iov_cnt)

    iov0 = GSSAPI::LibGSSAPI::GssIOVBufferDesc.new(FFI::Pointer.new(iov.address))
    iov0[:type] = (GSSAPI::LibGSSAPI::GSS_IOV_BUFFER_TYPE_HEADER | GSSAPI::LibGSSAPI::GSS_IOV_BUFFER_FLAG_ALLOCATE)

    iov1 = GSSAPI::LibGSSAPI::GssIOVBufferDesc.new(FFI::Pointer.new(iov.address + (GSSAPI::LibGSSAPI::GssIOVBufferDesc.size * 1)))
    iov1[:type] =  (GSSAPI::LibGSSAPI::GSS_IOV_BUFFER_TYPE_DATA)

    iov2 = GSSAPI::LibGSSAPI::GssIOVBufferDesc.new(FFI::Pointer.new(iov.address + (GSSAPI::LibGSSAPI::GssIOVBufferDesc.size * 2)))
    iov2[:type] =  (GSSAPI::LibGSSAPI::GSS_IOV_BUFFER_TYPE_DATA)

    str.force_encoding('BINARY')
    #str.sub!(/^.*Content-Type: application\/octet-stream\r\n(.*)--Encrypted.*$/m, '\1')

    len = str.unpack("L").first
    puts "LEN: #{len}"
    iov_data = str.unpack("La#{len}a*")
    iov0[:buffer].value = iov_data[1]
    iov1[:buffer].value = iov_data[2]

    min_stat = FFI::MemoryPointer.new :uint32
    conf_state = FFI::MemoryPointer.new :uint32
    conf_state.write_int(1)
    qop_state = FFI::MemoryPointer.new :uint32
    qop_state.write_int(0)

    puts "Unwrapping IOV...."
    maj_stat = GSSAPI::LibGSSAPI.gss_unwrap_iov(min_stat, @gss.context, conf_state, qop_state, iov, iov_cnt)
    puts "Done Unwrapping IOV...."
    if(maj_stat == 0)
      puts "Success!!!"
    else
      puts "GSSAPI Failure. Status Codes(major: #{maj_stat}, minor: #{min_stat.read_int})"
    end

    puts "???HELLO???"

    iov1[:buffer].value
  end

end
