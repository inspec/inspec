require "helper"
require "inspec/resource"
require "inspec/resources/service"
require "hashie"

describe "Inspec::Resources::Service" do
  let(:runlevels) { { 0 => false, 1 => false, 2 => true, 3 => true, 4 => true, 5 => true, 6 => false } }

  # windows
  it "verify service parsing" do
    resource = MockLoader.new(:windows).load_resource("service", "dhcp")
    params = Hashie::Mash.new({})
    _(resource.type).must_equal "windows"
    _(resource.name).must_equal "dhcp"
    _(resource.description).must_equal "DHCP Client"
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.startmode). must_equal "Auto"
    _(resource.startname). must_equal "LocalSystem"
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "dhcp"
  end

  # ubuntu
  it "verify ubuntu service parsing" do
    resource = MockLoader.new(:ubuntu1404).load_resource("service", "ssh")
    params = Hashie::Mash.new({})
    _(resource.type).must_equal "upstart"
    _(resource.name).must_equal "ssh"
    _(resource.description).must_be_nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "ssh"
  end

  it "verify ubuntu service parsing with default upstart_service" do
    resource = MockLoader.new(:ubuntu).load_resource("upstart_service", "ssh")
    params = Hashie::Mash.new({})
    _(resource.type).must_equal "upstart"
    _(resource.name).must_equal "ssh"
    _(resource.description).must_be_nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.params.UnitFileState).must_be_nil
    _(resource.resource_id).must_equal "ssh"
  end

  it "verify ubuntu service parsing" do
    resource = MockLoader.new(:ubuntu).load_resource("service", "sshd")
    params = Hashie::Mash.new({ "ActiveState" => "active", "Description" => "OpenSSH server daemon", "Id" => "sshd.service", "LoadState" => "loaded", "Names" => "sshd.service", "SubState" => "running", "UnitFileState" => "enabled" })
    _(resource.type).must_equal "systemd"
    _(resource.name).must_equal "sshd.service"
    _(resource.description).must_equal "OpenSSH server daemon"
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.params.SubState).must_equal "running"
    _(resource.resource_id).must_equal "sshd"
  end

  it "verify ubuntu service parsing with default systemd_service" do
    resource = MockLoader.new(:ubuntu).load_resource("systemd_service", "sshd")
    params = Hashie::Mash.new({ "ActiveState" => "active", "Description" => "OpenSSH server daemon", "Id" => "sshd.service", "LoadState" => "loaded", "Names" => "sshd.service", "SubState" => "running", "UnitFileState" => "enabled" })
    _(resource.type).must_equal "systemd"
    _(resource.name).must_equal "sshd.service"
    _(resource.description).must_equal "OpenSSH server daemon"
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "sshd"
  end

  # linux mint 17 with upstart
  it "verify mint service parsing" do
    resource = MockLoader.new(:mint17).load_resource("service", "ssh")
    params = Hashie::Mash.new({})
    _(resource.type).must_equal "upstart"
    _(resource.name).must_equal "ssh"
    _(resource.description).must_be_nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "ssh"
  end

  it "verify mint service parsing with default upstart_service" do
    resource = MockLoader.new(:mint17).load_resource("upstart_service", "ssh")
    params = Hashie::Mash.new({})
    _(resource.type).must_equal "upstart"
    _(resource.name).must_equal "ssh"
    _(resource.description).must_be_nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.params.UnitFileState).must_be_nil
    _(resource.resource_id).must_equal "ssh"
  end

  # mint 18 with systemd
  it "verify mint service parsing" do
    resource = MockLoader.new(:mint18).load_resource("service", "sshd")
    params = Hashie::Mash.new({ "ActiveState" => "active", "Description" => "OpenSSH server daemon", "Id" => "sshd.service", "LoadState" => "loaded", "Names" => "sshd.service", "SubState" => "running", "UnitFileState" => "enabled" })
    _(resource.type).must_equal "systemd"
    _(resource.name).must_equal "sshd.service"
    _(resource.description).must_equal "OpenSSH server daemon"
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.params.SubState).must_equal "running"
    _(resource.resource_id).must_equal "sshd"
  end

  it "verify mint service parsing with default systemd_service" do
    resource = MockLoader.new(:mint18).load_resource("systemd_service", "sshd")
    params = Hashie::Mash.new({ "ActiveState" => "active", "Description" => "OpenSSH server daemon", "Id" => "sshd.service", "LoadState" => "loaded", "Names" => "sshd.service", "SubState" => "running", "UnitFileState" => "enabled" })
    _(resource.type).must_equal "systemd"
    _(resource.name).must_equal "sshd.service"
    _(resource.description).must_equal "OpenSSH server daemon"
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "sshd"
  end

  # [-] Todo: Check with team if we can remove the below unit test or find a way to include it.
  # The below test is not required because we cannot differentiate between amazon and amazon2 during testing.
  # After all, the differentiation is not based on the version but based on the utility available on the system.
  # However, the service resource works perfectly fine for the actual instance of Amazon and Amazon2 Linux.

  # Amazon Linux
  # it "verify amazon linux service parsing" do
  #   resource = MockLoader.new(:amazon).load_resource("service", "ssh")
  #   params = Hashie::Mash.new({})
  #   # _(resource.type).must_equal "upstart"
  #   # _(resource.name).must_equal "ssh"
  #   _(resource.description).must_be_nil
  #   _(resource.installed?).must_equal true
  #   _(resource.enabled?).must_equal true
  #   _(resource.running?).must_equal true
  #   _(resource.params).must_equal params
  #   _(resource.params.UnitFileState).must_be_nil
  # end

  # Amazon Linux 2
  it "verify amazon linux 2 service parsing" do
    resource = MockLoader.new(:amazon2).load_resource("service", "sshd")
    params = Hashie::Mash.new({ "ActiveState" => "active", "Description" => "OpenSSH server daemon", "Id" => "sshd.service", "LoadState" => "loaded", "Names" => "sshd.service", "SubState" => "running", "UnitFileState" => "enabled" })
    _(resource.type).must_equal "systemd"
    _(resource.name).must_equal "sshd.service"
    _(resource.description).must_equal "OpenSSH server daemon"
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "sshd"
  end

  # Aliyun Linux 3 (Alibaba)
  it "verify aliyun linux 3 service parsing" do
    resource = MockLoader.new(:aliyun3).load_resource("service", "sshd")
    params = Hashie::Mash.new({ "ActiveState" => "active", "Description" => "OpenSSH server daemon", "Id" => "sshd.service", "LoadState" => "loaded", "Names" => "sshd.service", "SubState" => "running", "UnitFileState" => "enabled" })
    _(resource.type).must_equal "systemd"
    _(resource.name).must_equal "sshd.service"
    _(resource.description).must_equal "OpenSSH server daemon"
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "sshd"
  end

  # centos 6 with sysv
  it "verify centos 6 service parsing" do
    resource = MockLoader.new(:centos6).load_resource("service", "sshd")
    params = Hashie::Mash.new({})
    _(resource.type).must_equal "sysv"
    _(resource.name).must_equal "sshd"
    _(resource.description).must_be_nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.params.SubState).must_be_nil
    _(resource.resource_id).must_equal "sshd"
  end

  it "verify centos 6 service parsing with default sysv_service" do
    resource = MockLoader.new(:centos6).load_resource("sysv_service", "sshd")
    params = Hashie::Mash.new({})
    _(resource.type).must_equal "sysv"
    _(resource.name).must_equal "sshd"
    _(resource.description).must_be_nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "sshd"
  end

  # centos 7 with systemd
  it "verify centos 7 service parsing" do
    resource = MockLoader.new(:centos7).load_resource("service", "sshd")
    params = Hashie::Mash.new({ "ActiveState" => "active", "Description" => "OpenSSH server daemon", "Id" => "sshd.service", "LoadState" => "loaded", "Names" => "sshd.service", "SubState" => "running", "UnitFileState" => "enabled" })
    _(resource.type).must_equal "systemd"
    _(resource.name).must_equal "sshd.service"
    _(resource.description).must_equal "OpenSSH server daemon"
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "sshd"
  end

  it "verify centos 7 service parsing with systemd_service and service_ctl override" do
    resource = MockLoader.new(:centos7).load_resource("systemd_service", "sshd", "/path/to/systemctl")
    params = Hashie::Mash.new({ "ActiveState" => "active", "Description" => "OpenSSH server daemon", "Id" => "sshd.service", "LoadState" => "loaded", "Names" => "sshd.service", "UnitFileState" => "enabled", "SubState" => "running" })
    _(resource.type).must_equal "systemd"
    _(resource.name).must_equal "sshd.service"
    _(resource.description).must_equal "OpenSSH server daemon"
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "sshd"
  end

  it "verify centos 7 service parsing with static loaded service" do
    resource = MockLoader.new(:centos7).load_resource("service", "dbus")
    params = Hashie::Mash.new({ "Description" => "D-Bus System Message Bus", "Id" => "dbus.service", "LoadState" => "loaded", "Names" => "messagebus.service dbus.service", "SubState" => "running", "UnitFileState" => "static", "User" => "root" })
    _(resource.type).must_equal "systemd"
    _(resource.name).must_equal "dbus.service"
    _(resource.description).must_equal "D-Bus System Message Bus"
    _(resource.startname).must_equal "root"
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.params.UnitFileState).must_equal "static"
    _(resource.resource_id).must_equal "dbus"
  end

  # cloudlinux 7 with systemd
  it "verify cloudlinux 7 service parsing" do
    resource = MockLoader.new(:cloudlinux).load_resource("service", "sshd")
    params = Hashie::Mash.new({ "ActiveState" => "active", "Description" => "OpenSSH server daemon", "Id" => "sshd.service", "LoadState" => "loaded", "Names" => "sshd.service", "SubState" => "running", "UnitFileState" => "enabled" })
    _(resource.type).must_equal "systemd"
    _(resource.name).must_equal "sshd.service"
    _(resource.description).must_equal "OpenSSH server daemon"
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "sshd"
  end

  it "verify cloudlinux 7 service parsing with systemd_service and service_ctl override" do
    resource = MockLoader.new(:cloudlinux).load_resource("systemd_service", "sshd", "/path/to/systemctl")
    params = Hashie::Mash.new({ "ActiveState" => "active", "Description" => "OpenSSH server daemon", "Id" => "sshd.service", "LoadState" => "loaded", "Names" => "sshd.service", "UnitFileState" => "enabled", "SubState" => "running" })
    _(resource.type).must_equal "systemd"
    _(resource.name).must_equal "sshd.service"
    _(resource.description).must_equal "OpenSSH server daemon"
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "sshd"
  end

  it "verify cloudlinux 7 service parsing with static loaded service" do
    resource = MockLoader.new(:cloudlinux).load_resource("service", "dbus")
    params = Hashie::Mash.new({ "Description" => "D-Bus System Message Bus", "Id" => "dbus.service", "LoadState" => "loaded", "Names" => "messagebus.service dbus.service", "SubState" => "running", "UnitFileState" => "static", "User" => "root" })
    _(resource.type).must_equal "systemd"
    _(resource.name).must_equal "dbus.service"
    _(resource.description).must_equal "D-Bus System Message Bus"
    _(resource.startname).must_equal "root"
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.params.UnitFileState).must_equal "static"
    _(resource.resource_id).must_equal "dbus"
  end

  # freebsd 9
  it "verify freebsd9 service parsing" do
    resource = MockLoader.new(:freebsd9).load_resource("service", "sendmail")
    params = Hashie::Mash.new({})
    _(resource.type).must_equal "bsd-init"
    _(resource.name).must_equal "sendmail"
    _(resource.description).must_be_nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "sendmail"
  end

  it "verify freebsd9 service parsing with default bsd_service" do
    resource = MockLoader.new(:freebsd9).load_resource("bsd_service", "sendmail")
    params = Hashie::Mash.new({})
    _(resource.type).must_equal "bsd-init"
    _(resource.name).must_equal "sendmail"
    _(resource.description).must_be_nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "sendmail"
  end

  it "verify freebsd9 service parsing when one service is a suffix of another" do
    resource = MockLoader.new(:freebsd9).load_resource("service", "mail") # "mail" is suffix of "sendmail", which is enabled
    _(resource.enabled?).must_equal false
    _(resource.resource_id).must_equal "mail"
  end

  # freebsd 10+
  it "verify freebsd10 service parsing" do
    resource = MockLoader.new(:freebsd10).load_resource("service", "sendmail")
    params = Hashie::Mash.new({})
    _(resource.type).must_equal "bsd-init"
    _(resource.name).must_equal "sendmail"
    _(resource.description).must_be_nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "sendmail"
  end

  it "verify freebsd10 service parsing with default bsd_service" do
    resource = MockLoader.new(:freebsd10).load_resource("bsd_service", "sendmail")
    params = Hashie::Mash.new({})
    _(resource.type).must_equal "bsd-init"
    _(resource.name).must_equal "sendmail"
    _(resource.description).must_be_nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "sendmail"
  end

  # arch linux with systemd
  it "verify arch linux service parsing" do
    resource = MockLoader.new(:arch).load_resource("service", "sshd")
    params = Hashie::Mash.new({ "ActiveState" => "active", "Description" => "OpenSSH server daemon", "Id" => "sshd.service", "LoadState" => "loaded", "Names" => "sshd.service", "SubState" => "running", "UnitFileState" => "enabled" })
    _(resource.type).must_equal "systemd"
    _(resource.name).must_equal "sshd.service"
    _(resource.description).must_equal "OpenSSH server daemon"
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "sshd"
  end

  # coreos linux with systemd
  it "verify coreos linux service parsing" do
    resource = MockLoader.new(:coreos).load_resource("service", "sshd")
    params = Hashie::Mash.new({ "ActiveState" => "active", "Description" => "OpenSSH server daemon", "Id" => "sshd.service", "LoadState" => "loaded", "Names" => "sshd.service", "SubState" => "running", "UnitFileState" => "enabled" })
    _(resource.type).must_equal "systemd"
    _(resource.name).must_equal "sshd.service"
    _(resource.description).must_equal "OpenSSH server daemon"
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "sshd"
  end

  # debian 7 with systemv
  it "verify debian 7 service parsing" do
    resource = MockLoader.new(:debian7).load_resource("service", "sshd")
    params = Hashie::Mash.new({})
    _(resource.type).must_equal "sysv"
    _(resource.name).must_equal "sshd"
    _(resource.description).must_be_nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "sshd"
  end

  # debian 8 with systemd
  it "verify debian 8 service parsing" do
    resource = MockLoader.new(:debian8).load_resource("service", "sshd")
    params = Hashie::Mash.new({ "ActiveState" => "active", "Description" => "OpenSSH server daemon", "Id" => "sshd.service", "LoadState" => "loaded", "Names" => "sshd.service", "SubState" => "running", "UnitFileState" => "enabled" })
    _(resource.type).must_equal "systemd"
    _(resource.name).must_equal "sshd.service"
    _(resource.description).must_equal "OpenSSH server daemon"
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "sshd"
  end

  # debian 10 with systemd
  it "verify debian 10 service parsing" do
    resource = MockLoader.new(:debian10).load_resource("service", "sshd")
    params = Hashie::Mash.new({ "ActiveState" => "active", "Description" => "OpenSSH server daemon", "Id" => "sshd.service", "LoadState" => "loaded", "Names" => "sshd.service", "SubState" => "running", "UnitFileState" => "enabled" })
    _(resource.type).must_equal "systemd"
    _(resource.name).must_equal "sshd.service"
    _(resource.description).must_equal "OpenSSH server daemon"
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "sshd"
  end

  # debian 8 with systemd but no service file
  it "gets the correct service info when the `.service` file is missing" do
    resource = MockLoader.new(:debian8).load_resource("service", "apache2")
    params = Hashie::Mash.new(
      "ActiveState"   => "active",
      "Description"   => "LSB: Apache2 web server",
      "Id"            => "apache2.service",
      "LoadState"     => "loaded",
      "Names"         => "apache2.service",
      "SubState"      => "running",
      "UnitFileState" => ""
    )
    _(resource.type).must_equal "systemd"
    _(resource.name).must_equal "apache2.service"
    _(resource.description).must_equal "LSB: Apache2 web server"
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "apache2"
  end

  # macos test
  it "verify mac osx service parsing" do
    resource = MockLoader.new(:macos10_10).load_resource("service", "ssh")
    params = Hashie::Mash.new({})
    _(resource.type).must_equal "darwin"
    _(resource.name).must_equal "org.openbsd.ssh-agent"
    _(resource.description).must_be_nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "ssh"
  end

  it "verify macos 10.16 (11 / big sur) service parsing" do
    resource = MockLoader.new(:macos10_16).load_resource("service", "ssh")
    params = Hashie::Mash.new({})
    _(resource.type).must_equal "darwin"
    _(resource.name).must_equal "org.openbsd.ssh-agent"
    _(resource.description).must_be_nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "ssh"
  end

  it "verify mac osx service parsing with not-running service" do
    resource = MockLoader.new(:macos10_10).load_resource("service", "FilesystemUI")
    params = Hashie::Mash.new({})
    _(resource.type).must_equal "darwin"
    _(resource.name).must_equal "com.apple.FilesystemUI"
    _(resource.description).must_be_nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal false
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "FilesystemUI"
  end

  it "verify mac osx service parsing with default launchd_service" do
    resource = MockLoader.new(:macos10_10).load_resource("launchd_service", "ssh")
    params = Hashie::Mash.new({})
    _(resource.type).must_equal "darwin"
    _(resource.name).must_equal "org.openbsd.ssh-agent"
    _(resource.description).must_be_nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "ssh"
  end

  it "verify mac osx service parsing with negative status launchd_service" do
    resource = MockLoader.new(:macos10_10).load_resource(
      "launchd_service", "org.example.killed-agent"
    )
    params = Hashie::Mash.new({})
    _(resource.type).must_equal "darwin"
    _(resource.name).must_equal "org.example.killed-agent"
    _(resource.description).must_be_nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal false
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "org.example.killed-agent"
  end

  # wrlinux
  it "verify wrlinux service parsing" do
    resource = MockLoader.new(:wrlinux).load_resource("service", "sshd")
    params = Hashie::Mash.new({})
    _(resource.type).must_equal "sysv"
    _(resource.name).must_equal "sshd"
    _(resource.description).must_be_nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "sshd"
  end

  # yocto
  it "verify yocto service parsing" do
    resource = MockLoader.new(:yocto).load_resource("service", "sshd")
    params = Hashie::Mash.new({ "ActiveState" => "active", "Description" => "OpenSSH server daemon", "Id" => "sshd.service", "LoadState" => "loaded", "Names" => "sshd.service", "SubState" => "running", "UnitFileState" => "enabled" })
    _(resource.type).must_equal "systemd"
    _(resource.name).must_equal "sshd.service"
    _(resource.description).must_equal "OpenSSH server daemon"
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "sshd"
  end

  it "verify alpine service parsing" do
    resource = MockLoader.new(:alpine).load_resource("service", "sshd")
    params = Hashie::Mash.new({})
    _(resource.type).must_equal "sysv"
    _(resource.name).must_equal "sshd"
    _(resource.description).must_be_nil
    _(resource.installed?).must_equal true
    _(resource.enabled?).must_equal true
    _(resource.running?).must_equal true
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "sshd"
  end

  # unknown OS
  it "verify service handling on unsupported os" do
    resource = MockLoader.new(:undefined).load_resource("service", "dhcp")
    params = Hashie::Mash.new({})
    _(resource.installed?).must_equal false
    _(resource.description).must_be_nil
    _(resource.params).must_equal params
    _(resource.resource_id).must_equal "dhcp"
  end

  # runlevel detection
  describe "runlevels on centos 6 (system V)" do
    let(:service) { MockLoader.new(:centos6).load_resource("service", "sshd") }

    it "grabs all runlevels" do
      _(service.runlevels.keys).must_equal [0, 1, 2, 3, 4, 5, 6]
    end

    it "grabs runlevels via filter nil" do
      _(service.runlevels(nil).keys).must_equal [0, 1, 2, 3, 4, 5, 6]
    end

    it "grabs runlevels by number" do
      _(service.runlevels(3).keys).must_equal [3]
    end

    it "grabs runlevels by multiple numbers" do
      _(service.runlevels(3, 4, 8).keys).must_equal [3, 4]
    end

    it "grabs runlevels via regex" do
      _(service.runlevels(/[5-9]/).keys).must_equal [5, 6]
    end

    it "checks enabled true if all services are enabled" do
      _(service.runlevels(2, 4).enabled?).must_equal true
    end

    it "checks enabled false if some services are not enabled" do
      _(service.runlevels(1, 4).enabled?).must_equal false
    end

    it "checks disabled true if all services are disabled" do
      _(service.runlevels(0, 1).disabled?).must_equal true
    end

    it "checks disabled false if some services are not disabled" do
      _(service.runlevels(0, 4).enabled?).must_equal false
    end

    # windows
    it "verify serverspec compatible matchers on windows" do
      resource = MockLoader.new(:windows).load_resource("service", "dhcp")
      _(resource.name).must_equal "dhcp"
      _(resource.has_start_mode?("Auto")).must_equal true
      _(resource.resource_id).must_equal "dhcp"
    end

    # ubuntu
    it "verify serverspec compatible matchers on ubuntu" do
      resource = MockLoader.new(:ubuntu1404).load_resource("service", "ssh")
      _(resource.name).must_equal "ssh"
      _(resource.monitored_by?("monit")).must_equal true
      ex = _ { resource.has_start_mode?("Auto") }.must_raise(Inspec::Exceptions::ResourceSkipped)
      _(ex.message).must_include "The `has_start_mode` matcher is not supported on your OS yet."
      _(resource.resource_id).must_equal "ssh"
    end
  end
end
