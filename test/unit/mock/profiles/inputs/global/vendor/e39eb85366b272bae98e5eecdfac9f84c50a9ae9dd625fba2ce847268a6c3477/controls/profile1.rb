describe 'test child attribute when using a profile with a name override' do
  subject { attribute('val_numeric') }
  it { should cmp '123456' }
end

control 'test child attribute inside a it block when using a profile with a name override' do
  describe '123456' do
    it { should cmp attribute('val_numeric') }
  end
end
