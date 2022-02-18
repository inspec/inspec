# This file is known as the "entry point."
# This is the file InSpec will try to load if it
# thinks your plugin is installed.

# The *only* thing this file should do is setup the
# load path, then load the plugin definition file.

# Next two lines simply add the path of the gem to the load path.
# This is not needed when being loaded as a gem; but when doing
# plugin development, you may need it.  Either way, it's harmless.
libdir = File.dirname(__FILE__)
# ["/Users/nmathur/chef/inspec/vendor/bundle/ruby/2.7.0/gems/ruby-progressbar-1.11.0/lib"]
# /Users/nmathur/.rbenv/versions/2.7.4/lib/ruby/gems/2.7.0/gems/progress_bar-1.3.3/lib/progress_bar.rb
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require "inspec-streaming-reporter-progress-bar/plugin"