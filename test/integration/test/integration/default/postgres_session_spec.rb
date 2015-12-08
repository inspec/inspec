# encoding: utf-8

# postgres-server is installed on these platforms
if ['ubuntu', 'centos'].include? os['family']
  postgres = postgres_session('postgres', 'inspec')
  describe postgres.query('show ssl;') do
    its('output') { should eq 'on' }
  end
end
