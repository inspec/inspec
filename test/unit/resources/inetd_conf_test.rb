require "helper"
require "inspec/resource"
require "inspec/resources/inetd_conf"

describe "Inspec::Resources::InetdConf" do
  it "verify limits.conf config parsing" do
    resource = load_resource("inetd_conf")
    _(resource.send("shell")).must_be_nil
    _(resource.send("login")).must_be_nil
    _(resource.send("ftp")).must_equal %w{stream tcp nowait root /usr/sbin/in.ftpd in.ftpd}
    _(resource.send("resource_id")).must_equal "/etc/inetd.conf"
  end
end
