# If we can load the InSpec globals definition file...
require "inspec/globals"
require "#{Inspec.src_root}/test/helper"
require_relative "../../../lib/inspec/resources/php_config"

describe Inspec::Resources::PhpConfig do
  # ubuntu
  it "checks php config parameters on ubuntu from default ini file." do
    resource = MockLoader.new("ubuntu".to_sym).load_resource("php_config", "default_mimetype")
    _(resource.value).must_equal "text/html"
    _(resource.resource_id).must_equal "default_mimetype"
  end

  # ubuntu with custom ini file.
  it "checks php config parameters on ubuntu from default ini file." do
    resource = MockLoader.new("ubuntu".to_sym).load_resource("php_config", "default_mimetype", { "ini" => "/etc/php/7.4/cli/php.ini" })
    _(resource.value).must_equal "text/html"
    _(resource.resource_id).must_equal "default_mimetype"
  end

  # windows
  it "checks php config parameters on windows from default ini file." do
    resource = MockLoader.new("windows".to_sym).load_resource("php_config", "default_mimetype")
    _(resource.value).must_equal "text/html"
    _(resource.resource_id).must_equal "default_mimetype"
  end

  # macos10_10
  it "checks php config parameters on darwin from default ini file." do
    resource = MockLoader.new("macos10_10".to_sym).load_resource("php_config", "default_mimetype")
    _(resource.value).must_equal "text/html"
    _(resource.resource_id).must_equal "default_mimetype"
  end

  # ubuntu with invalid config param
  it "checks invalid php config parameters on ubuntu from default ini file." do
    resource = MockLoader.new("ubuntu".to_sym).load_resource("php_config", "an_invalid_param")
    ex = _ { resource.value }.must_raise(Inspec::Exceptions::ResourceFailed)
    _(ex.message).must_include "Executing php  -r 'echo get_cfg_var(\"an_invalid_param\");' failed"
  end
end
