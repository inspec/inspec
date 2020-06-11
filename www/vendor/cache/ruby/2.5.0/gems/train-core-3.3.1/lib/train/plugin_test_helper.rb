# This file is intended to be 'require'd by plugin authors who are developing a
# plugin outside of the Train source tree.

# Load Train.  We certainly need the plugin system, and also several other parts
# that are tightly coupled.  Train itself is fairly light, and non-invasive.
require_relative "../train"

# You can select from a number of test harnesses.  Since Train is closely related
# to InSpec, and InSpec uses Spec-style controls in profile code, you will
# probably want to use something like minitest/spec, which provides Spec-style
# tests.
require "minitest/spec"
require "minitest/autorun"

# Data formats commonly used in testing
require "json"
require "ostruct"

# Utilities often needed
require "fileutils"
require "tmpdir"
require "pathname"

# You might want to put some debugging tools here.  We run tests to find bugs,
# after all.
require "byebug"

# Configure MiniTest to expose things like `let`
class Module
  include Minitest::Spec::DSL
end

# Finally, let's make some modules that can help us out.
module TrainPluginBaseHelper
  # Sneakily detect the location of the plugin
  # source code when they include this Module
  def self.included(base)
    plugin_test_helper_path = Pathname.new(caller_locations(4, 1).first.absolute_path)
    plugin_src_root = plugin_test_helper_path.parent.parent
    base.let(:plugin_src_path) { plugin_src_root }
    base.let(:plugin_fixtures_path) { File.join(plugin_src_root, "test", "fixtures") }
  end

  let(:train_src_path) { File.expand_path(File.join(__FILE__, "..", "..")) }
  let(:train_fixtures_path) { File.join(train_src_path, "test", "fixtures") }
  let(:registry) { Train::Plugins.registry }
end

module TrainPluginFunctionalHelper
  include TrainPluginBaseHelper
end
