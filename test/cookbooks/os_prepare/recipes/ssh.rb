#
# installs ssh
return if node["platform_family"] == "windows"

include_recipe "ssh-hardening::default"
