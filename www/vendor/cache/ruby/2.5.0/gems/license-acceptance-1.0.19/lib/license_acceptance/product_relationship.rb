module LicenseAcceptance
  class ProductRelationship

    attr_reader :parent, :children, :parent_version

    def initialize(parent, children, parent_version)
      @parent = parent
      @children = children
      @parent_version = parent_version
    end

  end
end
