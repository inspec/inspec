require "inspec/globals"
require "#{Inspec.src_root}/test/helper"
require_relative "../../../lib/inspec/resources/mail_alias"

describe Inspec::Resources::Mailalias do
  it "check mail alias on ubuntu" do
    resource = MockLoader.new(:ubuntu).load_resource("mail_alias", "daemon")
    _(resource.is_aliased_to?("root")).must_equal true
  end

  it "check mail alias on macos" do
    resource = MockLoader.new(:macos10_10).load_resource("mail_alias", "daemon")
    _(resource.is_aliased_to?("root")).must_equal true
  end

  it "check mail alias on freebsd" do
    resource = MockLoader.new(:freebsd11).load_resource("mail_alias", "daemon")
    _(resource.is_aliased_to?("root")).must_equal true
  end
end
