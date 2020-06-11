module LicenseAcceptance
  class Product

    attr_reader :id, :pretty_name, :filename, :mixlib_name, :license_required_version

    def initialize(id, pretty_name, filename, mixlib_name, license_required_version)
      # id is the internal representation of this product as license-acceptance knows it
      @id = id
      @pretty_name = pretty_name
      @filename = filename
      @mixlib_name = mixlib_name
      @license_required_version = license_required_version
    end

    def ==(other)
      return false if other.class != Product

      if other.id == id &&
          other.pretty_name == pretty_name &&
          other.filename == filename &&
          other.mixlib_name == mixlib_name
        other.license_required_version == license_required_version
        return true
      end
      false
    end

  end
end
