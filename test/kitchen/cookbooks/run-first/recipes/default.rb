cookbook_file "/root/inspec.gem" do
  source "inspec.gem"
  action :create
end

chef_gem "inspec" do
  source "/root/inspec.gem"
end

