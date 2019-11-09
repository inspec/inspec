include_controls 'failures'

describe file('/tmp') do
  it { should be_directory }
end
