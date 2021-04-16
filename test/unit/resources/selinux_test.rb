require "helper"
require "inspec/resource"
require "inspec/resources/selinux"

describe "Inspec::Resources::Selinux" do
  let(:resource) { load_resource("selinux") }

  it "verify selinux is installed" do
    resource = load_resource("selinux", "/etc/selinux/selinux_conf")
    _(resource.installed?).must_equal true
  end

  it "verify selinux state - enforcing" do
    _(resource.enforcing?).must_equal true
  end

  it "verify selinux state - permissive" do
    _(resource.permissive?).must_equal false
  end

  it "verify selinux disabled" do
    _(resource.disabled?).must_equal false
  end

  it "verify selinux policy type is targeted" do
    _(resource.policy).must_equal "targeted"
  end

  it "verify selinux on linux" do
    resource = MockLoader.new(:linux).load_resource("selinux")
    _(resource.enforcing?).must_equal true
    _(resource.permissive?).must_equal false
    _(resource.disabled?).must_equal false
  end

  it "verify selinux on windows" do
    resource = MockLoader.new(:windows).load_resource("selinux")
    _(resource.installed?).must_equal false
    _(resource.enforcing?).must_equal false
  end

  it "verify selinux on freebsd" do
    resource = MockLoader.new(:freebsd12).load_resource("selinux")
    _(resource.installed?).must_equal false
    _(resource.enforcing?).must_equal false
  end

  it "verify selinux.modules is exist" do
    _(resource.modules.exist?).must_equal true
  end

  it "verify selinux.modules parsing" do
    _(resource.modules.names).must_equal %w{foo bar baz}
    _(resource.modules.states).must_equal %w{enabled disabled enabled}
    _(resource.modules.status).must_equal %w{installed installed installed}
    _(resource.modules.priorities).must_equal %w{100 100 100}
  end

  it "verify selinux.booleans is exist" do
    _(resource.booleans.exist?).must_equal true
  end

  it "verify selinux.booleans parsing" do
    _(resource.booleans.names).must_equal %w{xen_use_nfs xend_run_blktap zebra_write_config}
    _(resource.booleans.states).must_equal %w{off on off}
    _(resource.booleans.defaults).must_equal %w{off on off}
  end
end
