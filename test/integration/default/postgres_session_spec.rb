# encoding: utf-8

# TODO: do not run those tests on docker yet
return if ENV['DOCKER']

# postgres-server is installed on these platforms
if ['ubuntu', 'centos'].include? os['family']
  postgres = postgres_session('postgres', 'inspec')
  describe postgres.query('show ssl;') do
    its('output') { should eq 'on' }
  end
end
