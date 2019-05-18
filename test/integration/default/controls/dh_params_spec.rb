
if os.windows?
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__} because we are not on Linux.\033[0m"
  return
end

describe dh_params('/tmp/example.dh_pem') do
  it { should be_dh_params }
  it { should be_valid }
  its('generator') { should eq 2 }
  its('prime_length') { should eq 2048 }
end
