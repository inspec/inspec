# encoding: utf-8

if os.linux?
  # uses the `cmp` matcher instead of the eq matcher
  describe sshd_config do
    its('Port') { should eq '22' }
    its('Port') { should_not eq 22 }

    its('Port') { should cmp '22' }
    its('Port') { should cmp 22 }
    its('Port') { should cmp 22.0 }
    its('Port') { should_not cmp 22.1 }

    its('LogLevel') { should eq 'INFO' }
    its('LogLevel') { should_not eq 'info'}

    its('LogLevel') { should cmp 'INFO' }
    its('LogLevel') { should cmp 'info' }
    its('LogLevel') { should cmp 'InfO' }
  end
end
