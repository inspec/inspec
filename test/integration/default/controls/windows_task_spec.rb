return unless os.windows?

if os.release.to_f == 6.3
  # describe a task that exists on Windows 2012 R2
  # Test the task without the resource
  describe powershell('Test-Path $env:windir\System32\schtasks.exe') do
    its('stdout') { should match(/^True/) }
  end

  describe windows_task('\Microsoft\Windows\AppID\PolicyConverter') do
    it { should exist }
    it { should be_disabled }
    its('logon_mode') { should eq 'Interactive/Background' }
    its('last_result') { should eq '1' }
    its('task_to_run') { should cmp '%Windir%\system32\appidpolicyconverter.exe' }
    its('run_as_user') { should eq 'LOCAL SERVICE' }
  end

  describe windows_task('\Microsoft\Windows\AppID\SmartScreenSpecific') do
    it { should be_enabled }
  end

  # Testing regular expressions
  describe windows_task('\Microsoft\Windows\AppID\VerifiedPublisherCertStoreCheck') do
    its('task_to_run') { should match(/^[a-zA-Z0-9%]*\\[a-zA-Z0-9]*\\[a-zA-Z0-9\.]*$/) }
  end
end

if os.release.to_f == 6.1
  # describe a task that exists on Windows 2008 R2
  describe windows_task('\Microsoft\Windows\Defrag\ScheduledDefrag') do
    it { should exist }
    it { should be_enabled }
    its('logon_mode') { should eq 'Interactive/Background' }
    its('last_result') { should eq '1' }
    its('task_to_run') { should cmp '%windir%\system32\defrag.exe -c' }
    its('run_as_user') { should eq 'SYSTEM' }
  end
end
