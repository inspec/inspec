if os.linux?
  # uses the `cmp` matcher instead of the eq matcher
  describe sshd_config do
    its('Port') { should eq '22' }
    its('Port') { should_not eq 22 }

    its('Port') { should cmp '22' }
    its('Port') { should cmp 22 }
    its('Port') { should cmp 22.0 }
    its('Port') { should_not cmp 22.1 }

    its('LogLevel') { should eq 'VERBOSE' }
    its('LogLevel') { should_not eq 'verbose'}

    its('LogLevel') { should cmp 'VERBOSE' }
    its('LogLevel') { should cmp 'verbose' }
    its('LogLevel') { should cmp 'VerBose' }
  end

  describe passwd.passwords.uniq do
    it { should eq ['x'] }
    it { should cmp ['x'] }
    it { should cmp 'x' }
  end

  describe passwd.users do
    it { should include 'root' }
    it { should_not cmp 'root' }
  end

  len = passwd.passwords.length
  describe len do
    it { should cmp len.to_s }
  end

  describe 122 do
    it { should cmp 122 }
    it { should cmp < 133 }
    it { should cmp > 111 }
    it { should_not cmp < 122 }
    it { should_not cmp > 122 }
    it { should cmp <= 122 }
    it { should cmp >= 122 }
    it { should cmp >= -666 }
    it { should_not cmp <= 111 }
    it { should_not cmp >= 133 }
    it { should cmp /122/ }
    it { should_not cmp /133/ }
  end

  describe 0o640 do
    it { should cmp 0o640 }
    it { should cmp > 100 }
    it { should_not cmp <= 0 }
    it { should cmp == '416' }
    it { should cmp /416$/ }
  end

  describe '12' do
    it { should cmp 12 }
    it { should cmp < 13 }
    it { should cmp > 11 }
    it { should_not cmp < 12 }
    it { should_not cmp > 12 }
    it { should cmp <= 12 }
    it { should cmp >= 12 }
    it { should cmp >= -666 }
    it { should_not cmp <= 11 }
    it { should_not cmp >= 13 }
  end

  describe '-12' do
    it { should cmp -12 }
    it { should cmp < -11 }
    it { should cmp > -13 }
    it { should_not cmp < -12 }
    it { should_not cmp > -12 }
    it { should cmp <= -12 }
    it { should cmp >= -12 }
    it { should cmp >= -666 }
    it { should_not cmp <= -13 }
    it { should_not cmp >= -11 }
  end

  # versions
  describe '2.4.12' do
    it { should cmp == '2.4.12' }
    it { should cmp >= '2.4.5' }
    it { should cmp >= '2.4.2' }
    it { should cmp <= '2.4.20' }
    it { should cmp <= '3.0' }
    it { should cmp < '2.4.22' }
    it { should cmp < '3.5' }
    it { should cmp < '3.5.1' }
    it { should cmp > '1' }
    it { should cmp > '1.0' }
    it { should cmp > '1.0.1' }
    it { should cmp > '2.4.1' }
    it { should cmp > '2.4.1.2' }
    it { should cmp > '2.4.0.1-alpha' }
  end

  # Don't compare octal to number
  describe '07' do
    it { should_not cmp 7 }
  end

  describe 'some 123' do
    it { should cmp 'some 123' }
    it { should cmp /^SOME\s\d+(1|2|3)3/i }
    it { should_not cmp /^SOME/ }
  end

  describe ['some-array'] do
    it { should cmp 'some-array' }
    it { should cmp /.+/ }
    it { should_not cmp /^SOME/ }
  end

  describe '' do
    it { should_not cmp >= 3 }
    it { should_not cmp < 3 }
    it { should_not cmp /.+/ }
  end

  describe nil do
    it { should cmp nil }
    it { should_not cmp >= 3 }
    it { should_not cmp < 3 }
    it { should_not cmp /something/ }
  end

  describe true do
    it { should cmp 'true' }
    it { should cmp 'True' }
    it { should cmp true }
  end

  describe false do
    it { should cmp 'false' }
    it { should cmp 'False' }
    it { should cmp false }
  end

  describe 0 do
    it { should cmp 0 }
    it { should cmp 00 }
    it { should cmp '0' }
    it { should cmp '00' }
    it { should_not cmp 1 }
    it { should_not cmp '01' }
  end

end
