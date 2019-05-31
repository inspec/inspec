include_recipe 'runit::default'

# put ctl in alt location
directory '/opt/chef/embedded/sbin' do
  recursive true
  action :create
end

link '/opt/chef/embedded/sbin/sv' do
  to '/sbin/sv' # default location
end

runit_service 'running-runit-service' do
  default_logger true
  run_template_name 'default-svlog'
end

runit_service 'not-enabled-runit-service' do
  default_logger true
  run_template_name 'default-svlog'
  start_down true
  action :enable
end

runit_service 'not-running-runit-service' do
  default_logger true
  run_template_name 'default-svlog'
  action :create
end

execute 'sv down not-running-runit-service'
