
return unless command('ssh').exists?

describe ssh_config do
  its('SendEnv') { should include('GORDON_CLIENT')}
end

describe sshd_config do
  its('AcceptEnv') { should include('GORDON_SERVER')}
end
