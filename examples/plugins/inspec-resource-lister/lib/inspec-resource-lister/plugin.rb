# Plugin Definition file
# The purpose of this file is to declare to InSpec what plugin_types (capabilities)
# are included in this plugin, and provide hooks that will load them as needed.

# It is important that this file load successfully and *quickly*.
# Your plugin's functionality may never be used on this InSpec run; so we keep things
# fast and light by only loading heavy things when they are needed.

# Presumably this is light
require 'inspec-resource-lister/version'

# The InspecPlugins namespace is where all plugins should declare themselves.
# The 'Inspec' capitalization is used throughout the InSpec source code; yes, it's
# strange.
module InspecPlugins
  # Pick a reasonable namespace here for your plugin.  A reasonable choice
  # would be the CamelCase version of your plugin gem name.
  # inspec-resource-lister => ResourceLister
  module ResourceLister
    # This simple class handles the plugin definition, so calling it simply Plugin is OK.
    #   Inspec.plugin returns various Classes, intended to be superclasses for various
    # plugin components. Here, the one-arg form gives you the Plugin Definition superclass,
    # which mainly gives you access to the hook / plugin_type DSL.
    #   The number '2' says you are asking for version 2 of the plugin API. If there are
    # future versions, InSpec promises plugin API v2 will work for at least two more InSpec
    # major versions.
    class Plugin < ::Inspec.plugin(2)
      # Internal machine name of the plugin. InSpec will use this in errors, etc.
      plugin_name :'inspec-resource-lister'

      # Define a new CLI subcommand.
      # The argument here will be used to match against the command line args,
      # and if the user said `inspec list-resources`, this hook will get called.
      # Notice that you can define multiple hooks with different names, and they
      # don't have to match the plugin name.

      # We'd like this to be list-resources, but Thor does not support hyphens
      # see https://github.com/erikhuda/thor/pull/613
      cli_command :listresources do
        # Calling this hook doesn't mean list-resources is being executed - just
        # that we should be ready to do so. So, load the file that defines the
        # functionality.
        # For example, InSpec will activate this hook when `inspec help` is
        # executed, so that this plugin's usage message will be included in the help.
        require 'inspec-resource-lister/cli_command'

        # Having loaded our functionality, return a class that will let the
        # CLI engine tap into it.
        InspecPlugins::ResourceLister::CliCommand
      end
    end
  end
end
