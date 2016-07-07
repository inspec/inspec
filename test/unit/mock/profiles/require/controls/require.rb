# encoding: utf-8

control 'require' do
  title 'tests if inspec is able to load source via require'
  impact 0.5
  describe require_load do
    it { should be_working }
  end
end
