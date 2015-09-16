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

execute 'create pipe/fifo' do
  command 'mkfifo /tmp/pipe'
  not_if 'test -e /tmp/pipe'
end

execute 'create block_device' do
  command 'mknod /tmp/block_device b 7 7 && chmod 0666 /tmp/block_device && chown root:root /tmp/block_device'
  not_if 'test -e /tmp/block_device'
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
