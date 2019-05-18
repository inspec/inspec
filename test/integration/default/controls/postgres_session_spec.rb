if ENV['DOCKER']
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__.split("/").last} because we are running in docker\033[0m"
  return
end

# postgres-server is installed on these platforms
if ['ubuntu', 'centos'].include? os['family']
  postgres = postgres_session('postgres', 'inspec')
  describe postgres.query('show ssl;') do
    its('output') { should eq 'on' }
  end
end
