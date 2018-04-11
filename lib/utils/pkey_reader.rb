module PkeyReader
  def read_pkey(filecontent, passphrase)
    raise_if_default(passphrase)

    OpenSSL::PKey.read(filecontent, passphrase)
  rescue OpenSSL::PKey::PKeyError
    raise Inspec::Exceptions::ResourceFailed, 'passphrase error'
  end

  def raise_if_default(passphrase)
    if passphrase.is_a? Inspec::Attribute::DEFAULT_ATTRIBUTE
      raise Inspec::Exceptions::ResourceFailed, 'Please provide default value for attribute'
    end
  end
end
