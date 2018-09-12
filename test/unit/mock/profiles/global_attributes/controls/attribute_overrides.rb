control 'test using the val_numeric_override with a default in the inspec.yml overridden by the secrets file' do
  desc 'test the val_numeric_override attr'
  describe attribute('val_numeric_override') do
    it { should cmp 9999 }
  end
end
