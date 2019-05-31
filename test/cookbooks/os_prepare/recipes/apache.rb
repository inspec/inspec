case node['platform_family']
when 'rhel'
  apache_conf_dir = 'httpd'
  apache_conf_file = 'conf/httpd.conf'
when 'debian'
  apache_conf_dir = 'apache2'
  apache_conf_file = 'apache2.conf'
end

# Create the apache configuration directory
directory "/etc/#{apache_conf_dir}"

# Create a directory for actual configuration /conf-available
directory "/etc/#{apache_conf_dir}/conf"

# Create a directory for actual configuration /conf-available
directory "/etc/#{apache_conf_dir}/conf-available"

# Create a directory for symlinked configuration /conf-enabled
directory "/etc/#{apache_conf_dir}/conf-enabled"

cookbook_file "/etc/#{apache_conf_dir}/#{apache_conf_file}" do
  source 'httpd.conf'
end

# Create configuration file (not symlinked)
file "/etc/#{apache_conf_dir}/conf-enabled/maxkeepaliverequests.conf" do
  content 'MaxKeepAliveRequests 100'
end

# Create configuration to be symlinked
file "/etc/#{apache_conf_dir}/conf-available/security.conf" do
  content 'ServerSignature Off'
end

# and link the configuration
link "/etc/#{apache_conf_dir}/conf-enabled/security.conf" do
  to "/etc/#{apache_conf_dir}/conf-available/security.conf"
end
