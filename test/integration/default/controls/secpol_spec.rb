
unless os.windows?
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__} because we are not on Windows.\033[0m"
  return
end

describe security_policy do
  its('EnableAdminAccount') { should eq 1 }
  its('EnableGuestAccount') { should eq 0 }
end
