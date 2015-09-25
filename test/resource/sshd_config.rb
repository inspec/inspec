# encoding: utf-8
return unless command('sshd').exist?

describe sshd_config do
  its('AcceptEnv') { should include('GORDON_SERVER') }
end
