
return unless command('ssh').exists?

describe ssh_config do
  its('SendEnv') { should include('GORDON_CLIENT')}
end

