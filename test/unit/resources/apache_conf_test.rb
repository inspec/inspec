require "helper"
require "inspec/resource"
require "inspec/resources/apache_conf"
require "hashie"

describe "Inspec::Resources::ApacheConf" do
  # debian style apache2
  it "reads values in apache2.conf and from Include, IncludeOptional params" do
    resource = MockLoader.new(:ubuntu).load_resource("apache_conf",
                                                         "/etc/apache2/apache2.conf")
    _(resource.params).must_be_kind_of Hash
    _(resource.content).must_be_kind_of String
    _(resource.resource_id).must_equal "/etc/apache2/apache2.conf"
    _(resource.params("ServerRoot")).must_equal ["/etc/apache2"]
    _(resource.params("ServerAlias")).must_equal ["inspec.test www.inspec.test io.inspec.test"]
    _(resource.params("Listen").sort).must_equal %w{443 80}
    # sourced using a linked file in conf-enabled/
    _(resource.params("ServerSignature")).must_equal ["Off"]
    # TODO(sr) currently, the parser only merges parameter across separate
    # source files, not in one file
    _(resource.params("Define")).must_equal %w{ENABLE_USR_LIB_CGI_BIN
                                             ENABLE_USR_LIB_CGI_BIN}
  end

  it "reads values successfully from apache2.conf and ignores Include, IncludeOptional params when server root is not configured" do
    resource = MockLoader.new(:ubuntu).load_resource("apache_conf", "/etc/test-serverroot/apache2/apache2.conf")
    _(resource.params).must_be_kind_of Hash
    _(resource.content).must_be_kind_of String
    _(resource.resource_id).must_equal "/etc/test-serverroot/apache2/apache2.conf"
    _(resource.params("ServerAlias")).must_equal ["inspec.test www.inspec.test io.inspec.test"]
    assert_nil(resource.params("ServerRoot"))
    assert_nil(resource.params("Listen"))
  end

  # non debian style httpd
  it "reads values in httpd.conf and from Include, IncludeOptional params" do
    resource = MockLoader.new(:centos6).load_resource("apache_conf",
                                                      "/etc/httpd/conf/httpd.conf")

    _(resource.params).must_be_kind_of Hash
    _(resource.content).must_be_kind_of String
    _(resource.params("ServerRoot")).must_equal ["/etc/httpd"]
    _(resource.params("Listen").sort).must_equal %w{443 80}

    # sourced using an absolute path in httpd.conf
    _(resource.params("ExtendedStatus")).must_equal ["Off"]
    # sourced using a linked file in conf-enabled/
    _(resource.params("ServerSignature")).must_equal ["Off"]
  end
end
