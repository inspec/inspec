# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
#
# file mount tests

# download alpine linux for file mount tests
remote_file '/root/alpine-3.3.0-x86_64.iso' do
  source 'http://wiki.alpinelinux.org/cgi-bin/dl.cgi/v3.3/releases/x86_64/alpine-3.3.0-x86_64.iso'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# create mount directory
directory '/mnt/iso-disk' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# mount -o loop /root/alpine-3.3.0-x86_64.iso /mnt/iso-disk
mount '/mnt/iso-disk' do
  device '/root/alpine-3.3.0-x86_64.iso'
  options 'loop'
  action [:mount, :enable]
end
