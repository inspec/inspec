require "inspec/globals"
require "#{Inspec.src_root}/test/helper"
require_relative "../../../lib/inspec/resources/mail_alias"

describe Inspec::Resources::Mailalias do
  it "check mail_alias on ubuntu" do
    resource = MockLoader.new(:ubuntu).load_resource("mail_alias", "daemon")
    _(resource.aliased_to?("root")).must_equal true
  end

  it "check mail_alias on macos" do
    resource = MockLoader.new(:macos10_10).load_resource("mail_alias", "daemon")
    _(resource.aliased_to?("root")).must_equal true
  end

  it "check mail_alias on freebsd" do
    resource = MockLoader.new(:freebsd11).load_resource("mail_alias", "daemon")
    _(resource.aliased_to?("root")).must_equal true
  end

  it "check mail_alias on ubuntu with a key that is not included as an alias" do
    resource = MockLoader.new(:ubuntu).load_resource("mail_alias", "cheesecake")
    ex = _ { resource.aliased_to?("root") }.must_raise(Inspec::Exceptions::ResourceFailed)
    _(ex.message).must_include "cheesecake is not a valid key in the aliases"
  end
end
