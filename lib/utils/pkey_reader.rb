module PkeyReader
  def read_pkey(filecontent, passphrase)
    default_attribute?(passphrase)
    begin
      key = OpenSSL::PKey.read(filecontent, passphrase)
    rescue OpenSSL::PKey::PKeyError
      raise Inspec::Exceptions::ResourceFailed, 'passphrase Error'
    end
    key
  end

  def default_attribute?(passphrase)
    if passphrase.is_a? Inspec::Attribute::DEFAULT_ATTRIBUTE
      raise Inspec::Exceptions::ResourceFailed, 'Please provide default value for attribute'
    end
  end
end
