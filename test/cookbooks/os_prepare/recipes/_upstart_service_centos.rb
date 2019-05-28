directory '/etc/init' do
  action :create
end

file "/etc/init/upstart-running.conf" do
  content "exec tail -f /dev/null"
end

file "/etc/init/upstart-enabled-not-running.conf" do
  content "exec tail -f /dev/null\nstart on networking"
end

file "/etc/init/upstart-enabled-and-running.conf" do
  content "exec tail -f /dev/null\nstart on networking"
end

%w{ enabled-and-running running }.each do |srv|
  service "upstart-#{srv}" do
    provider Chef::Provider::Service::Upstart
    action :start
  end
end
