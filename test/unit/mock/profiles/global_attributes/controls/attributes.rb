val_user = attribute('user', default: 'alice', description: 'An identification for the user')
val_user_override = attribute('val_user_override', default: 'alice', description: 'An identification for the user')

describe val_user do
  it { should cmp 'alice' }
end

describe val_user_override do
  it { should cmp 'bob' }
end

describe attribute('val_numeric') do
  it { should cmp 443 }
end

describe attribute('val_int') do
  it { should cmp '72' }
end

describe attribute('val_int_override') do
  it { should cmp 9999 }
end

describe attribute('val_float') do
  it { should cmp 44.33 }
end
