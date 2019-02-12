val_user = attribute('val_user', default: 'alice', description: 'An identification for the user')
val_user_override = attribute('val_user_override', default: 'alice', description: 'An identification for the user')

describe 'reading an input in a file-level definition with a default value' do
  subject { val_user }
  it { should cmp 'alice' }
end

describe 'reading an input in a file-level definition with a default value and a value in secrets file' do
  subject { val_user_override }
  it { should cmp 'bob' }
end

control 'test using an input inside a control block as the describe subject' do
  desc 'test the val_numeric attr'
  describe attribute('val_user') do
    it { should cmp 'alice' }
  end
end

# test using a input outside controls and as the describe subject
describe attribute('val_user') do
  it { should cmp 'alice' }
end

control "test using inputs in the test it's block" do
  describe 'alice' do
    it { should cmp attribute('val_user') }
  end
end

