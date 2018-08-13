describe attribute('val_string') do
  it { should cmp 'test-attr' }
end

describe attribute('val_boolean') do
  it { should cmp true }
end

describe attribute('val_regex') do
  it { should cmp '/^\d*/'}
end

check_array = [ 'a', 'b', 'c' ]
describe attribute('val_array') do
  it { should cmp check_array }
end

check_hash = { a: true, b: false, c: '123' }
describe attribute('val_hash') do
  it { should cmp check_hash }
end

include_controls 'myprofile1'
