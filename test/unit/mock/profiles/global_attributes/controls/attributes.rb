val_user = attribute('user', default: 'alice', description: 'An identification for the user')
val_user_override = attribute('val_user_override', default: 'alice', description: 'An identification for the user')

describe 'reading an attribute in a file-level definition with a default value' do
  subject { val_user }
  it { should cmp 'alice' }
end

describe 'reading an attribute in a file-level definition with a default value and a value in secrets file' do
  subject { val_user_override }
  it { should cmp 'bob' }
end

control 'test using an attribute inside a control block as the describe subject' do
  desc 'test the val_numeric attr'
  describe attribute('val_numeric') do
    it { should cmp 443 }
  end
end

# test using a attribute outside controls and as the describe subject
describe attribute('val_int') do
  it { should cmp '72' }
end

control 'test using the val_int_override with a default in the inspec.yml overridden by the secrets file' do
  desc 'test the val_int_override attr'
  describe attribute('val_int_override') do
    it { should cmp 9999 }
  end
end

describe 'test the val_float attribute set in the global inspec.yml' do
  subject { attribute('val_float') }
  it { should cmp 44.33 }
end

control "test using attributes in the test it's block" do
  describe '44.33' do
    it { should cmp attribute('val_float') }
  end
end

describe 'test attribute when no default or value is set' do
  subject { attribute('val_no_default').respond_to?(:fake_method) }
  it { should cmp true }
end
