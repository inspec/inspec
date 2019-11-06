include_controls 'failures'

describe file('/') do
  it { should be_directory }
end
