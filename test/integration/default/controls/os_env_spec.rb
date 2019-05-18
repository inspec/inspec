unless os.windows?
    $stderr.puts "\033[1;33mTODO: Not running #{__FILE__} because we are not on Windows.\033[0m"
    return
end

describe os_env('TEMP') do
  its('content') {should eq 'C:\TEMPUSER' }
end

describe os_env('TEMP', 'system') do
  its('content') { should eq 'C:\TEMPSYSTEM' }
end

describe os_env('TEMP', 'user') do
  its('conten') { should eq 'C:\TEMPUSER'}
end
