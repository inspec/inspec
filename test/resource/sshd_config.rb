
return unless command('sshd').exists?

describe sshd_config do
  its('AcceptEnv') { should include('GORDON_SERVER')}
end
