# Plugin Definition file
# The purpose of this file is to declare to InSpec what plugin_types (capabilities)
# are included in this plugin, and provide activator that will load them as needed.

# It is important that this file load successfully and *quickly*.
# Your plugin's functionality may never be used on this InSpec run; so we keep things
# fast and light by only loading heavy things when they are needed.

# Presumably this is light
require "inspec-test-resources/version"

# The InspecPlugins namespace is where all plugins should declare themselves.
# The "Inspec" capitalization is used throughout the InSpec source code; yes, it's
# strange.
module InspecPlugins
  # Pick a reasonable namespace here for your plugin. A reasonable choice
  # would be the CamelCase version of your plugin gem name.
  # inspec-test-resources => TestResources
  module TestResources
    # This simple class handles the plugin definition, so calling it simply Plugin is OK.
    #   Inspec.plugin returns various Classes, intended to be superclasses for various
    # plugin components. Here, the one-arg form gives you the Plugin Definition superclass,
    # which mainly gives you access to the activator / plugin_type DSL.
    #   The number '2' says you are asking for version 2 of the plugin API. If there are
    # future versions, InSpec promises plugin API v2 will work for at least two more InSpec
    # major versions.
    class Plugin < ::Inspec.plugin(2)
      # Internal machine name of the plugin. InSpec will use this in errors, etc.
      plugin_name :"inspec-test-resources"

      
      # Define a new Resource Pack.
      resource_pack :"inspec-test-resources" do
        # This file will load the resources implicitly via the superclass
        require "inspec-test-resources/resource_pack"

        # Having loaded our functionality, return a class that represents the plugin.
        # Reserved for future use.
        InspecPlugins::TestResources::ResourcePack
      end
    end
  end
end
