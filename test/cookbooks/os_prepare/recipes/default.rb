#
# prepare all operating systems with the required configuration

apt_update if platform_family?("debian")

# inject the current inspec gem for use with audit cookbook
# this is generated via Rake test:integration
cookbook_file "/root/inspec-core-local.gem" do
  source "inspec-core-local.gem"
  action :create
end

chef_gem "inspec" do
  source "/root/inspec-core-local.gem"
end

def uuid_from_string(string)
  require "digest/sha1"
  hash = Digest::SHA1.new
  hash.update(string)
  ary = hash.digest.unpack("NnnnnN")
  ary[2] = (ary[2] & 0x0FFF) | (5 << 12)
  ary[3] = (ary[3] & 0x3FFF) | 0x8000
  "%08x-%04x-%04x-%04x-%04x%08x" % ary
end

# set a static node uuid for our testing nodes
Chef::Config[:chef_guid] = uuid_from_string(node.name)

# confgure ssh
include_recipe("os_prepare::ssh")

# basic tests
include_recipe("os_prepare::file")
include_recipe("os_prepare::mount") unless node["osprepare"]["docker"]
include_recipe("os_prepare::service")
include_recipe("os_prepare::package")
include_recipe("os_prepare::registry_key")
include_recipe("os_prepare::iis")
include_recipe("os_prepare::iptables") unless node["osprepare"]["docker"]
include_recipe("os_prepare::x509")
include_recipe("os_prepare::dh_params")

# config file parsing
include_recipe("os_prepare::json_yaml_csv_ini_xml")

# configure repos, eg. nginx
include_recipe("os_prepare::apt")

# application configuration
if node["osprepare"]["application"] && node["platform_family"] != "windows"
  include_recipe("os_prepare::postgres")
  include_recipe("os_prepare::auditctl") unless node["osprepare"]["docker"]
  include_recipe("os_prepare::apache")
end

# docker host testing
include_recipe("os_prepare::docker_host") unless node["osprepare"]["docker"]

include_recipe("os_prepare::os_env")
