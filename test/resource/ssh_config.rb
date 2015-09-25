# encoding: utf-8
return unless command('ssh').exist?

describe ssh_config do
  its('SendEnv') { should include('GORDON_CLIENT') }
end
