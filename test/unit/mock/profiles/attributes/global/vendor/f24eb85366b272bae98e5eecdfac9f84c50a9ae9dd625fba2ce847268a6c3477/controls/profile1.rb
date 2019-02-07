describe 'test child attribute when using a profile without a name override' do
  subject { attribute('val_numeric') }
  it { should cmp 654321 }
end

control 'test override control on parent using child attribute' do
  describe 'dummy' do
    it { should cmp 9999 }
  end
end

control 'test override control on parent using parent attribute' do
  describe 'dummy' do
    it { should cmp 9999 }
  end
end

control 'test child attribute inside a it block when using a profile without a name override' do
  describe '654321' do
    it { should cmp attribute('val_numeric') }
  end
end
