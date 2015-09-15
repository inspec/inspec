# preparation
file '/tmp/file' do
  mode '0765'
  owner 'root'
  group 'root'
  content 'hello world'
end

directory '/tmp/folder' do
  mode '0567'
  owner 'root'
	group 'root'
end

link '/tmp/symlink'do
  to '/tmp/file'
	owner 'root'
	group 'root'
	mode '0777'
end

# execute tests
execute 'bundle install' do
  command '/opt/chef/embedded/bin/bundle install'
  cwd '/tmp/kitchen/data'
end

execute 'run tests' do
  command '/opt/chef/embedded/bin/ruby -I lib test/runner/test.rb test/runner/tests/*_test.rb'
  cwd '/tmp/kitchen/data'
end
