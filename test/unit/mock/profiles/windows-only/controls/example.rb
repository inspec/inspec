# copyright: 2015, The Authors

control 'dhcp-disabled' do
  title 'DHCP is disabled'
  describe windows_feature('dhcp') do
    it { should be_installed }
  end
end

control 'cdrive' do
  title 'Has a C://'
  describe file("C://") do
    it { should be_directory }
  end
end
