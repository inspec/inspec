# Plugin Definition file
# The purpose of this file is to declare to InSpec what plugin_types (capabilities)
# are included in this plugin, and provide activator that will load them as needed.

# It is important that this file load successfully and *quickly*.
# Your plugin's functionality may never be used on this InSpec run; so we keep things
# fast and light by only loading heavy things when they are needed.

# Presumably this is light
require "inspec-streaming-reporter-progress-bar/version"

# The InspecPlugins namespace is where all plugins should declare themselves.
# The "Inspec" capitalization is used throughout the InSpec source code; yes, it's
# strange.
module InspecPlugins
  # Pick a reasonable namespace here for your plugin. A reasonable choice
  # would be the CamelCase version of your plugin gem name.
  # inspec-streaming-reporter-progress-bar => StreamingReporterProgressBar
  module StreamingReporterProgressBar
    # This simple class handles the plugin definition, so calling it simply Plugin is OK.
    #   Inspec.plugin returns various Classes, intended to be superclasses for various
    # plugin components. Here, the one-arg form gives you the Plugin Definition superclass,
    # which mainly gives you access to the activator / plugin_type DSL.
    #   The number '2' says you are asking for version 2 of the plugin API. If there are
    # future versions, InSpec promises plugin API v2 will work for at least two more InSpec
    # major versions.
    class Plugin < ::Inspec.plugin(2)
      # Internal machine name of the plugin. InSpec will use this in errors, etc.
      plugin_name :"inspec-streaming-reporter-progress-bar"

      # Define a new Streaming Reporter.
      # The argument here will be used to match against the CLI --reporter option.
      # `--reporter streaming_reporter` will load your streaming reporter and perform streaming real-time on each passing, failing or pending test.
      streaming_reporter :"progress-bar" do
        # Calling this activator doesn't mean the reporter is being executed - just
        # that we should be ready to do so. So, load the file that defines the
        # functionality.
        require "inspec-streaming-reporter-progress-bar/streaming_reporter"

        # Having loaded our functionality, return a class that will let the
        # reporting engine tap into it.
        InspecPlugins::StreamingReporterProgressBar::StreamingReporter
      end
    end
  end
end
