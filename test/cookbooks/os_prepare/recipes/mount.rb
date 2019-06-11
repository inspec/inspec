#
# file mount tests

case node["platform"]
when "ubuntu", "rhel", "centos", "fedora"

  # copy iso file for mount tests
  # NB created using `mkdir empty; mkisofs -o empty.iso empty/`
  cookbook_file "/tmp/empty.iso" do
    owner "root"
    group "root"
    mode "0755"
    action :create
  end

  # create mount directory
  directory "/mnt/iso-disk" do
    owner "root"
    group "root"
    mode "0755"
    action :create
  end

  # mount -o loop /root/empty.iso /mnt/iso-disk
  mount "/mnt/iso-disk" do
    device "/tmp/empty.iso"
    options "loop"
    action [:mount, :enable]
  end
end
