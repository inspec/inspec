# encoding: utf-8
val_user = attribute('user', default: 'alice', required: true)
val_password = attribute('password', required: true)

# that works
describe 'bob' do
  it { should eq val_user.value }
end

describe 'secret' do
  it { should eq val_password.value }
end

describe val_user.value do
  it { should eq 'bob' }
end

describe val_password.value do
  it { should eq 'secret' }
end
