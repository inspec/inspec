# encoding: utf-8

unless os.windows?
  STDERR.puts "\033[1;33mTODO: Not running #{__FILE__} because we are not on Windows.\033[0m"
  return
end

describe security_identifier({ user: 'Administrator' }) do
  its('sid') { should match %r{S-1-5-21.+-500} }
end

describe security_identifier({ unspecified: 'Administrator' }) do
  its('sid') { should match %r{S-1-5-21.+-500} }
end

# If not appropriate, sid just returns the name back
describe security_identifier({ group: 'Administrator' }) do
  its('sid') { should eq 'Administrator' }
end

describe security_identifier({ group: 'Administrators' }) do
  its('sid') { should eq 'S-1-5-32-544' }
end

describe security_identifier({ unspecified: 'Administrators' }) do
  its('sid') { should eq 'S-1-5-32-544' }
end

# If not appropriate, sid just returns the name back
describe security_identifier({ user: 'Administrators' }) do
  its('sid') { should eq 'Administrators' }
end
