
execute 'bundle install' do
  command '/opt/chef/embedded/bin/bundle install'
  cwd '/tmp/kitchen/data'
end

execute 'run tests' do
  command '/opt/chef/embedded/bin/ruby -I lib test/runner/local_test.d/test.rb'
  cwd '/tmp/kitchen/data'
end
