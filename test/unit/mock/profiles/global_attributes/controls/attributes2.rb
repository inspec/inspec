describe 'test the val_string attribute set in the global inspec.yml' do
  subject { attribute('val_string') }
  it { should cmp 'test-attr' }
end

describe 'test the val_boolean attribute set in the global inspec.yml' do
  subject { attribute('val_boolean') }
  it { should cmp true }
end

describe 'test the val_regex attribute set in the global inspec.yml' do
  subject { attribute('val_regex') }
  it { should cmp '/^\d*/'}
end

describe 'test the val_array attribute set in the global inspec.yml' do
  subject { attribute('val_array') }
  check_array = [ 'a', 'b', 'c' ]
  it { should cmp check_array }
end

describe 'test the val_hash attribute set in the global inspec.yml' do
  subject { attribute('val_hash') }
  check_hash = { a: true, b: false, c: '123' }
  it { should cmp check_hash }
end

include_controls 'child_profile_NEW_NAME'

include_controls 'child_profile2' do
  control 'test override control on parent using child attribute' do
    describe attribute('val_int') do
      it { should cmp 654321 }
    end
  end

  control 'test override control on parent using parent attribute' do
    describe Inspec::Attributes['attributes']['val_int'].value do
      it { should cmp 72 }
    end
  end
end
