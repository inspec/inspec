describe 'test the val_string attribute set in the global inspec.yml' do
  subject { attribute('val_string') }
  it { should cmp 'test-attr' }
end

describe 'test the val_numeric attribute set in the global inspec.yml' do
  subject { attribute('val_numeric') }
  it { should cmp 443 }
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

describe 'test attribute when no default or value is set' do
  subject { attribute('val_no_default').respond_to?(:fake_method) }
  it { should cmp true }
end

describe 'test attribute with no defualt but has type' do
  subject { attribute('val_no_default_with_type').respond_to?(:fake_method) }
  it { should cmp true }
end

empty_hash_attribute = attribute('val_with_empty_hash_default', {})
describe 'test attribute with default as empty hash' do
  subject { empty_hash_attribute }
  it { should cmp 'success' }
end
