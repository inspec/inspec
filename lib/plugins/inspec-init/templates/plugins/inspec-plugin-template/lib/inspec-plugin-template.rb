# This file is known as the "entry point."
# This is the file InSpec will try to load if it
# thinks your plugin is installed.

# The *only* thing this file should do is setup the
# load path, then load the plugin definition file.

# Next two lines simply add the path of the gem to the load path.
# This is not needed when being loaded as a gem; but when doing
# plugin development, you may need it.  Either way, it's harmless.
libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require '<%= plugin_name %>/plugin'
