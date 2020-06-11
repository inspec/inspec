# encoding: utf-8

require_relative "platforms/common"
require_relative "platforms/detect"
require_relative "platforms/detect/scanner"
require_relative "platforms/detect/specifications/os"
require_relative "platforms/detect/specifications/api"
require_relative "platforms/detect/uuid"
require_relative "platforms/family"
require_relative "platforms/platform"

module Train::Platforms
  # Retrieve the current platform list
  #
  # @return [Hash] map with platform names and their objects
  def self.list
    @list ||= {}
  end

  # Retrieve the current family list
  #
  # @return [Hash] map with family names and their objects
  def self.families
    @families ||= {}
  end

  # Clear all platform settings. Only used for testing.
  def self.__reset
    @list = {}
    @families = {}
  end

  # Create or update a platform
  #
  # @return Train::Platform
  def self.name(name, condition = {})
    # TODO: refactor this against family. They're stupidly similar
    # Check the list to see if one is already created
    plat = list[name]
    unless plat.nil?
      # Pass the condition incase we are adding a family relationship
      plat.condition = condition unless condition.nil?
      return plat
    end

    Train::Platforms::Platform.new(name, condition)
  end

  # Create or update a family
  #
  # @return Train::Platforms::Family
  def self.family(name, condition = {})
    # Check the families to see if one is already created
    family = families[name]
    unless family.nil?
      # Pass the condition incase we are adding a family relationship
      family.condition = condition unless condition.nil?
      return family
    end

    Train::Platforms::Family.new(name, condition)
  end

  # Find the families or top level platforms
  #
  # @return [Hash] with top level family and platforms
  def self.top_platforms
    empty_list =     list.select { |_key, value| value.families.empty? }
    empty_fams = families.select { |_key, value| value.families.empty? }

    empty_list.merge empty_fams
  end

  # List all platforms and families in a readable output
  def self.list_all
    top_platforms = self.top_platforms
    top_platforms.each_value do |platform|
      puts platform.title
      print_children(platform) if defined?(platform.children)
    end
  end

  def self.print_children(parent, pad = 2)
    parent.children.each do |key, value|
      obj = key
      puts "#{" " * pad}-> #{obj.title}#{value unless value.empty?}"
      print_children(obj, pad + 2) if defined?(obj.children) && !obj.children.nil?
    end
  end

  def self.export
    export = []
    list.each do |name, platform|
      platform.find_family_hierarchy
      export << {
        name: name,
        families: platform.family_hierarchy,
      }
    end
    export.sort_by { |platform| platform[:name] }
  end
end
