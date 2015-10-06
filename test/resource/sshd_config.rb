# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

return unless command('sshd').exist?

describe sshd_config do
  its('AcceptEnv') { should include('GORDON_SERVER') }
end
