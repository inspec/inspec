# encoding: utf-8
# copyright: 2015, Chef Software, Inc

title 'Proc Filesystem Configuration'

control 'test01' do
  impact 0.5
  title 'Catchy title'
  desc '
    There should always be a /proc
  '
  describe file('/proc') do
    it { should be_mounted }
  end
end
