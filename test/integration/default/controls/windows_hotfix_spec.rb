# encoding: utf-8

# the following test will iterate over all packages retrieved via Powershell and
# verify that the a sampling of them are installed
if os.windows?

  # test that a KB is not installed
  describe windows_hotfix("KB000000") do
    it { should_not be_installed }
  end

  # get all the KBs applied
  content = powershell('Get-WmiObject -class "win32_quickfixengineering"').stdout.split()
  filter = /^KB\d{7}$/
  kbs = content.select { |i| i =~ filter }

  # test every 10th package for speed
  (0..kbs.length).step(10).each do |package|
    describe windows_hotfix(kbs[package]) do
      it { should be_installed }
    end
  end
end
