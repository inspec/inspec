if ENV['DOCKER']
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__.split("/").last} because we are running in docker\033[0m"
  return
end

if os.windows?
  describe filesystem('c:') do
    its('size') { should be >= 1 }
  end
else
  describe filesystem('/') do
    its('size') { should be >= 1 }
  end
end
