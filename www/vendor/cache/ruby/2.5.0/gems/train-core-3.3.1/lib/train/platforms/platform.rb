# encoding: utf-8

module Train::Platforms
  class Platform
    include Train::Platforms::Common
    attr_accessor :backend, :condition, :families, :family_hierarchy, :platform

    def initialize(name, condition = {})
      @name = name
      @condition = condition
      @families = {}
      @family_hierarchy = []
      @platform = {}
      @detect = nil
      @title = name.to_s.capitalize

      # add itself to the platform list
      Train::Platforms.list[name] = self
    end

    def direct_families
      @families.collect { |k, _v| k.name }
    end

    def find_family_hierarchy(platform = self)
      families = platform.families.map { |k, v| [k.name, find_family_hierarchy(k)] }

      @family_hierarchy = families.flatten
    end

    def family
      @platform[:family] || @family_hierarchy[0]
    end

    def name
      # Override here incase a updated name was set
      # during the detect logic
      clean_name
    end

    def clean_name(force: false)
      @cleaned_name = nil if force
      @cleaned_name ||= (@platform[:name] || @name).downcase.tr(" ", "_")
    end

    def uuid
      @uuid ||= Train::Platforms::Detect::UUID.new(self).find_or_create_uuid.downcase
    end

    # This is for backwords compatability with
    # the current inspec os resource.
    def[](name)
      if respond_to?(name)
        send(name)
      else
        "unknown"
      end
    end

    def title(title = nil)
      return @title if title.nil?

      @title = title
      self
    end

    def to_hash
      @platform
    end

    # Add generic family? and platform methods to an existing platform
    #
    # This is done later to add any custom
    # families/properties that were created
    def add_platform_methods
      # Redo clean name if there is a detect override
      clean_name(force: true) unless @platform[:name].nil?

      # Add in family methods
      family_list = Train::Platforms.families
      family_list.each_value do |k|
        name = "#{k.name}?"

        next if respond_to?(name)

        define_singleton_method(name) do
          family_hierarchy.include?(k.name)
        end
      end

      # Helper methods for direct platform info
      @platform.each_key do |m|
        next if respond_to?(m)

        define_singleton_method(m) do
          @platform[m]
        end
      end

      # Create method for name if its not already true
      m = name + "?"
      return if respond_to?(m)

      define_singleton_method(m) do
        true
      end
    end
  end
end
