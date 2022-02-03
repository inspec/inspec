# Plugin Definition file
# The purpose of this file is to declare to InSpec what plugin_types (capabilities)
# are included in this plugin, and provide activator that will load them as needed.

# It is important that this file load successfully and *quickly*.
# Your plugin's functionality may never be used on this InSpec run; so we keep things
# fast and light by only loading heavy things when they are needed.

# Presumably this is light
require "inspec-streamer-bang/version"

# The InspecPlugins namespace is where all plugins should declare themselves.
# The "Inspec" capitalization is used throughout the InSpec source code; yes, it's
# strange.
module InspecPlugins
  module StreamerBang
    class Plugin < ::Inspec.plugin(2)
      plugin_name :"inspec-streamer-bang"

      streaming_reporter :bang do
        # Calling this activator doesn't mean the subcommand is being executed - just
        # that we should be ready to do so. So, load the file that defines the
        # functionality.
        require "inspec-streamer-bang/streaming_reporter"

        InspecPlugins::StreamerBang::StreamingReporter
      end


    end
  end
end
