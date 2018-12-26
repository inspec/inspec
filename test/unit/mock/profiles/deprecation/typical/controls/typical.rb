# encoding: utf-8

# Notice: line numbers are sensitive!  They are used for stacktrace testing in functional/loggin_test.rb

control 'deprecate_fail_mode' do

  describe 'test-01' do
    it { should include 'test-01' }
  end

  describe deprecation_tester do
    its('fail_me') { should cmp 'never reached' }
  end

  describe 'test-03' do
    it { should include 'test-03' }
  end

end


control 'deprecate_exit_mode_implicit' do

  describe 'test-01' do
    it { should include 'test-01' }
  end

  describe deprecation_tester do
    its('exit_me_default_code') { should cmp 'never reached' }
  end

  # Never reached
  describe 'test-03' do
    it { should include 'test-03' }
  end

end

control 'deprecate_exit_mode_explicit' do

  describe 'test-01' do
    it { should include 'test-01' }
  end

  describe deprecation_tester do
    its('exit_me_explicit_code') { should cmp 'never reached' }
  end

  # Never reached
  describe 'test-03' do
    it { should include 'test-03' }
  end

end

control 'deprecate_warn_mode' do

  describe 'test-01' do
    it { should include 'test-01' }
  end

  describe deprecation_tester do
    its('warn_me') { should cmp 'warn_me_return_value' }
  end

  describe 'test-03' do
    it { should include 'test-03' }
  end

end

control 'deprecate_ignore_mode' do

  describe 'test-01' do
    it { should include 'test-01' }
  end

  describe deprecation_tester do
    its('ignore_me') { should cmp 'ignore_me_return_value' }
  end

  describe 'test-03' do
    it { should include 'test-03' }
  end

end