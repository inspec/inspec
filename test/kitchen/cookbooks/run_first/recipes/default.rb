# inject the current inspec gem for use with audit cookbook
# this is generated via Rake test:integration
cookbook_file "/root/inspec-core-local.gem" do
  source "inspec-core-local.gem"
  action :create
end

chef_gem "inspec" do
  source "/root/inspec-core-local.gem"
end

