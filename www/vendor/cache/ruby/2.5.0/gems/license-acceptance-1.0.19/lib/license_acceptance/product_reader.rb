require "tomlrb"
require "license_acceptance/logger"
require "license_acceptance/product"
require "license_acceptance/product_relationship"

module LicenseAcceptance
  class ProductReader
    include Logger

    attr_accessor :products, :relationships

    def read
      logger.debug("Reading products and relationships...")
      location = get_location
      self.products = {}
      self.relationships = {}

      toml = Tomlrb.load_file(location, symbolize_keys: false)
      raise InvalidProductInfo.new(location) if toml.empty? || toml["products"].nil? || toml["relationships"].nil?

      toml["products"].each do |product|
        products[product["id"]] = Product.new(
          product["id"], product["pretty_name"],
          product["filename"], product["mixlib_name"],
          product["license_required_version"]
        )
      end

      toml["relationships"].each do |parent_id, children|
        parent = products[parent_id]
        raise UnknownParent.new(parent_id) if parent.nil?
        # Its fine to not have a relationship entry, but not fine to have
        # a relationship where the children are nil or empty.
        if children.nil? || children.empty? || !children.is_a?(Array)
          raise NoChildRelationships.new(parent)
        end

        children.map! do |child_id|
          child = products[child_id]
          raise UnknownChild.new(child_id) if child.nil?

          child
        end
        relationships[parent] = children
      end

      logger.debug("Successfully read products and relationships")
    end

    def get_location
      # For local development point this to the product_info.toml at the root of the repo.
      # When bundled as a gem we will use the the relative path to find the file in the
      # gem package.
      if ENV["CHEF_LICENSE_PRODUCT_INFO"]
        return ENV["CHEF_LICENSE_PRODUCT_INFO"]
      end

      File.absolute_path(File.join(__FILE__, "../../../config/product_info.toml"))
    end

    def lookup(parent_id, parent_version)
      parent_product = products.fetch(parent_id) do
        raise UnknownProduct.new(parent_id)
      end
      children = relationships.fetch(parent_product, [])
      unless parent_version.is_a? String
        raise ProductVersionTypeError.new(parent_version)
      end

      ProductRelationship.new(parent_product, children, parent_version)
    end

    def lookup_by_mixlib(mixlib_name)
      found_product = products.values.find(nil) do |p|
        p.mixlib_name == mixlib_name
      end
      found_product
    end

  end

  class UnknownProduct < RuntimeError
    def initialize(product)
      msg = "Unknown product '#{product}' - this represents a developer error"
      super(msg)
    end
  end

  class InvalidProductInfo < RuntimeError
    def initialize(path)
      msg = "Product info at path #{path} is invalid. Must list Products and relationships."
      super(msg)
    end
  end

  class UnknownParent < RuntimeError
    def initialize(product)
      msg = "Could not find product #{product} from relationship parents"
      super(msg)
    end
  end

  class UnknownChild < RuntimeError
    def initialize(product)
      msg = "Could not find product #{product} from relationship children"
      super(msg)
    end
  end

  class NoChildRelationships < RuntimeError
    def initialize(product)
      msg = "No child relationships for #{product.id}, should be removed from product info or fixed"
      super(msg)
    end
  end

  class ProductVersionTypeError < RuntimeError
    def initialize(product_version)
      msg = "Product versions must be specified as a string, provided type is '#{product_version.class}'"
      super(msg)
    end
  end
end
